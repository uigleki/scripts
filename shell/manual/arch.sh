#!/usr/bin/env bash
set -eo pipefail

LANG= sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -S --noconfirm steam

flatpak install -y \
        org.libreoffice.LibreOffice \
        com.google.Chrome \
        com.microsoft.Edge

echo 'need reboot'
