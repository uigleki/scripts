#!/usr/bin/env bash
set -eo pipefail

LANG= sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -S --noconfirm steam ttf-liberation wqy-zenhei

flatpak install -y \
        org.libreoffice.LibreOffice \
        com.google.Chrome

echo 'need reboot'
