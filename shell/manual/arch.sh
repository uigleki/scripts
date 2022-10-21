LANG= sudo grub-mkconfig -o /boot/grub/grub.cfg
sudo pacman -S --noconfirm nvidia

crow &
yakuake &
nextcloud &

echo 'need reboot'
