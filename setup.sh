#!/bin/bash

##################################################################################################################################################################################
##################################################################################################################################################################################
#  ______          _       
# |  ____|        | |      
# | |__ ___  _ __ | |_ ___ 
# |  __/ _ \| '_ \| __/ __|
# | | | (_) | | | | |_\__ \
# |_|  \___/|_| |_|\__|___/
#                          

# Define the fonts directory
FONT_DIR="$HOME/.local/share/fonts"

# Check if the directory exists, and create it if not
if [ ! -d "$FONT_DIR" ]; then
    mkdir -p "$FONT_DIR"
    echo "Created directory: $FONT_DIR"
else
    echo "Directory already exists: $FONT_DIR"
fi

# Download the font zip file
curl -L -o "$FONT_DIR/FantasqueSansMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FantasqueSansMono.zip"

# Japanese Language Support
curl -L -o "notosanscjk-jp.ttf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/Variable/TTF/NotoSansCJKjp-VF.ttf"

# move the jp font to font_dir
mv "notosanscjk-jp.ttf" "$FONT_DIR/notosanscjk-jp.ttf"

# Unzip the downloaded font and refresh the font cache
unzip "$FONT_DIR/FantasqueSansMono.zip" -d "$FONT_DIR"
fc-cache -fv
echo "Font installed successfully."

# delete the zip file
rm -rf "$FONT_DIR/FantasqueSansMono.zip"

##################################################################################################################################################################################
##################################################################################################################################################################################
#  _____           _                         
# |  __ \         | |                        
# | |__) |_ _  ___| | ____ _  __ _  ___  ___ 
# |  ___/ _` |/ __| |/ / _` |/ _` |/ _ \/ __|
# | |  | (_| | (__|   < (_| | (_| |  __/\__ \
# |_|   \__,_|\___|_|\_\__,_|\__, |\___||___/
#                             __/ |          
#                            |___/           
#

sudo pacman -S rustup
rustup install stable
rustup default stable

for line in $(cat ./assets/packagelist)
do
    sudo pacman -S --noconfirm --needed $line
done

# Installing aur packages
for line in $(cat ./assets/aurlist)
do
    paru -S --noconfirm --needed $line
done

xdg-user-dirs-update

sudo systemctl enable sddm

##################################################################################################################################################################################
##################################################################################################################################################################################
#  _____        _    __ _ _           
# |  __ \      | |  / _(_) |          
# | |  | | ___ | |_| |_ _| | ___  ___ 
# | |  | |/ _ \| __|  _| | |/ _ \/ __|
# | |__| | (_) | |_| | | | |  __/\__ \
# |_____/ \___/ \__|_| |_|_|\___||___/
#

mkdir $HOME/.config/vesktop

stow alacritty
stow bat
stow btop
stow cava
stow dunst
stow eww
stow fastfetch
stow gtk3
stow hyprland
stow icons
stow imv
stow kitty
stow Kvantum
stow mpv
stow nvim
stow paru
stow rofi
stow scripts
stow spicetify
stow starship
stow swaylock
stow themes
stow tmux
stow vesktop
stow waybar
stow wlogout
stow yazi
stow zathura
stow zsh
stow zsh.d

# Adding GRUB themes
sudo stow -t /usr grub

##################################################################################################################################################################################
##################################################################################################################################################################################
#   _____ _____  _____  __  __ 
#  / ____|  __ \|  __ \|  \/  |
# | (___ | |  | | |  | | \  / |
#  \___ \| |  | | |  | | |\/| |
#  ____) | |__| | |__| | |  | |
# |_____/|_____/|_____/|_|  |_|
#                                                           

sudo pacman -Syu qt6-svg qt6-declarative qt5-quickcontrols2
sudo mv catppuccin-mocha /usr/share/sddm/themes 
sudo touch /etc/sddm.conf 
echo '[Theme]' | sudo tee -a /etc/sddm.conf > /dev/null
echo 'Current=catppuccin-mocha' | sudo tee -a /etc/sddm.conf > /dev/null

##################################################################################################################################################################################
##################################################################################################################################################################################
#   _____ _____  _    _ ____  
#  / ____|  __ \| |  | |  _ \ 
# | |  __| |__) | |  | | |_) |
# | | |_ |  _  /| |  | |  _ < 
# | |__| | | \ \| |__| | |_) |
#  \_____|_|  \_\\____/|____/ 
#                                                         

echo 'GRUB_THEME="/usr/share/grub/themes/Elegant-mojave-sharp-left-dark/theme.txt"' | sudo tee -a /etc/default/grub > /dev/null
sudo grub-mkconfig -o /boot/grub/grub.cfg 

##################################################################################################################################################################################
##################################################################################################################################################################################

## STARTING SDDM 
sudo systemctl start sddm
