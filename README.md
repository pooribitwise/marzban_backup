# marzban backup script (sqlite version)

## Intorduction:
This script backups the marzban and nginx reverse proxy configurations to the server executing it.
There are to main scripts named **backup.sh** under **dockerized/** and **baremetal/** according to the default configurations.
## Server configuration:
This must be done on the server side, with a sudo privillege user:
1. Ensure rsync is installed:
    * apt:
        ```bash
        sudo apt update
        sudo apt install rsync
        ```
    * dnf:
        ```bash
        sudo dnf install rsync
        ```
2. Make sure the files you want to backup are permited to read by the user you want to ssh with you can also ssh using root (I had my root login disabled):
    * baremetal:
        ```bash
        USER='YOUR_GROUP'
        sudo chgrp "$USER" \
        /opt/marzban/db.sqlite3 \
        /opt/marzban/.env \
        /usr/local/etc/xray/config.json \
        /etc/nginx/sites-availlable/default
        ```
    * dockerized:
        ```bash
        USER='YOUR_GROUP'
        sudo chgrp "$USER" \
        /opt/marzban/.env \
        /var/lib/marzban/xray_config.json \
        /var/lib/marzban/db.sqlite3 \
        /var/lib/marzban/certs/* \
        /etc/nginx/sites-available/ \
        /etc/nginx/ssl/* \
        sudo chmod g+r /etc/nginx/ssl/* /var/lib/marzban/certs/*
        ```
## Usage:
1. Create a copy of env.example to .env in the script you want to run directory:
```bash
cp env.example .env
```
2. Edit the enviromental variables:
```bash
# replace USER with your user which has privilage to your files
# replace HOST with your server's ip
SERVER="USER@HOST"
# replace PATH_TO_SSH_KEY with your private ssh key which can login to your server
SSH_KEY="PATH_TO_SSH_KEY"
# replace 22 with your configured ssh port if you are using any ports other than 22
SSH_PORT="22"
# backup directory can be configured in the backup.sh
```
3. Give the script executable permission:
```bash
chmod +x backup.sh
```
4. Run the script:
```bash
./backup.sh
```
