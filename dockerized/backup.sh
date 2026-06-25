#!/bin/bash

# load config
SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"

if [ -f "$SCRIPT_DIR/.env" ]; then
    source "$SCRIPT_DIR/.env"
    echo "config.env has been loaded successfully"
else
    echo "Error: config.env does not exist!"
    exit 1
fi


BACKUP_DIR="./$(date +%Y-%m-%d_%H-%M)"
mkdir -p "$BACKUP_DIR"

echo "Backup from $SERVER started..."

rsync -avR -e "ssh -i $SSH_KEY -p $SSH_PORT" \
    $SERVER:/opt/marzban/.env \
    $SERVER:/var/lib/marzban/xray_config.json \
    $SERVER:/var/lib/marzban/db.sqlite3 \
    $SEVER:/var/lib/marzban/certs/ \
    $SERVER:/etc/nginx/sites-available/ \
    $SERVER:/etc/nginx/ssl/ \
    "$BACKUP_DIR"

echo "Backup completed successfully at $BACKUP_DIR"
