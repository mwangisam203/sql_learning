# Set up a practice server

Use MySQL 8.0.18 or newer. You need a **server** and a **client**; installing
only the client does not create a running database. Choose either path.
Commands below assume a terminal opened at this repository's root.

## Option A: existing local MySQL

Connect with an account permitted to create the learning database:

```sh
mysql -u root -p
```

Some Linux installs use `sudo mysql` for local administrator access instead.
Use your installation's authentication method; do not reset an existing root
password just to follow this course. `-p` prompts; never append your password.

Inside the mysql client:

```sql
SELECT VERSION(), CURRENT_USER(), DATABASE();
SOURCE data/reset.sql;
SHOW TABLES;
SOURCE lessons/01-select/examples.sql;
```

## Option B: Docker Compose

Install Docker with Compose support first, then:

```sh
cp .env.example .env
# Edit .env and replace the example password.
docker compose up -d
# Repeat until the service reports healthy.
docker compose ps
# Open a client inside the container; enter your .env password when prompted.
docker compose exec mysql mysql -u root -p
```

The health check tests whether the server responds, not whether your password
is correct. The volume retains data between restarts. Changing the environment
password after the volume is initialized does not change the database password.

The container cannot see the repository by default. To use SOURCE there, copy
only the course directories into it from a second terminal:

```sh
docker compose cp data mysql:/tmp/data
docker compose cp lessons mysql:/tmp/lessons
docker compose cp project mysql:/tmp/project
```

Exit the first client and start it with `/tmp` as its working directory,
so the relative SOURCE paths resolve correctly:

```sh
docker compose exec -w /tmp mysql mysql -u root -p
```

Now `SOURCE data/reset.sql;` and the lesson SOURCE commands work. Re-copy a
directory after changing its files. To run the Python checker, use a host
Python 3 and host mysql client connected to `127.0.0.1` port `3307`.

```sh
docker compose stop
# Later: docker compose start
```

`docker compose down` removes the container but retains the named volume.
Adding `--volumes` deletes that volume and its databases; do that only when
you intentionally want to discard this local practice instance.

## Running files and resetting

In a native client opened from the repository root:

```sql
SOURCE data/reset.sql;
SOURCE lessons/08-inner-join/examples.sql;
SOURCE lessons/08-inner-join/answers.sql;
```

`reset.sql` drops the course view, drops only the four named course tables,
recreates their schema, and reloads the seed. Any changes to those objects
are lost. Use a dedicated `mysql_learning` database and account. Do not put
unrelated tables in it; additional foreign keys can prevent a reset.

Run lessons separately after setup. Write demos roll back DML; schema demos
create and remove their own sandbox objects. No automatic GRANT, DROP USER,
or whole-database deletion is performed by the course runner.

## Useful client commands

- `status` shows connection details; `exit` leaves the client.
- `SHOW DATABASES;` lists databases visible to your account.
- `USE mysql_learning;` selects the course database for this connection.
- `SHOW TABLES;` and `DESCRIBE customers;` inspect objects.
- `SHOW CREATE TABLE orders;` shows constraints and exact table SQL.
- `\c` cancels the unfinished statement at the client prompt.
- MySQL statements end with `;`. A continuation prompt usually means the
  statement is unfinished or a quote has not been closed.

If the client cannot connect, check server status, host, port, and socket.
For access denied, check account name, account host, and authentication.
`USE` is session-specific: reconnecting does not preserve the selection.
