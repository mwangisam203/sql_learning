#!/usr/bin/env python3
"""Execute the real MySQL course and verify results using only the stdlib."""
import argparse
import difflib
from pathlib import Path
import re
import shutil
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--reset', action='store_true',
                        help='allow replacing the four mysql_learning course tables')
    parser.add_argument('mysql_args', nargs=argparse.REMAINDER,
                        help='mysql connection options after --; prefer --login-path')
    args = parser.parse_args()
    if not args.reset:
        parser.error('pass --reset to opt into replacing the disposable course tables')
    connection = args.mysql_args
    if connection[:1] == ['--']:
        connection = connection[1:]
    if any(option in ('-f', '--force') or option.startswith('--force=') for option in connection):
        parser.error('--force must not suppress SQL errors')
    if not shutil.which('mysql'):
        parser.error('mysql client not found on PATH')
    # Option-file and login-path arguments precede normal flags as mysql requires.
    command = ['mysql', *connection, '--batch', '--raw', '--skip-column-names',
               '--default-character-set=utf8mb4']
    calls = 0

    def execute(sql, expected_error=None):
        nonlocal calls
        calls += 1
        process = subprocess.run(command, input=sql, cwd=ROOT, text=True,
                                 capture_output=True, timeout=60)
        errors = re.findall(r'ERROR (\d+)', process.stderr)
        if expected_error is not None:
            if str(expected_error) not in errors:
                raise AssertionError(f'Expected MySQL error {expected_error}; '
                                     f'got exit={process.returncode}, stderr={process.stderr}')
        elif process.returncode or errors:
            raise RuntimeError(f'MySQL failed ({process.returncode}):\n{process.stderr}')
        return process.stdout.strip()

    def expect(sql, expected, label):
        actual = execute('USE mysql_learning;\n' + sql)
        if actual != expected:
            diff = '\n'.join(difflib.unified_diff(expected.splitlines(), actual.splitlines(),
                                                  fromfile='expected', tofile='actual', lineterm=''))
            raise AssertionError(f'{label}:\n{diff}')

    version = execute('SELECT VERSION();')
    match = re.match(r'(\d+)\.(\d+)\.(\d+)', version)
    if not match or 'mariadb' in version.lower() or tuple(map(int, match.groups())) < (8, 0, 18):
        raise RuntimeError(f'Requires MySQL 8.0.18+; found {version}')
    identity = execute('SELECT @@hostname, @@port, CURRENT_USER();')
    print(f'MySQL {version}; target: {identity}', flush=True)
    modes = execute('SELECT @@SESSION.sql_mode;').split(',')
    if 'ONLY_FULL_GROUP_BY' not in modes or not {'STRICT_TRANS_TABLES', 'STRICT_ALL_TABLES'} & set(modes):
        raise RuntimeError('Enable ONLY_FULL_GROUP_BY and strict SQL mode before running')

    execute('SOURCE data/reset.sql;')
    # Interrupted earlier demos may have left their explicitly named sandbox objects.
    execute('USE mysql_learning; DROP TABLE IF EXISTS lesson_schema_demo; '
            'DROP TABLE IF EXISTS lesson_migration_practice;')
    expect('SELECT (SELECT COUNT(*) FROM customers), (SELECT COUNT(*) FROM products), '
           '(SELECT COUNT(*) FROM orders), (SELECT COUNT(*) FROM order_items);',
           '6\t6\t8\t13', 'seed counts')
    snapshot_sql = '\n'.join([
        'SELECT * FROM customers ORDER BY customer_id;',
        'SELECT * FROM products ORDER BY product_id;',
        'SELECT * FROM orders ORDER BY order_id;',
        'SELECT * FROM order_items ORDER BY order_id, product_id;',
    ])
    initial_rows = execute('USE mysql_learning;\n' + snapshot_sql)

    lesson_files = sorted(ROOT.glob('lessons/*/examples.sql'))
    if len(lesson_files) != 20:
        raise AssertionError(f'Expected 20 lessons, found {len(lesson_files)}')
    executed_files = 0
    for example in lesson_files:
        for path in (example, example.with_name('answers.sql')):
            execute(path.read_text())
            executed_files += 1
        # This checks every stored seed column, not just counts or revenue.
        expect(snapshot_sql, initial_rows, f'seed preservation after {example.parent.name}')
        print(f'PASS {example.parent.name}: examples, answers, seed preserved', flush=True)

    expected_project = (ROOT / 'checks/expected-project.tsv').read_text().strip()
    actual_project = execute((ROOT / 'project/solutions.sql').read_text())
    if actual_project != expected_project:
        diff = '\n'.join(difflib.unified_diff(expected_project.splitlines(), actual_project.splitlines(),
                                              fromfile='expected-project.tsv', tofile='actual', lineterm=''))
        raise AssertionError(f'Project results:\n{diff}')
    print('PASS all 8 project reports match expected rows', flush=True)

    expect('SELECT COUNT(*) FROM customers WHERE phone IS NULL;', '4', 'NULL handling')
    expect('SELECT COUNT(*) FROM products WHERE price > (SELECT AVG(price) FROM products);',
           '2', 'scalar subquery')
    expect('SELECT city, COUNT(*) FROM customers GROUP BY city HAVING COUNT(*) >= 2 ORDER BY city;',
           'Mombasa\t2\nNairobi\t3', 'grouping and HAVING')
    expect('START TRANSACTION; UPDATE products SET stock = stock - 2 '
           'WHERE product_id = 5 AND stock >= 2; SELECT ROW_COUNT(); '
           'SELECT stock FROM products WHERE product_id = 5; ROLLBACK; '
           'SELECT stock FROM products WHERE product_id = 5;',
           '1\n58\n60', 'rollback restores stock')
    expect('START TRANSACTION; UPDATE products SET stock = stock - 999 '
           'WHERE product_id = 5 AND stock >= 999; SELECT ROW_COUNT(); ROLLBACK;',
           '0', 'insufficient-stock guard')
    expect('WITH ranked AS (SELECT product_id, category, '
           'ROW_NUMBER() OVER (PARTITION BY category ORDER BY price DESC, product_id) AS pos '
           'FROM products) SELECT category, product_id FROM ranked WHERE pos = 1 ORDER BY category;',
           'electronics\t4\nhome\t3\nstationery\t1\ntravel\t6', 'window partitioning')
    invalid_writes = [
        (3819, 'UPDATE products SET stock = -1 WHERE product_id = 1;'),
        (3819, 'UPDATE order_items SET quantity = 0 WHERE order_id = 1 AND product_id = 1;'),
        (3819, "UPDATE orders SET status = 'unknown' WHERE order_id = 1;"),
        (1062, "UPDATE customers SET email = 'amina@example.test' WHERE customer_id = 2;"),
        (1452, 'UPDATE orders SET customer_id = 999999 WHERE order_id = 1;'),
        (1451, 'DELETE FROM customers WHERE customer_id = 1;'),
        (1048, 'UPDATE products SET price = NULL WHERE product_id = 1;'),
    ]
    for error_code, statement in invalid_writes:
        # On error the mysql process exits; closing the connection rolls back
        # the unfinished InnoDB transaction even if ROLLBACK was never reached.
        execute('USE mysql_learning; START TRANSACTION; ' + statement + ' ROLLBACK;',
                expected_error=error_code)
    expect(snapshot_sql, initial_rows, 'seed preserved after constraint failures')
    expect("SELECT COUNT(*) FROM information_schema.TABLES WHERE TABLE_SCHEMA = 'mysql_learning' "
           "AND TABLE_NAME IN ('lesson_schema_demo', 'lesson_migration_practice', 'v_order_totals');",
           '0', 'sandbox object cleanup')
    expect("SELECT COUNT(*) FROM information_schema.STATISTICS WHERE TABLE_SCHEMA = 'mysql_learning' "
           "AND INDEX_NAME = 'idx_lesson_orders_customer_date';", '0', 'demo index cleanup')
    print(f'PASS {executed_files} lesson SQL files, 8 reports, result checks, '
          f'7 constraint failures, and cleanup ({calls} mysql calls)', flush=True)


if __name__ == '__main__':
    try:
        main()
    except (OSError, subprocess.TimeoutExpired, RuntimeError, AssertionError) as error:
        print(f'FAIL: {error}', file=sys.stderr)
        sys.exit(1)
