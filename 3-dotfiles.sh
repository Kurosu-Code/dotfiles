#!/bin/bash
#      _       _    __ _ _           
#   __| | ___ | |_ / _(_) | ___  ___ 
#  / _` |/ _ \| __| |_| | |/ _ \/ __|
# | (_| | (_) | |_|  _| | |  __/\__ \
#  \__,_|\___/ \__|_| |_|_|\___||___/
#                                    
# ------------------------------------------------------
# Install Script for dotfiles and configuration
# yay must be installed
# ------------------------------------------------------

# ------------------------------------------------------
# Load Library
# ------------------------------------------------------
source $(dirname "$0")/scripts/library.sh
clear
echo "     _       _    __ _ _            "
echo "  __| | ___ | |_ / _(_) | ___  ___  "
echo " / _' |/ _ \| __| |_| | |/ _ \/ __| "
echo "| (_| | (_) | |_|  _| | |  __/\__ \ "
echo " \__,_|\___/ \__|_| |_|_|\___||___/ "
echo "                                    "
echo "-------------------------------------"
echo ""
echo "The script will ask for permission to remove existing directories and files from ~/.config/"
echo "Symbolic links will then be created from ~/dotfiles into your ~/.config/ directory."
echo "But you can decide to keep your personal versions by answering with No (Nn)."
echo ""

# ------------------------------------------------------
# Confirm Start
# ------------------------------------------------------
while true; do
    read -p "DO YOU WANT TO START THE INSTALLATION NOW? (Yy/Nn): " yn
    case $yn in
        [Yy]* )
            echo "Installation started."
        break;;
        [Nn]* ) 
            exit;
        break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# ------------------------------------------------------
# Create .config folder
# ------------------------------------------------------
echo ""
echo "-> Check if .config folder exists"

if [ -d ~/.config ]; then
    echo ".config folder already exists."
else
    mkdir ~/.config
    echo ".config folder created."
fi

# ------------------------------------------------------
# Create symbolic links
# ------------------------------------------------------
# name symlink source target

echo ""
echo "-------------------------------------"
echo "-> Install general dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink alacritty ~/.config/alacritty ~/dotfiles/alacritty/ ~/.config
_installSymLink ranger ~/.config/ranger ~/dotfiles/ranger/ ~/.config
_installSymLink vim ~/.config/vim ~/dotfiles/vim/ ~/.config
_installSymLink nvim ~/.config/nvim ~/dotfiles/nvim/ ~/.config
_installSymLink starship ~/.config/starship.toml ~/dotfiles/starship/starship.toml ~/.config/starship.toml
_installSymLink rofi ~/.config/rofi ~/dotfiles/rofi/ ~/.config
_installSymLink dunst ~/.config/dunst ~/dotfiles/dunst/ ~/.config
_installSymLink wal ~/.config/wal ~/dotfiles/wal/ ~/.config
_installSymLink spotify ~/.config/spotify-flags.conf ~/dotfiles/spotify/spotify-flags.conf ~/.config/spotify-flags.conf

wal -i wallpapers/
echo "Pywal templates initiated!"
echo ""

echo "-------------------------------------"
echo "-> Install GTK dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink .gtkrc-2.0 ~/.gtkrc-2.0 ~/dotfiles/gtk/.gtkrc-2.0 ~/.gtkrc-2.0
_installSymLink gtk-3.0 ~/.config/gtk-3.0 ~/dotfiles/gtk/gtk-3.0/ ~/.config/
_installSymLink gtk-4.0 ~/.config/gtk-4.0 ~/dotfiles/gtk/gtk-4.0/ ~/.config/

echo "-------------------------------------"
echo "-> Install Hyprland dotfiles"
echo "-------------------------------------"
echo ""

_installSymLink hypr ~/.config/hypr ~/dotfiles/hypr/ ~/.config
_installSymLink waybar ~/.config/waybar ~/dotfiles/waybar/ ~/.config
_installSymLink swaylock ~/.config/swaylock ~/dotfiles/swaylock/ ~/.config
_installSymLink wlogout ~/.config/wlogout ~/dotfiles/wlogout/ ~/.config
_installSymLink swappy ~/.config/swappy ~/dotfiles/swappy/ ~/.config

# ------------------------------------------------------
# DONE
# ------------------------------------------------------
echo "DONE!" 
echo "NEXT: Please logout and reboot your system!"
