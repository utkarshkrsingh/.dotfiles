#!/bin/bash

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
