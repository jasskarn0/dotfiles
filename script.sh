#!/bin/bash

sudo pacman -Syyu sxhkd bspwm vim neofetch thunar alacritty picom firefox base-devel arandr xorg-server polybar zsh

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd
mkdir ~/.config/alacritty

cp bspwmrc ~/.config/bspwmrc/
cp sxhkd ~/.config/sxhkdrc/
cp picom.conf ~/.config/
cp alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir ~/.powerlevel10k

sudo cp "MesloLGS NF Regular.ttf" /usr/share/fonts



git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

sudo rm -R yay

yay -S ly

sudo systemctl enable ly.service

sudo systemctl set-default graphical.target
