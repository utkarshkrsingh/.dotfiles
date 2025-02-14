#### Adding chaotic-aur keys
```bash
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
sudo pacman -Sy
```

#### Enabling multilib and chaotic-aur
- Open `/etc/pacman.conf` and uncomment for `multilib`
```bash
[multilib]
Include = /etc/pacman.d/mirrorlist
```

- For `chaotic-aur`, append these lines
```bash
[chaotic-aur]
Include = /etc/pacman.d/chaotic-mirrorlist
```

#### Fonts
First head to `$HOME/.local/share/fonts` then run these commands:
```bash
# Download the main font zip
curl -L -o "FantasqueSansMono.zip" "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FantasqueSansMono.zip"
# Download Japanese Support for website
curl -L -o "notosanscjk-jp.ttf" "https://github.com/googlefonts/noto-cjk/raw/main/Sans/Variable/TTF/NotoSansCJKjp-VF.ttf"
# Unzip the main font in current dir
unzip "FantasqueSansMono.zip" -d ./
# Remove the .zip files
rm -rf *.zip
```

#### XDG - Settings
Setting the default file explorer and browser
```bash
xdg-settings set default-web-browser zen-browser.desktop
xdg-mime default thunar.desktop inode/directory
```
