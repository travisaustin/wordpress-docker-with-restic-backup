# 1. Copy `.env.sample` to `.env`:

```bash
cp .env.sample .env
```
# 2. Populate MYSQL_ROOT_PASSWORD, MYSQL_PASSWORD, RESTIC_PASSWORD with random values.

To automatically popualate these variables with random strings, execute this command:

```bash
cat .env | sed "s|^MYSQL_ROOT_PASSWORD=$|MYSQL_ROOT_PASSWORD='`dd if=/dev/urandom bs=1 count=32 status=none | base64`'|g" > .env
cat .env | sed "s|^MYSQL_PASSWORD=$|MYSQL_PASSWORD='`dd if=/dev/urandom bs=1 count=32 status=none | base64`'|g" > .env
cat .env | sed "s|^RESTIC_PASSWORD=$|RESTIC_PASSWORD='`dd if=/dev/urandom bs=1 count=32 status=none | base64`'|g" > .env
```

# 3. Populate the following additional variables:

- `RESTIC_BACKUP_HOSTNAME` This is the hostname that will be listed in the Restic repository when displaying snapshots for this backup. Enter the domain name of this website (or any other name that makes sense to you).
- `AWS_ACCESS_KEY_ID`: The access key for authenticating to the backend S3-compatible storage
- `AWS_SECRET_ACCESS_KEY`: The secret key for authenticating to the backend S3-compatible storage
- `RESTIC_REPOSITORY`: The S3 url of the remote storage to store the backups.
    - Example: `s3:https://s3.us-east-1.wasabisys.com/BUCKETNAME`