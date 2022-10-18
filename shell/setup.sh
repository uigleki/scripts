#!/usr/bin/env bash
set -eo pipefail

setup_dir=$(dirname $0)
setup_name=${1:-common}

for file in $setup_dir/$setup_name/*.sh; do
    source $file
done
