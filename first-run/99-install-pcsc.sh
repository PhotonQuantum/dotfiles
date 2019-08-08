#!/bin/bash

sudo pacman -S pcsclite ccid
sudo systemctl enable --now pcscd
