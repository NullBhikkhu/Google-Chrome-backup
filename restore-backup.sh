#!/bin/bash
###########

backup_file=~/.backup-data/Google-Chrome/profile.tar.gz
orig_dir=~/Library/Application\ Support/Google/Chrome/Default/
cd ~/

#  If ~/.backup-data/Google-Chrome/profile.tar.gz exists, remove all the files in
#+ ~/Library/Application\ Support/Google/Chrome/Default/ and extract ~/.backup-data/Google-Chrome/profile.tar.gz.
#+ If ~/.backup-data/Google-Chrome/profile.tar.gz does not exist, notify the user and exit.
if [ -f "$backup_file" ]; then
    echo "Restoring backup..."
    rm -R "$orig_dir" 2>/dev/null
    tar -xf "$backup_file"
    echo "Done."
elif [ ! -f "$backup_file" ]; then
    echo "No backup file exists. Cannot restore a nonexistant backup: exiting: nothing changed."
    exit 1
fi


exit 0
