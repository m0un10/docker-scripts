# MySQL Docker Scripts

## Interact with MySQL running in Docker

### Run Prompt

Opens a `mysql` prompt to the mysql database container

```bash
./mysql/run-script.sh <CONTAINER>
```

### Run Script

Runs an sql script against the mysql database container

```bash
./mysql/run-script.sh <CONTAINER> <SCRIPT>
```

## Run MySQL client as a Docker container

The MySQL image can be changed by setting `IMAGE` (e.g. `IMAGE=mysql:5`).
If not set, it will default to `mysql:5.6`.

### Run Prompt

```bash
USERNAME=? \
PASSWORD=? \
HOST=? \
mysql/client/run-prompt.sh
```

### Backup

The backup is written to a file name as `<DATABASE>-YYYY-MM-DD-HH-mm-ss.sql`.
Backups can be written locally or to an S3 bucket.

#### Backup to local file

Create a backup from a MySQL database and write it locally.

```bash
DATABASE=? \
USERNAME=? \
PASSWORD=? \
HOST=? \
mysql/client/backup-db.sh
```

#### Backup to S3

Create a backup from a MySQL database and write it in the given S3 bucket.

```bash
S3_BUCKET=s3://mybucket/backups \
DATABASE=? \
USERNAME=? \
PASSWORD=? \
HOST=? \
mysql/client/backup-db.sh
```

### Run Script

The scripts can be stored locally or in an S3 bucket. This approach can be used
to apply backups to existing MySQL instances. To apply a backup over the top of
an existing database (e.g. in a dev/test environment), you will need to add the `drop database <name>;` record to the top of the backup file.

#### Run local script

Create a backup from a MySQL database and write it locally.

```bash
USERNAME=? \
PASSWORD=? \
HOST=? \
mysql/client/run-script.sh /path/to/script.sql
```

#### Run script from S3

Create a backup from a MySQL database and write it in the given S3 bucket.

```bash
USERNAME=? \
PASSWORD=? \
HOST=? \
mysql/client/run-script.sh s3://mybucket/backups/script.sql
```

## Advanced Arguments for S3

When interacting with S3, it is possible to provider extra args with `S3_ARGS`
environment variable. For example, you may wish to run `S3_ARGS=--sse` to ensure
server-side encryption is set.
