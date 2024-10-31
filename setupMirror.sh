# Adding chaotic-aur keys 
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

# Enabling multilib, chaotic-aur and some options
echo "Color" | sudo tee -a /etc/pacman.conf > /dev/null
echo "ParallelDownloads = 10" | sudo tee -a /etc/pacman.conf > /dev/null
echo "ILoveCandy" | sudo tee -a /etc/pacman.conf > /dev/null
echo "" | sudo tee -a /etc/pacman.conf > /dev/null
echo "[multilib]" | sudo tee -a /etc/pacman.conf > /dev/null
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null
echo "" | sudo tee -a /etc/pacman.conf > /dev/null
echo "[chaotic-aur]" | sudo tee -a /etc/pacman.conf > /dev/null
echo "Include = /etc/pacman.d/chaotic-mirrorlist" | sudo tee -a /etc/pacman.conf > /dev/null

# Updating the mirrorlists
sudo pacman -Sy
