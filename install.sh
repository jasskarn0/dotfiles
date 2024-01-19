#!/bin/bash
sudo pacman -Syu git vim base-devel firefox flatpak sddm pipewire wireplumber xdg-desktop-portal-hyprland polkit-kde-agent qt5-wayland qt6-wayland hyprland mako waybar wofi

git clone https://aur.archlinux.org/yay-bin.git
cd yay-bin
makepkg -si

# Define the destination directory
dest_dir="/home/jaskaran/.config/"

# List of directories to copy
directories=("hypr" "mako" "wofi" "waybar")

# Loop through each directory and copy its contents
for dir in "${directories[@]}"; do
    # Check if the destination directory exists, if not create it
    mkdir -p "$dest_dir/$dir"

    # Copy files from current directory to destination, overwrite existing files
    cp -rf "./$dir/." "$dest_dir/$dir/"
done

echo "Directories copied successfully."

# Optional: Delete existing files in the destination directories
read -p "Do you want to delete existing files in destination directories? (y/n): " answer
if [ "$answer" == "y" ]; then
    for dir in "${directories[@]}"; do
        rm -rf "$dest_dir/$dir"/*
    done
    echo "Existing files deleted successfully."
else
    echo "Existing files were not deleted."
fi
