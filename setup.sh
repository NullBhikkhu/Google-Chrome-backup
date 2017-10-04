#!/bin/bash
###########

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd ~/

#  Get link directory.
echo -n "Enter the directory (folder) where you'd like to put links to the original scripts (example: Desktop/, Documents/scripts/, etc.: "
read script_dir

#  Continually test if directory exists until it does.
while [ ! -d "$script_dir" ]; do
    echo -n "Either the directory you've entered doesn't exist, or you've entered the folder wrong. Please try again: "
    read script_dir
done

#  Check if ~/.bin exists. If it doesn't, create it.
if [ ! -d ~/.bin/google-chrome-backup/ ]; then
    mkdir -p ~/.bin/google-chrome-backup/
fi

#  Move backup-chrome.sh and restore-backup.sh and copy setup.sh to ~/.bin.
cp $DIR/{backup-chrome.sh,restore-backup.sh} ~/.bin/google-chrome-backup/
cp $DIR/setup.sh ~/.bin/google-chrome-backup/.setup.sh

#  Create the links to the files in the directory the user specified.
cd "$script_dir"
ln -s ~/.bin/backup-chrome.sh  ./
ln -s ~/.bin/restore-backup.sh ./


exit 0
