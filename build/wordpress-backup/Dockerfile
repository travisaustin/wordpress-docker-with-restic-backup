# FROM alpine:3.17
FROM php:cli

# RUN set -x \
#     && apk add --no-cache supercronic shadow mysql-client openssl restic bash

RUN apt-get update \
    && apt-get install -y \
    restic \
    default-mysql-client
    
ARG TARGETARCH

RUN echo Target Arch ${TARGETARCH}

RUN curl -fsSLO "https://github.com/aptible/supercronic/releases/download/v0.2.25/supercronic-linux-${TARGETARCH}" \
 && chmod +x "supercronic-linux-${TARGETARCH}" \
 && mv "supercronic-linux-${TARGETARCH}" "/usr/local/bin/supercronic"

COPY crontab /crontab

COPY wp-backup /usr/local/bin/wp-backup
RUN chmod +x /usr/local/bin/wp-backup

COPY wp-restore /usr/local/bin/wp-restore
RUN chmod +x /usr/local/bin/wp-restore

COPY wp-list /usr/local/bin/wp-list
RUN chmod +x /usr/local/bin/wp-list

COPY wp-cleanup /usr/local/bin/wp-cleanup
RUN chmod +x /usr/local/bin/wp-cleanup

CMD supercronic crontab