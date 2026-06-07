#!/bin/bash

# vars
SERVER="USER@HOST"
BACKUP_DIR="BACKUP_DIRECTORY/$(date +%Y-%m-%d_%H-%M)"
SSH_KEY="PATH_TO_SSH_KEY"
SSH_PORT="PORT_FOR_SSH"

mkdir -p "$BACKUP_DIR"

echo "Backup from $SERVER started..."

rsync -avR -e "ssh -i $SSH_KEY -p $SSH_PORT" \
    $SERVER:/opt/marzban/db.sqlite3 \
    $SERVER:/opt/marzban/.env \
    $SERVER:/var/local/etc/xray/config.json \
    "$BACKUP_DIR"

echo "Backup completed successfully at $BACKUPDIR"
