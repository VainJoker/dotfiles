#!/bin/bash
# ====================================================
#   Copyright (C)2020 All rights reserved.
#
#   Author        : VainJoker
#   Email         : vainjoker@163.com
#   File Name     : gpu.sh
#   Last Modified : 2020-03-09 01:25
#   Describe      :
#
# ====================================================



select MODE in intel nvidia
do
    break
done
 
echo "You have selected $MODE"

optimus-manager --switch $MODE --no-confirm


killall dwm
