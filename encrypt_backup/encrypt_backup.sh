#!/bin/bash
# input: files and directories as arguments
# output: password-encrypted zip file, asks the password from user

if [[ $# -eq 0 ]] ; then
    echo 'Give args'
    exit 0
fi

final_filename='all.gpg'
date=$(date -I|tr -d '-') # YYYYMMDD
name='files_zipped.zip'
zip_name=$date$name
final_name=$date$final_filename

# zip. ${@} also contains $0, the script itself
zip -r $zip_name ${@} >&2

# encrypt the zip
gpg --output $final_name --symmetric $zip_name >&2

echo "Created $final_name" >&2
rm $zip_name
echo $final_name
