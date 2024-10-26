#!/bin/bash

DIR_TOOL="$DIR_TOOLS/sstimap"
REPO_GIT="https://github.com/vladko312/SSTImap"
PATH_EXECUTABLE="$DIR_TOOL/sstimap.py"
LINK_EXECUTABLE="sstimap"


mkdir -p $DIR_TOOL

git clone $REPO_GIT $DIR_TOOL

/home/$MYUSER/.python_env/venv/bin/pip3 install -r "$DIR_TOOL/requirements.txt"

sed -i "1s/.*/#!\/home\/$MYUSER\/.python_env\/venv\/bin\/python3/" $PATH_EXECUTABLE

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE

ln -s $PATH_EXECUTABLE "/usr/bin/$LINK_EXECUTABLE"