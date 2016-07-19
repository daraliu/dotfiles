#!/bin/zsh
# Add org file changes to the repository
cd /home/$USER/orgfiles
# Remove deleted files
git ls-files --deleted -z | xargs -0 git rm >/dev/null 2>&1
# Add new files
git add . >/dev/null 2>&1
git commit -m "$(date) ${USER}@${HOST} -- ${OSTYPE}"
git push
