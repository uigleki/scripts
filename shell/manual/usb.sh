#!/usr/bin/env bash
set -eo pipefail

sync=$(dirname $0)/sync.sh
test_file=$HOME/Dropbox/zgike
usb=/run/media/$USER

udisksctl mount -b /dev/sda1
udisksctl mount -b /dev/sda3

if [ -e $test_file ]; then
    bash $sync --exclude=Downloads/iso ~/Downloads ~/Dropbox $usb/btrfs
    bash $sync ~/Downloads/iso/ $usb/Ventoy
else
    bash $sync $usb/btrfs/Downloads $usb/btrfs/Dropbox ~
    bash $sync $usb/Ventoy/ ~/Downloads/iso
fi

udisksctl unmount -b /dev/sda1
udisksctl unmount -b /dev/sda3
udisksctl power-off -b /dev/sda
