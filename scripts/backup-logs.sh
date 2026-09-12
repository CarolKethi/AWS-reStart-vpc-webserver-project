#!/bin/bash
# backup-logs.sh
# Backs up Apache log files and uploads them to S3

TIMESTAMP=$(date +%F-%H%M)
BACKUP_FILE="/tmp/httpd-logs-$TIMESTAMP.tar.gz"

sudo tar -czf $BACKUP_FILE /var/log/httpd
aws s3 cp $BACKUP_FILE s3://caroline-restart-backups-v2/
sudo rm -f $BACKUP_FILE

echo "Backup completed: $TIMESTAMP"
