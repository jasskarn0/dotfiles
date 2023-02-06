!/bin/bash

sudo pacman -Syyu i3-wm vim neofetch thunar alacritty picom firefox git base-devel sddm arandr

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

sudo systemctl enable sddm

sudo systemctl set-default graphical.target
