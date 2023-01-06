#!/usr/bin/env bash
set -eo pipefail

LANG= sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -S --noconfirm lib32-vulkan-radeon lib32-nvidia-utils ttf-liberation wqy-zenhei steam

flatpak install -y \
        org.libreoffice.LibreOffice \
        com.google.Chrome

echo 'need reboot'
