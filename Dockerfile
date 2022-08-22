FROM ubuntu:latest

LABEL maintainer="zhonger zhonger@live.cn"

# APT updates
RUN apt update \
    && apt upgrade -y \

# Install something
RUN apt install -y git

# Clean APT-cache
RUN apt autoremove -y \
    && apt clean -y \
    && rm -rf /var/lib/apt/lists/*

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]