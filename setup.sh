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
if [ ! -d .bin/ ]; then
    mkdir -p .bin/
fi

#  Move backup-chrome.bash and restore-backup.bash and copy setup.bash to ~/.bin.
mv $DIR/{backup-chrome.bash,restore-backup.bash} .bin/
cp $DIR/setup.bash .bin/.setup.bash

#  Create the links to the files in the directory the user specified.
cd "$script_dir"
ln -s ~/.bin/backup-chrome.bash ./
ln -s ~/.bin/restore-backup.bash ./

cd ~/


exit 0
