#!/bin/bash
###########

cd ~/

#  Check to see if ~/.backup-data/Google-Chrome/ exists. If it doesn't, create it.
if [ ! -d ~/.backup-data/Google-Chrome/ ]; then
  echo  "$HOME/.backup-data/Google-Chrome/ does not exist. Creating it now..."
  mkdir -p ~/.backup-data/Google-Chrome/
  echo "Done."
fi

#  Check to see if ~/.backup-data/Google-Chrome/profile.tar.gz exists.
#+ If it does, move it to profile.tar.gz.old.
if [ -f ~/.backup-data/Google-Chrome/profile.tar.gz ]; then
  echo "$HOME/.backup-data/Google-Chrome/profile.tar.gz already exists. Moving to profile.tar.gz.old..."
  mv ~/.backup-data/Google-Chrome/profile.tar.gz ~/.backup-data/Google-Chrome/profile.tar.gz.old
  echo "Done."
fi

#  Check to see if "~/Library/Application Support/Google/Chrome/Default/" exists.
#+ If it does, back it up to ~/.backup-data/Google-Chrome/profile.tar.gz.
#+ If it doesn't, notify the user and exit.
if [ -d ~/Library/Application\ Support/Google/Chrome/Default/ ]; then
  echo "Backing up Google Chrome personal files..."
  tar -czpf ~/.backup-data/Google-Chrome/profile.tar.gz  Library/Application\ Support/Google/Chrome/Default/ 2>/dev/null
  # Could end in an infinite feedback loop that will tear the world apart:
  while [ $? -eq 1 ]; do
    tar -czpf ~/.backup-data/Google-Chrome/profile.tar.gz  Library/Application\ Support/Google/Chrome/Default/ 2>/dev/null
  done
  echo "Done."
elif [ ! -d ~/Library/Application\ Support/Google/Chrome/Default/ ]; then
  echo "$HOME/Library/Application Support/Google/Chrome/Default/ does not exist: nothing to back up: exiting."
  exit 1
fi


exit 0
