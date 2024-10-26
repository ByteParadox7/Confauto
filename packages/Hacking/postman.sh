#!/bin/bash

wget https://dl.pstmn.io/download/latest/linux64 -O postman-linux-x64.tar.gz

tar -xvzf postman-linux-x64.tar.gz -C /opt

chmod 755 /opt/Postman/Postman && chown $MYUSER:$MYUSER /opt/Postman/Postman

ln -s /opt/Postman/Postman /usr/bin/postman

rm -rf postman-linux-x64.tar.gz