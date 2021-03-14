#!/bin/bash
# to configure rclone with Google Drive, see https://rclone.org/drive/
# edit backup_location to something else
backup_location="drive:changethisdirectory"
# file{1..3} are the files that will be backed up
final_name=$(./encrypt_backup.sh file1 file2 file3)
# will send backups to drive changethisdirectory directory
echo "Sending to $backup_location"
rclone copy $final_name $backup_location
echo "Backup ready!"
