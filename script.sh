!/bin/bash

sudo pacman -Syyu i3-wm vim neofetch thunar alacritty picom firefox git base-devel arandr xorg-server

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

yay -S ly

sudo systemctl enable ly.service

sudo systemctl set-default graphical.target
