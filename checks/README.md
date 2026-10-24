# Run the course checks

Requirements: Python 3.9+, the `mysql` client on PATH, and an accessible
MySQL 8.0.18+ server. No Python packages are required. Docker is optional.

The runner **resets the four course tables in mysql_learning** and executes
every lesson's examples and answers, then all eight project reports. It also
checks known results, constraint rejection, rollback, and unchanged seed rows.
Only use it on your dedicated learning database. No accounts are modified.

To avoid prompting once per connection, configure a login path first:

```sh
mysql_config_editor set --login-path=learning --host=localhost --user=root --password
python3 checks/run.py --reset -- --login-path=learning
```

For Docker with a host mysql client, use --host=127.0.0.1 --port=3307 in the
login-path setup command. Connection arguments after `--` go to the mysql
client; `--reset` is the explicit opt-in for replacing the practice tables.
You may also use an existing, permission-protected option file:

```sh
python3 checks/run.py --reset -- --defaults-extra-file=/path/to/private.cnf
```

Do not pass passwords on the command line. Never use --force: SQL errors must
fail validation. The checker leaves the seeded row values unchanged; auto-
increment counters can advance during rolled-back insert demonstrations.
The checker creates and removes sandbox tables, a view, and an index through
the lessons, so it needs corresponding DDL rights in the course database.
Advanced lessons also need CREATE TEMPORARY TABLES, CREATE ROUTINE,
ALTER ROUTINE, EXECUTE, and TRIGGER privileges. Use the disposable server
setup rather than granting these rights to a production application account.

For lessons 21 onward, answers are also compared with each lesson's
`expected-answers.tsv`. Lesson numbering must remain consecutive.

Expected project output is checked against `expected-project.tsv` with exact
row order and numeric formatting. Execution plans, server version strings,
and account grants are intentionally not compared across installations.
A failing run prints a nonzero exit status and details. Re-run with --reset
after resolving an error; interrupted DDL demos can leave sandbox objects.

This verifies syntax and results on your running server. It does not benchmark
index performance or automatically exercise the manual backup/restore lab.
