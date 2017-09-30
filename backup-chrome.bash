#!/usr/bin/env bash
###################

cd ~/

# Check to see if ~/Documents/backups/Google-Chrome/ exists. If it doesn't, create it.
if [ ! -d ~/Documents/backups/Google-Chrome/ ]; then
    echo  "~/Documents/backups/Google-Chrome/ does not exist. Creating it now..."
    mkdir -p ~/Documents/backups/Google-Chrome/
    echo "Done."
fi

# Check to see if ~/Documents/backups/Google-Chrome/profile.tar.gz exists. If it does, move it to profile.tar.gz.old.
if [ -f ~/Documents/backups/Google-Chrome/profile.tar.gz ]; then
    echo "~/Documents/backups/Google-Chrome/profile.tar.gz already exists. Moving to profile.tar.gz.old..."
    mv ~/Documents/backups/Google-Chrome/profile.tar.gz ~/Documents/backups/Google-Chrome/profile.tar.gz.old
    echo "Done."
fi

# Check to see if "~/Library/Application Support/Google/Chrome/Default/" exists. If it does, back it up to ~/Documents/backups/Google-Chrome/profile.tar.gz. If it doesn't, notify the user and exit.
if [ -d ~/Library/Application\ Support/Google/Chrome/Default/ ]; then
    echo "Backing up Google Chrome personal files..."
    tar -czf ~/Documents/backups/Google-Chrome/profile.tar.gz  Library/Application\ Support/Google/Chrome/Default/ 2>/dev/null
    while [ $? -ne 0 ]; do
        tar -czf ~/Documents/backups/Google-Chrome/profile.tar.gz  Library/Application\ Support/Google/Chrome/Default/ 2>/dev/null
    done
    echo "Done."
elif [ ! -d ~/Library/Application\ Support/Google/Chrome/Default/ ]; then
    echo "~/Library/Application Support/Google/Chrome/Default/ does not exist: nothing to back up: exiting."
    exit 1
fi


exit 0
