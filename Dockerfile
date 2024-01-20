FROM debian:sid

RUN set -ex\
    && apt update -y \
    && apt upgrade -y \
    && apt install -y wget

RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

RUN rm -rf /usr/local/etc/xray/config.json

RUN echo "{"log":{"loglevel":"none"},"inbounds":[{"listen":"0.0.0.0","port":20,"protocol":"vless","settings":{"clients":[{"id":"97368ffa-2a16-45e5-aee3-73405aec9aac","level":0,"email":"love@v2fly.org"}],"decryption":"none"},"streamSettings":{"network":"tcp"}}],"outbounds":[{"protocol":"freedom","settings":{},"tag":"tag1"}]}" > /usr/local/etc/xray/config.json

RUN systemctl enable xray
RUN systemctl start xray

EXPOSE 20
