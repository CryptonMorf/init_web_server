# !/bin/bash

set -e

apt update
apt upgrade -y
apt install nginx certbot python3-certbot-nginx

ufw allow ssh
ufw allow 'Nginx Full'
ufw delete allow 'Nginx HTTP'
ufw enable

sysctl -w net.core.somaxconn=4096

mkdir -p /home/www/fish.com