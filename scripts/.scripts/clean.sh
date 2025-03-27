#!/bin/bash

echo "Cleaning system cache..."
sudo rm -rf ~/.cache/*
sudo rm -rf ~/.local/share/Trash/*
sudo rm -rf /var/cache/pacman/pkg/*
sudo rm -rf /var/tmp/*
sudo journalctl --vacuum-time=7d  # Keep last 7 days of logs

echo "Cleaning package cache..."
sudo pacman -Sc --noconfirm  # Remove unused package cache
paru -Sc --noconfirm          # Remove yay cache (if using yay)

echo "Cleaning logs..."
sudo rm -rf /var/log/*
sudo rm -rf /var/log/journal/*

echo "Cleaning browser cache..."
rm -rf ~/.mozilla/firefox/*.default-release/cache2/*
rm -rf ~/.config/google-chrome/Default/Cache/*

echo "Cleaning complete! 🎉"
