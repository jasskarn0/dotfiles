#!/bin/bash

sudo pacman -Syyu sxhkd bspwm vim neofetch thunar alacritty picom xorg-xrdb base-devel arandr xorg-server polybar zsh zsh-syntax-highlighting lsd zsh-autosuggestions feh

#DPI Settings enable
echo > ~/.Xresources
xrdb ~/.Xresources
xrdb -merge ~/.Xresources

#Making Directories for dotfiles
mkdir ~/.config
mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/alacritty
mkdir ~/.powerlevel10k

#Copying dotfiles
cp bspwmrc ~/.config/bspwm/
cp sxhkdrc ~/.config/sxhkd/
cp picom.conf ~/.config/
cp alacritty.yml ~/.config/alacritty/alacritty.yml
rm ~/.zshrc
cp .zshrc ~/.zshrc


#Font install
sudo cp "MesloLGS NF Regular.ttf" /usr/share/fonts

#Zsh-Theme Install
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

#Yay Install
git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

#Brave Install
yay -S brave-bin

yay -S ly

#Login Manager
sudo systemctl enable ly.service
sudo systemctl set-default graphical.target
