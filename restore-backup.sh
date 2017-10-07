#!/bin/bash
###########

backup_file=~/.backup-data/Google-Chrome/profile.tar.gz
backup_file_old=~/.backup-data/Google-Chrome/profile.tar.gz.old
orig_dir=~/Library/Application\ Support/Google/Chrome/Default/
cd ~/

#  If ~/.backup-data/Google-Chrome/profile.tar.gz exists, remove all the files in
#+ ~/Library/Application\ Support/Google/Chrome/Default/ and extract ~/.backup-data/Google-Chrome/profile.tar.gz.
#+ If ~/.backup-data/Google-Chrome/profile.tar.gz does not exist,
#+ check to see if ~/.backup-data/Google-Chrome/profile.tar.gz.old exists.
#+ If it does, extract it (change to ask if user wants to extract it later),
#+ if it doesn't, notify the user and exit.
if [ -f "$backup_file" ]; then
    echo "Restoring backup..."
    rm -R "$orig_dir" 2>/dev/null
    tar -xpf "$backup_file"
    echo "Done."
elif [ ! -f "$backup_file" ]; then
    if [ -f "$backup_file_old" ]; then
        echo "profile.tar.gz not found. Restoring from profile.tar.gz.old..."
        rm -R "$orig_dir" 2>/dev/null
        tar -xpf "$backup_file_old"
        echo "Done."
        exit 1
    elif [ ! -f "$backup_file_old" ]; then
        echo "No backup files found. Cannot restore backup: exiting."
        exit 2
    fi
fi


exit 0
