#!/bin/bash

# Proxy
sudo pacman --needed -S clash proxychains-ng
cd /etc
sudo yadm -Y /etc/yadm checkout proxychains.conf
sudo systemctl enable --now clash@lightquantum.service
cd ~

# Install yay
sudo pacman --needed -S powerpill
sudo yadm -Y /etc/yadm checkout powerpill/powerpill.json
cd /tmp
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ~

# Restoring packages
HTTP_PROXY="http://localhost:8888" gpg --recv-keys 1C61A2656FB57B7E4DE0F4C1FC918B335044912E
HTTP_PROXY='http://localhost:8888' yay --pacman powerpill --nodiffmenu --noeditmenu -S --ignore linux-zen-custom,linux-zen-custom-docs,linux-zen-custom-headers --needed - < /etc/pkglist.txt

# Restoring configs
cd /etc
sudo yadm -Y /etc/yadm reset --hard HEAD
cd ~
yadm reset --hard HEAD
