!/bin/bash

sudo pacman -Syyu sxhkd bspwm vim neofetch thunar alacritty picom firefox base-devel arandr xorg-server polybar zsh

mkdir ~/.config/bspwm
mkdir ~/.config/sxhkd

cp bspwmrc ~/.config/bspwm/
cp sxhkd ~/.config/sxhkd/

git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

sudo rm -R yay

yay -S ly

sudo systemctl enable ly.service

sudo systemctl set-default graphical.target
