# Encrypted backup

## Prerequisites

rclone, zip and GnuPG

To configure rclone for Google Drive, see https://rclone.org/drive/

In `backup.sh`, set `backup_location="drive:directory"`, where `drive` is determined by what you set using `rclone config`, and `directory` is the directory path in your Google Drive. More information at https://rclone.org/drive/

In `backup.sh`, set the files to backup after `./encrypt_backup.sh`, see comments there.

## Usage 

`./backup.sh`
