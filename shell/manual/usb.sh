#!/usr/bin/env bash
set -eo pipefail

test_file=$HOME/dilnu/jmaji/zgike
sync=$(dirname $0)/sync.sh

udisksctl mount -b /dev/sda1
udisksctl mount -b /dev/sda3

if [ -e $test_file ]; then
    bash $sync --exclude=Downloads/iso ~/Downloads ~/dilnu $usb/btrfs
    bash $sync ~/Downloads/iso/ $usb/Ventoy
else
    bash $sync $usb/btrfs/Downloads $usb/btrfs/dilnu ~
    bash $sync $usb/Ventoy/ ~/Downloads/iso
fi

udisksctl unmount -b /dev/sda1
udisksctl unmount -b /dev/sda3
udisksctl power-off -b /dev/sda
