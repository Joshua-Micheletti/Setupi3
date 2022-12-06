#!/bin/bash

config=$HOME/.config/

sudo add-apt-repository ppa:regolith-linux/release
sudo apt update

sudo apt install i3-gaps -y
sudo apt install compton -y
sudo apt install feh -y
sudo apt install zsh -y
sudo apt install ranger -y
sudo apt install rofi -y

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

sudo add-apt-repository ppa:kgilmer/speed-ricer
sudo apt update

sudo apt install polybar -y


echo "----------- setup config files ------------"

sudo mv $config/i3 $config/i3.old
sudo mv $config/i3status $config/i3status.old
sudo mv $config/compton.conf $config/compton.conf.old
sudo mv $config/polybar $config/polybar.old
sudo mv $HOME/.zshrc $HOME/.zshrc.old
sudo mv $HOME/.p10k.zsh $HOME/.p10k.zsh.old
sudo mv $HOME/.local/share/xfce4 $HOME/.local/share/xfce4.old

sudo cp -r .config/i3 $config
sudo cp -r .config/i3status $config
sudo cp -r .config/compton.conf $config
sudo cp -r .config/polybar $config
sudo cp -r .zshrc $HOME
sudo cp -r .p10k.zsh $HOME
sudo cp -r .local/share/xfce4 $HOME/.local/share

mkdir $HOME/.local/share/rofi
mkdir $HOME/.local/share/rofi/themes
sudo cp -r .local/share/rofi/themes/* $HOME/.local/share/rofi/themes/


echo "----------- setup nerdfonts -----------"

mkdir $HOME/.fonts
cp ./.fonts/* $HOME/.fonts
fc-cache -fv
