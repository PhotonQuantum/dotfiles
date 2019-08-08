#!/bin/bash

# Build yadm
cd /tmp
git clone https://aur.archlinux.org/yadm.git
cd yadm
makepkg -si
cd ~

# Restore home
yadm clone https://github.com/PhotonQuantum/dotfiles
yadm decrypt

# Restore /etc /usr
sudo chown root $(tty)
GPG_TTY=$(tty) sudo --preserve-env=GPG_TTY yadm -Y /etc/yadm clone -w /etc https://github.com/PhotonQuantum/etcfiles
GPG_TTY=$(tty) sudo --preserve-env=GPG_TTY yadm -Y /etc/yadm clone -w /usr https://github.com/PhotonQuantum/usrfiles
sudo chown lightquantum $(tty)
