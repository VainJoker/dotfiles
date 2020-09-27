#!/bin/bash
# ====================================================
#   Copyright (C)2020 All rights reserved.
#
#   Author        : VainJoker
#   Email         : vainjoker@163.com
#   File Name     : auto.sh
#   Last Modified : 2020-01-23 11:38
#   Describe      :
#
# ====================================================



cp -r -u $HOME/MyConfig/dwm $HOME/
cp -r -u $HOME/MyConfig/st $HOME/
cp -r -u $HOME/MyConfig/Pictures $HOME/
cp -r -u $HOME/MyConfig/Scripts $HOME/
cd $HOME/dwm
sudo make
sudo make clean install
./dwm/desktop.sh
cd $HOME/st
sudo make
sudo make clean install
cd $HOME
bash $HOME/MyConfig/zsh/install.sh
./MyConfig/YaHei-Consolas-Hybrid-1.12/install.sh
