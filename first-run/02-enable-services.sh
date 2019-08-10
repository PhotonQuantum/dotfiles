#!/bin/bash

sudo systemctl enable --now bluetooth
sudo systemctl enable --now iwd
sudo systemctl enable --now systemd-networkd
sudo systemctl enable --now systemd-networkd-wait-online
sudo systemctl enable --now boinc-client
sudo systemctl enable --now iptables
sudo systemctl enable --now ufw
sudo systemctl enable intel-undervolt
sudo systemctl enable lightdm
systemctl --user enable --now onedrive
