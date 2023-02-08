!/bin/bash

sudo pacman -Syyu sxhkd bspwm vim neofetch thunar alacritty picom firefox git base-devel arandr xorg-server polybar zsh

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

yay -S ly

sudo systemctl enable ly.service

sudo systemctl set-default graphical.target
