# Adding chaotic-aur keys 
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Enabling multilib, chaotic-aur and some options
sudo echo "Color" >> /etc/pacman.conf
sudo echo "ParallelDownloads = 10" >> /etc/pacman.conf
sudo echo "ILoveCandy" >> /etc/pacman.conf
sudo echo ""
sudo echo "[multilib]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/mirrorlist" >> /etc.pacman.conf
sudo echo ""
sudo echo "[chaotic-aur]" >> /etc/pacman.conf
sudo echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

# Updating the mirrorlists
sudo pacman -Sy
