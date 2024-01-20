FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget

RUN /bin/bash -c 'source ./v2ray.sh' 
