docker buildx create --use

docker buildx build --platform linux/amd64,linux/arm64 --push -t travisaustin/wordpress-docker-with-restic-backup:`date +%s` -t travisaustin/wordpress-docker-with-restic-backup:latest ./build/wordpress-backup
