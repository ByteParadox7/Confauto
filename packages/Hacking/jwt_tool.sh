#!/bin/bash

DIR_TOOL="$DIR_TOOLS/jwt_tool"
REPO_GIT="https://github.com/ticarpi/jwt_tool.git"
PATH_EXECUTABLE="$DIR_TOOL/jwt_tool.py"
LINK_EXECUTABLE="jwt_tool"


mkdir -p $DIR_TOOL

git clone $REPO_GIT $DIR_TOOL

/home/$MYUSER/.python_env/venv/bin/pip3 install -r "$DIR_TOOL/requirements.txt"

sed -i "1s/.*/#!\/home\/$MYUSER\/.python_env\/venv\/bin\/python3/" $PATH_EXECUTABLE

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE

ln -s $PATH_EXECUTABLE "/usr/bin/$LINK_EXECUTABLE"