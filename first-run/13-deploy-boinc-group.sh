#!/bin/bash
sudo usermod -a -G boinc lightquantum
ln -s /var/lib/boinc/gui_rpc_auth.cfg ~/gui_rpc_auth.cfg
sudo chmod 640 ~/gui_rpc_auth.cfg
