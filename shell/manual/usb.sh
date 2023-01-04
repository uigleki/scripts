#!/usr/bin/env bash
set -eo pipefail

usb="$1"
sync=$(dirname $0)/sync.sh
bash $sync --exclude=Downloads/iso ~/Downloads ~/dilnu $usb/btrfs
bash $sync ~/Downloads/iso/ $usb/Ventoy
