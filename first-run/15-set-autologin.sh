#!/bin/bash
groupadd -r autologin
gpasswd -a lightquantum autologin
groupadd -r nopasswdlogin
gpasswd -a lightquantum nopasswdlogin
