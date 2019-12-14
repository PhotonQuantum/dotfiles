#!/bin/bash

sudo rm /etc/resolv.conf
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

sudo systemctl enable --now bluetooth
sudo systemctl enable --now iwd
sudo systemctl enable --now systemd-networkd
sudo systemctl enable --now systemd-networkd-wait-online
sudo systemctl enable --now systemd-resolved
sudo systemctl enable --now boinc-client
sudo systemctl enable --now iptables
sudo systemctl enable --now ufw
sudo systemctl enable --now intel-undervolt
sudo systemctl enable lightdm
systemctl --user enable --now onedrive
sudo systemctl enable --now avahi-daemon
sudo systemctl enable gopreload
sudo systemctl enable mk-lvm-snapshots
sudo systemctl enable tlp tlp-sleep
sudo systemctl disable dhcpcd
