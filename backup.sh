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
    $SERVER:/opt/marzban/db.sqlite3 \
    $SERVER:/opt/marzban/.env \
    $SERVER:/usr/local/etc/xray/config.json \
    $SERVER:/etc/nginx/sites-available/default \
    "$BACKUP_DIR"

echo "Backup completed successfully at $BACKUP_DIR"
