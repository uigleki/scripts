#!/usr/bin/env bash
set -eo pipefail

setup_dir=common

if [ -n "$1" ]; then
    setup_dir=$1
fi

for file in $setup_dir/*.sh; do
    source $file
done
