#!/usr/bin/env bash
set -eo pipefail

# 用户变量
config_name=dotfiles
config_dir=$HOME/$config_name
config_repo=https://gitlab.com/uigleki/$config_name.git

git_user_email=rraayy246@gmail.com
git_user_name=ray

# 执行
setup_dir=$(dirname $0)
setup_name=${1:-common}

for file in $setup_dir/$setup_name/*.sh; do
    source $file
done
