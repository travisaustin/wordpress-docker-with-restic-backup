Host a WordPress site in Docker and automatically back it up to a remote S3-compatible bucket each hour.

This stack includes the standard WordPress Docker container, a MySQL 8.1 database host, and a container that backs up the WordPress filesystem and database automatically. The backups are executed using Restic and pushed to a remote AWS-S3-compatible host.

# Deployment Notes

You should store the contents of your .env file in a secure location. In the event that you need to restore your WordPress installation, you will need only the docker-compose.yml file and the .env file. The .env file, in particular, contains encryption keys for the backups and the contents of the .env file are vital for a successful restore.

# Force a backup now

```bash
docker compose exec wordpress-backup wp-backup
```

# Restore latest backup now

```bash
docker compose exec wordpress-backup wp-restore
```

# Notes on restoring to a new deployment

Bring the new deployment online with the same `docker-compose.yml` and `.env` files used in the original deployment, but be sure to add a new environment variable to the `docker-compose.yml` file in the `wordpress-backup` container. The new environment variable should be called `DISABLE` and set to `true`. This will prevent backups from running on this new deployments (for now).

Then, restore the data using `docker compose exec wordpress-backup wp-restore`. Once restored and you are happy with the restore, you can remove the `DISABLE` environment variable and then bring the stack back online.