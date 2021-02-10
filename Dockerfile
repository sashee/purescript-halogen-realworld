FROM ubuntu:20.04

RUN apt update

ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y wget git libtinfo5 nodejs npm

RUN mkdir -p /opt
RUN cd /opt && wget -qO- https://github.com/coot/zephyr/releases/download/v0.3.2/Linux.tar.gz | tar -zxf-
RUN ln -s /opt/zephyr/zephyr /usr/bin/zephyr

RUN npm install -g --unsafe-perm=true purescript spago

WORKDIR /data

CMD npm ci && npm run bundle
