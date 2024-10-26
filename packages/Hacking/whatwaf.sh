#!/bin/bash

DIR_TOOL="$DIR_TOOLS/whatwaf"
REPO_GIT="https://github.com/Ekultek/WhatWaf.git"
PATH_EXECUTABLE="$DIR_TOOL/whatwaf"
LINK_EXECUTABLE="whatwaf"


mkdir -p $DIR_TOOL

git clone $REPO_GIT $DIR_TOOL

/home/$MYUSER/.python_env/venv/bin/pip3 install -r "$DIR_TOOL/requirements.txt"

sed -i "1s/.*/#!\/home\/$MYUSER\/.python_env\/venv\/bin\/python3/" $PATH_EXECUTABLE

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE

su - $MYUSER -c "mkdir -p ~/.whatwaf && cp -r $DIR_TOOL/content/*/ ~/.whatwaf && touch ~/.whatwaf/whatwaf.sqlite"

ln -s $PATH_EXECUTABLE "/usr/bin/$LINK_EXECUTABLE"


# Configuration personnalisé

# TODO