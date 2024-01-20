FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget \
    && sudo chmod 777 v2ray.sh

RUN /bin/bash -c 'source ./v2ray.sh' 
