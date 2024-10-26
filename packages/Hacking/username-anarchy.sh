#!/bin/bash

DIR_TOOL="$DIR_TOOLS/username-anarchy"
REPO_GIT="https://github.com/urbanadventurer/username-anarchy.git"
PATH_EXECUTABLE="$DIR_TOOL/username-anarchy"
LINK_EXECUTABLE="username-anarchy"


mkdir -p $DIR_TOOL

git clone $REPO_GIT $DIR_TOOL

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE

ln -s $PATH_EXECUTABLE /usr/bin/$LINK_EXECUTABLE
