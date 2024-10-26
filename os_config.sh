echo -e "deb http://deb.debian.org/debian/ sid main contrib non-free" > /etc/apt/sources.list



wget https://archive.kali.org/archive-key.asc -O kali-archive-key.asc
gpg --dearmor -o /usr/share/keyrings/kali-archive-keyring.gpg kali-archive-key.asc
echo "deb [signed-by=/usr/share/keyrings/kali-archive-keyring.gpg] https://http.kali.org/kali kali-rolling main contrib non-free" | sudo tee /etc/apt/sources.list.d/kali.list

echo -e "Package: *
Pin: release o=Debian
Pin-Priority: 900

Package: *
Pin: release o=Kali
Pin-Priority: 100
" > /etc/apt/preferences.d/kali

rm -rf kali-archive-key.asc

touch ~/.hushlogin