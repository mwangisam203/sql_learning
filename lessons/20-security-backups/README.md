# 20. Secure queries and practice backup recovery

## Goal
Pass values safely, understand privileges, and rehearse recovering data.

### Bind values instead of building SQL strings

Applications should use the database driver's parameter binding:

```python
# mysql-connector-python example; conn is an existing connection.
# This is an illustration, not an installed course dependency.
with conn.cursor() as cursor:
    cursor.execute(
        "SELECT customer_id, full_name FROM customers WHERE email = %s",
        (user_supplied_email,),
    )
    rows = cursor.fetchall()
```

Do not format, concatenate, or use an f-string with user values in SQL. The
placeholder syntax depends on your driver. A placeholder binds a **value**,
not a table name, column name, or ASC/DESC. Choose dynamic identifiers from
an explicit allowlist of trusted SQL fragments.

`examples.sql` demonstrates the server-side PREPARE/EXECUTE syntax using `?`.
This is distinct from a Python driver's `%s` syntax. It works in the mysql
client and requires no external Python package.

### Use appropriate accounts

Root is convenient for creating this disposable local course schema. An
application should use its own account with only the permissions it needs.
For a reporting app, SELECT may be sufficient. A reader example is included
as **commented administrator SQL**; replace the host and password yourself.
MySQL accounts are identified by both user and host. In MySQL 8, CREATE USER
and GRANT are separate statements. Never commit passwords, .env, credential
option files, or real data dumps. Review account privileges with SHOW GRANTS.

### Back up and test a restore

These shell commands use a configured login path to avoid repeated prompts.
Run them on a disposable native local server, from the repository root:

```sh
mysql_config_editor set --login-path=learning --host=localhost --user=root --password
mkdir -p backups
mysqldump --login-path=learning --single-transaction --no-tablespaces \
  --set-gtid-purged=OFF --routines --events --triggers \
  mysql_learning > backups/mysql_learning.sql
mysql --login-path=learning -e "CREATE DATABASE mysql_learning_restore CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci"
mysql --login-path=learning mysql_learning_restore < backups/mysql_learning.sql
mysql --login-path=learning mysql_learning_restore -e "SELECT COUNT(*) FROM customers"
```

The login-path file is obfuscated, not strong secret encryption; protect your
OS account and file permissions. For Docker from a host client, configure the
login path with `--host=127.0.0.1 --port=3307`. Adapt account details to your
installation. A failed dump may leave a partial file: check the command's exit
status before restoring it. Choose a fresh restore database name if it exists.

This dump deliberately omits `--databases`, so it contains no database-level
USE instruction that redirects table restoration into the source database.
It is a local logical backup example; it does not include users or privileges,
or establish a production replication/recovery strategy. Review qualified
object references and DEFINER clauses before moving complex dumps elsewhere.
The lesson view is dropped after its demos; its definition is preserved in SQL.

--single-transaction gives a consistent InnoDB snapshot. It does not make
nontransactional tables consistent; avoid concurrent DDL during the dump.
Backups can expose all copied data. Store real backups securely and regularly
test restoration and required access. A dump file existing is not proof of a
successful recovery. Compare row counts, constraints, and report totals.

## Practice

Read `exercises.sql`, try the parameterized query, and compare with
`answers.sql`. The course runner executes no account changes or shell backup
commands. Try the restore manually in the separate restore database.

## Check yourself

The prepared lookup returns Amina for amina@example.test. A restored seed
should contain six customers, eight orders, thirteen lines, and 174.00 revenue.
