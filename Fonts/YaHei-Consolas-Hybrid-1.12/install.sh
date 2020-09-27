#!/bin/sh


sudo mkdir -p /usr/share/fonts/truetype/YaHeiConsolasHybrid
sudo cp $HOME/working_environment/YaHei-Consolas-Hybrid-1.12/YaHei\ Consolas\ Hybrid\ 1.12.ttf /usr/share/fonts/truetype/YaHeiConsolasHybrid/
cd /usr/share/fonts/truetype/YaHeiConsolasHybrid
sudo chmod 644 /usr/share/fonts/truetype/YaHeiConsolasHybrid/YaHei\ Consolas\ Hybrid\ 1.12.ttf
sudo mkfontscale
sudo mkfontdir
fc-cache -fv
