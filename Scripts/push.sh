#!/bin/bash
# ====================================================
#   Copyright (C)2020 All rights reserved.
#
#   Author        : VainJoker
#   Email         : vainjoker@163.com
#   File Name     : push.sh
#   Last Modified : 2020-02-06 21:47
#   Describe      :
#
# ====================================================


echo -e "copying\n"
cd ~/Scripts
./copy.sh
cd ~/Myvim/
git rm -r coc/extensions
echo -e "\n\ncopy completed\n\n"
echo -e "\n\npush myvim\n"
cd ~/Myvim
git add .
echo -e "\n\n输入 Myvim 的Commit\n\n"
read MyvimCommit
git commit -m "$MyvimCommit"
git push origin master
echo -e "\n\nvim  completed\n\n"
echo -e "\n\npush myconfig\n"
cd ~/Myconfig
git add .
echo -e "\n\n输入 Myconfig 的Commit\n\n"
read MyconfigCommit
git commit -m "$MyconfigCommit"
git push origin master
echo -e "\n\nconfig completed\n\n"
