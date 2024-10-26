#!/bin/bash

DIR_TOOL="$DIR_TOOLS/reconspider"
URL_ARCHIVE="https://academy.hackthebox.com/storage/modules/144/ReconSpider.v1.2.zip"
PATH_EXECUTABLE="$DIR_TOOL/ReconSpider.py"
LINK_EXECUTABLE="reconspider"

su - $MYUSER -c "/home/$MYUSER/.python_env/venv/bin/pip install scrapy"

mkdir -p $DIR_TOOL

wget $URL_ARCHIVE -q --show-progress -O $DIR_TOOL/reconspider.zip

unzip $DIR_TOOL/reconspider.zip && mv ReconSpider.py $DIR_TOOL

sed -i "1s/^/#!\/home\/$MYUSER\/.python_env\/venv\/bin\/python3\n/" $PATH_EXECUTABLE
sed '2{/^#!/d;}' $PATH_EXECUTABLE > $DIR_TOOL/temp.txt && mv $DIR_TOOL/temp.txt $PATH_EXECUTABLE

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE

ln -s $PATH_EXECUTABLE "/usr/bin/$LINK_EXECUTABLE"
