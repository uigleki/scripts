#!/usr/bin/env bash
set -eo pipefail

setup_dir=$(dirname $0)
setup_name=common

if [ -n "$1" ]; then
    setup_name=$1
fi

for file in $setup_dir/$setup_name/*.sh; do
    source $file
done
