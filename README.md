# Basic Ubuntu Docker Image

## Description

This is a basic Ubuntu image to build Docker images for different services.

In order to use it more easily, we uploaded the image to three independent image hosting platforms:

- [Docker Hub](https://hub.docker.com/r/zhonger/ubuntu)
- [Quay.io](https://quay.io/repository/zhonger/ubuntu)
- [Aliyun](https://registry.cn-shanghai.aliyuncs.com/zhonger/ubuntu) (Shanghai)

## Features

- The basic function is to provide ......
- Considering the diversity of CPU arch nowadays, we provide 8 archs including amd64, i386, arm64 and so on.
- Other small features: log files persistence, www data persistence.

## How to use it

It's very easy to use it through `docker-compose` (**Recommend**).

```yaml
# docker-compose.yml
version: "3"

services:
  ubuntu:
    image: zhonger/ubuntu:latest
    container_name: dev
    environment:
     - GITHUB_NAME=zhonger
    stdin_open: true
    tty: true
    ports:
     - 22:22
    volumes:
     - /etc/localtime:/etc/localtime
    restart: always
```

```bash
docker-compose up -d
```

## More

If you want to know more about the idea and details, you can refer to [《Docker 镜像构建之基础篇》](https://lisz.me/tech/docker/docker-build-begin.html). (Sorry, it's only Chinese now. In the future, we will provide English version.)

## 简介

这个 Ubuntu 基础镜像是为构建各种服务的 Docker 镜像而准备的。

为了便于使用，我们将镜像上传到了三个独立的镜像托管平台：

- [Docker Hub](https://hub.docker.com/r/zhonger/ubuntu)
- [Quay.io](https://quay.io/repository/zhonger/ubuntu)
- [Aliyun](https://registry.cn-shanghai.aliyuncs.com/zhonger/ubuntu) (上海)

## 特性

- 本镜像的基础功能是提供.....
- 考虑现今 CPU 架构的多样性，本镜像支持包括 amd64、i386、arm64 等在内的 8 种架构。
- 其他小特性：日志持久化、数据持久化。

## 如何使用

通过 `docker-compose` 可以非常方便使用本镜像（**推荐**）。

```yaml
# docker-compose.yml
version: "3"

services:
  ubuntu:
    image: zhonger/ubuntu:latest
    container_name: dev
    environment:
     - GITHUB_NAME=zhonger
    stdin_open: true
    tty: true
    ports:
     - 22:22
    volumes:
     - /etc/localtime:/etc/localtime
    restart: always
```

```bash
docker-compose up -d
```

## 了解更多

关于本镜像的更多思考和详细步骤，请访问 [《Docker 镜像构建之基础篇》](https://lisz.me/tech/docker/docker-build-begin.html) 了解更多。