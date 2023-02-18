#!/bin/bash

sudo pacman -Syyu sxhkd bspwm vim neofetch thunar alacritty picom xorg-xrdb base-devel arandr xorg-server polybar zsh zsh-syntax-highlighting lsd zsh-autosuggestions feh xorg-xsetroot

#DPI Settings enable
echo > ~/.Xresources
xrdb ~/.Xresources
xrdb -merge ~/.Xresources

#Making Directories for dotfiles
#mkdir ~/.config
#mkdir ~/.config/bspwm
#mkdir ~/.config/sxhkd
#mkdir ~/.config/alacritty
#mkdir ~/.powerlevel10k
#!/bin/bash
###########################################
#MAKE THE DIRECTORIES FOR THE CONFIG FILES##
############################################
# Define an array of directory paths
DIR_PATHS=(~/.config ~/.config/bspwm ~/.config/sxhkd ~/.config/alacritty ~/.powerlevel10k ~/.config/polybar)

# Loop through the array and check if each directory already exists
for DIR_PATH in "${DIR_PATHS[@]}"
do
  if [ -d "$DIR_PATH" ]
  then
    echo "Directory $DIR_PATH already exists"
  else
    # Create the directory
    mkdir -p "$DIR_PATH"
    echo "Directory $DIR_PATH created"
  fi
done
###########################################
#####COPY FILES INTO DIRECTORIES MADE#####
###########################################
# Define the source directory containing the files to copy
SOURCE_DIR="."

# Define the destination directories to copy the files to
DESTINATION_DIRS=(
  "$HOME/.config/bspwm"
  "$HOME/.config/sxhkd"
  "$HOME/.config"
  "$HOME/.config/alacritty"
  "$HOME"
  "$HOME/.config/polybar"
  "$HOME/.config/polybar"
  "$HOME/.config/polybar"
  "$HOME/.config/polybar"
)

# Define an array of file names to copy
FILE_NAMES=("bspwmrc" "sxhkdrc" "picom.conf" "alacritty.yml" ".zshrc" "left.ini" "right.ini" "center.ini" "launch.sh")

# Loop through the array of file names and copy each file to the corresponding destination directory
for i in "${!FILE_NAMES[@]}"
do
  FILE_NAME="${FILE_NAMES[$i]}"
  DESTINATION_DIR="${DESTINATION_DIRS[$i]}"

  # Check if the file already exists in the destination directory
  if [ -e "${DESTINATION_DIR}/${FILE_NAME}" ]
  then
    # If the file already exists, delete it
    rm "${DESTINATION_DIR}/${FILE_NAME}"
    echo "Deleted existing file ${FILE_NAME} in ${DESTINATION_DIR}"
  fi

  # Copy the file to the destination directory
  cp "${SOURCE_DIR}/${FILE_NAME}" "${DESTINATION_DIR}"
  echo "Copied file ${FILE_NAME} to ${DESTINATION_DIR}"
done

############################################
###############CURSOR SET###################
############################################

sudo cp -R volantes_cursors /usr/share/icons/
sudo rm /usr/share/icons/default/index.theme
sudo cp index.theme /usr/share/icons/default/

#Font install
sudo cp "MesloLGS NF Regular.ttf" /usr/share/fonts/
sudo cp "JetBrains Mono Regular Nerd Font Complete.ttf" /usr/share/fonts/

#Zsh-Theme Install
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.powerlevel10k
echo 'source ~/.powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

##############################
#####YAY SETUP AND APPS#######
##############################

#Yay Install
git clone https://aur.archlinux.org/yay.git

cd yay

makepkg -si

##############################
#######BRAVE-INSTALL##########
##############################

yay -S brave-bin

##############################
########LOGIN-MANAGER#########
##############################

yay -S ly
#Login Manager
sudo systemctl enable ly.service
sudo systemctl set-default graphical.target

##############################
#########FONT-AWESOME#########
##############################

yay -S ttf-font-awesome-5

##############################

