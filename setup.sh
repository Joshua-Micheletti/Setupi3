#!/bin/bash

config=$HOME/.config/

sudo apt install i3-gaps -y
sudo apt install compton -y
sudo apt install polybar -y

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update

sudo apt install polybar -y

echo "----------- setup config files ------------"

sudo mv $config/i3 $config/i3.old
sudo mv $config/i3status $config/i3status.old
sudo mv $config/compton.conf $config/compton.conf.old
sudo mv $config/polybar $config/polybar.old