#!/bin/sh

BACKUP_DIRS=(
	Desktop
	Documents
	Dropbox
)

for dir in "${BACKUP_DIRS[@]}"
do
    echo "### Backing up $dir"
    rclone copy --exclude-from ~/.rclone_excluded_files.txt ~/$dir s3:alombarte.laptop.backup/$dir

done