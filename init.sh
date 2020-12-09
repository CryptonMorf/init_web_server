# init ubuntu server with installing ghost cms
# https://raw.githubusercontent.com/CryptonMorf/init_web_server/master/init.sh
# !/bin/bash

set -e

# apt update
# apt upgrade -y
# apt install nginx certbot python3-certbot-nginx -y

# apt install mysql-server -y
# mysql <<< 'create user andy@localhost identified by "passwd";grant all privileges on *.* to andy@localhost;flush privileges;'

curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash
apt install nodejs -y

npm install ghost-cli@latest -g

ufw allow ssh
ufw allow 'Nginx Full'
ufw delete allow 'Nginx HTTP'
ufw enable <<< 'y'

sysctl -w net.core.somaxconn=4096

useradd andy
passwd andy
usermod -aG sudo andy
su andy

sudo mkdir -p /var/www/ghost
sudo chown andy:andy /var/www/ghost
sudo chmod 755 /var/www/ghost

cd /var/www/ghost
ghost install