#!/bin/bash
cd /etc
sudo chown root $(tty)
GPG_TTY=$(tty) sudo --preserve-env=GPG_TTY yadm -Y /etc/yadm decrypt
sudo chown lightquantum $(tty)
sudo chmod 644 pam.d/*
sudo chmod 0440 sudoers
sudo chmod u+s $(which i3lock)
