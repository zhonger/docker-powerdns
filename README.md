# PowerDNS Docker Image

## Description

This is a dockerlized image to build Docker images for PowerDNS Authoritative Nameserver services.

In order to use it more easily, we uploaded the image to three independent image hosting platforms:

- [Docker Hub](https://hub.docker.com/r/zhonger/pdns)
- [Quay.io](https://quay.io/repository/zhonger/pdns)
- [Aliyun](https://registry.cn-shanghai.aliyuncs.com/zhonger/pdns) (Shanghai)

## Features

- The basic function is to provide PowerDNS Authoritative Nameserver.
- Considering the diversity of CPU arch nowadays, we provide 8 archs including amd64, i386, arm64 and so on.
- Other small features: sqlite backend support.

## How to use it

It's very easy to use it through `docker-compose` (**Recommend**).

```yaml
# docker-compose.yml
version: "3"

services:
  pdns:
    image: zhonger/pdns:latest
    environment:
     - PDNS_launch=gsqlite3
     - PDNS_gsqlite3_database=/var/lib/powerdns/pdns.sqlite3
     - PDNS_webserver_address=0.0.0.0
     - PDNS_webserver_allow_from=127.0.0.1,10.0.0.0/8,172.0.0.0/8,192.168.0.0/16
     - PDNS_api=yes
     - PDNS_api_key={Random Long Secret}
    stdin_open: true
    tty: true
    ports:
     - "853:53/tcp"
     - "853:53/udp"
     - "8081:8081/tcp"
    volumes:
     - /etc/localtime:/etc/localtime:ro
     - ./pdns-data:/var/lib/powerdns
    restart: always
```

```bash
docker-compose up -d
```

## More

We also provide `pdns` docker image based on `alpine` image (smaller) with `zhonger/pdns:apline` tag. And the usage is the same as `zhonger/pdns:latest` tag.

If you want to know more about the idea and details, you can refer to [《Docker 镜像构建之 PowerDNS 篇》](https://lisz.me/tech/docker/powerdns.html). (Sorry, it's only Chinese now. In the future, we will provide English version.)

## 简介

这个 Docker 镜像是为构建 PowerDNS 权威域名解析服务而准备的。

为了便于使用，我们将镜像上传到了三个独立的镜像托管平台：

- [Docker Hub](https://hub.docker.com/r/zhonger/pdns)
- [Quay.io](https://quay.io/repository/zhonger/pdns)
- [Aliyun](https://registry.cn-shanghai.aliyuncs.com/zhonger/pdns) (上海)

## 特性

- 本镜像的基础功能是提供 PowerDNS 权威域名解析服务。
- 考虑现今 CPU 架构的多样性，本镜像支持包括 amd64、i386、arm64 等在内的 8 种架构。
- 其他小特性：sqlite 后端支持。

## 如何使用

通过 `docker-compose` 可以非常方便使用本镜像（**推荐**）。

```yaml
# docker-compose.yml
version: "3"

services:
  pdns:
    image: zhonger/pdns:latest
    environment:
     - PDNS_launch=gsqlite3
     - PDNS_gsqlite3_database=/var/lib/powerdns/pdns.sqlite3
     - PDNS_webserver_address=0.0.0.0
     - PDNS_webserver_allow_from=127.0.0.1,10.0.0.0/8,172.0.0.0/8,192.168.0.0/16
     - PDNS_api=yes
     - PDNS_api_key={Random Long Secret}
    stdin_open: true
    tty: true
    ports:
     - "853:53/tcp"
     - "853:53/udp"
     - "8081:8081/tcp"
    volumes:
     - /etc/localtime:/etc/localtime:ro
     - ./pdns-data:/var/lib/powerdns
    restart: always
```

```bash
docker-compose up -d
```

## 了解更多

我们也提供基于 `alpine` 镜像的更小构建版本 `zhonger/pdns:apline`，欢迎使用。使用方法与基于 `Ubuntu` 镜像的构建版本完全相同。

关于本镜像的更多思考和详细步骤，请访问 [《Docker 镜像构建之 PowerDNS 篇》](https://lisz.me/tech/docker/powerdns.html) 了解更多。