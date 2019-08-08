#!/bin/bash

proxychains -q curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/installer.sh
chmod +x /tmp/installer.sh
proxychains -q bash /tmp/installer.sh ~/.cache/dein
proxychains -q nvim +qall
