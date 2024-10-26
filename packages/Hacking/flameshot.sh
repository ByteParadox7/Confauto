#!/bin/bash
DIR_TOOL="$DIR_TOOLS/flameshot"
PATH_EXECUTABLE="$DIR_TOOL/Flameshot.AppImage"


# Installation d'un programme depuis le dépôt Linux

apt install imagemagick -y

mkdir -p $DIR_TOOL

curl --remote-name \
    --remote-header-name \
    --location $(curl -s https://api.github.com/repos/flameshot-org/flameshot/releases/latest \
                | grep -Po 'https://github.com/flameshot-org/flameshot/releases/download/[^}]*\.AppImage' \
                | uniq)


mv Flameshot-*.x86_64.AppImage $PATH_EXECUTABLE

chmod 755 $PATH_EXECUTABLE && chown $MYUSER:$MYUSER $PATH_EXECUTABLE


su - $MYUSER -c "wget https://seeklogo.com/images/F/flameshot-logo-329402212F-seeklogo.com.png -O ~/.local/share/applications/flameshot.png"

su - $MYUSER -c "convert ~/.local/share/applications/flameshot.png -resize 200x200 ~/.local/share/applications/flameshot.png"

echo -e "[Desktop Entry]
Name=Flameshot GUI
Exec=$PATH_EXECUTABLE gui
Type=Application
Icon=/home/$MYUSER/.local/share/applications/flameshot.png
Terminal=false
" > /home/$MYUSER/.local/share/applications/flameshot-gui.desktop