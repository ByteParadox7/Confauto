#!/bin/bash

DIR_TOOL="$DIR_TOOLS/burpsuite-pro"
SRC_TOOL="https://portswigger.net/burp/releases/startdownload?product=pro&type=Jar"
PATH_EXECUTABLE="$DIR_TOOL/burpsuite_pro.jar"


apt install openjdk-21-jre imagemagick -y

mkdir -p $DIR_TOOL

wget $SRC_TOOL -O $DIR_TOOL/burpsuite_pro.jar

su - $MYUSER -c "wget https://downloadlynet.ir/wp-content/uploads/2023/10/Burp-Suite-Professional.png -O /home/$MYUSER/.local/share/applications/BurpSuitePro.png"

su - $MYUSER -c "convert ~/.local/share/applications/BurpSuitePro.png -resize 200x200 ~/.local/share/applications/BurpSuitePro.png"


convert BurpSuitePro.png -resize 128x128 BurpSuitePro.png

echo -e "#!/usr/bin/env xdg-open
[Desktop Entry]
Type=Application
Name=Burp Suite Professional
Exec=java -jar $PATH_EXECUTABLE
Icon=/home/$MYUSER/.local/share/applications/BurpSuitePro.png
Terminal=false
Categories=Development;Security;" >> "/home/$MYUSER/.local/share/applications/burpsuite.desktop"

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE

chmod +x /home/$MYUSER/.local/share/applications/burpsuite.desktop && chown $MYUSER:$MYUSER /home/$MYUSER/.local/share/applications/burpsuite.desktop