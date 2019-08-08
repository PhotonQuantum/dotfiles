#!/bin/bash
cat firejail.list | sudo tee -a /usr/lib/firejail/firecfg.config > /dev/null
sudo firecfg
