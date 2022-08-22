FROM ubuntu:latest

LABEL maintainer="zhonger zhonger@live.cn"

EXPOSE 53/udp 53/tcp
EXPOSE 8081

USER root

# Install PDNS
RUN apt-get update \
    && apt-get install -y --no-install-recommends pdns-server pdns-backend-sqlite3 sqlite3

# Install envtpl & backup powerdns data
RUN apt-get install -y --no-install-recommends python3-minimal python3-pip \
    && pip install envtpl \
    && cp -r /var/lib/powerdns /opt/powerdns

COPY pdns.conf.tpl /pdns.conf.tpl

# Clean APT-cache
RUN apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

ADD ubuntu/entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]

CMD ["/entrypoint.sh"]