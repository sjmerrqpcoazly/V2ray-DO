#!/bin/bash
ufw disable

bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

rm -rf /usr/local/etc/xray/config.json
cat << EOF > /usr/local/etc/xray/config.json
{
"log":{"loglevel":"none"},
"inbounds":[
{"listen":"0.0.0.0","port":20,"protocol":"vless",
"settings":{
"clients":[
{"id":"97368ffa-2a16-45e5-aee3-73405aec9aac","level":0,"email":"love@v2fly.org"}
],"decryption":"none"},
"streamSettings":{"network":"tcp"}
}],
"outbounds":[{"protocol":"freedom","settings":{},"tag":"tag1"}]
}
EOF

systemctl enable xray
systemctl restart xray

mkdir ~/across
git clone https://github.com/teddysun/across ~/across
chmod 777 ~/across
bash ~/across/bbr.sh
