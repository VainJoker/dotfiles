#!/bin/bash
# ====================================================
#   Copyright (C)2020 All rights reserved.
#
#   Author        : VainJoker
#   Email         : vainjoker@163.com
#   File Name     : copy.sh
#   Last Modified : 2020-01-07 22:00
#   Describe      :
#
# ====================================================

# cp -u $HOME/.vimrc $HOME/MyVim/_vimrc
# cp -r -u $HOME/.config/nvim $HOME/MyVim/
# cp -r -u $HOME/.config/coc $HOME/MyVim
#
# cp -r -u $HOME/dwm $HOME/MyConfig/
# cp -r -u $HOME/st $HOME/MyConfig/
# cp -r -u $HOME/.config/ranger $HOME/MyConfig/
# cp -r -u $HOME/Scripts $HOME/MyConfig/
# cp -u $HOME/.zshrc $HOME/MyConfig/zsh/_zshrc

pacman -Qqen > listQqen.txt
pacman -Qqem > listQqem.txt

cp -r -u $HOME/listQqen.txt $HOME/MyConfig/listQqen.txt
cp -r -u $HOME/listQqem.txt $HOME/MyConfig/listQqem.txt
