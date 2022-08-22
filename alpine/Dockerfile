FROM python:alpine

LABEL maintainer="zhonger zhonger@live.cn"

EXPOSE 53/udp 53/tcp
EXPOSE 8081

USER root

# APK updates
RUN apk update && apk upgrade

# Install PDNS
RUN apk add --no-cache pdns pdns-backend-sqlite3 sqlite

# Install envtpl & backup powerdns data
RUN pip install -U pip \
    && pip install envtpl

COPY pdns.conf.tpl /pdns.conf.tpl
COPY schema.sql /schema.sql

# Clean APK-cache
RUN rm -vrf /var/cache/apk/*

ADD alpine/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/entrypoint.sh"]