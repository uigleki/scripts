#!/usr/bin/env bash
set -eo pipefail

scripts_name=scripts
scripts_repo=https://gitlab.com/uigleki/$scripts_name.git

main() {
    install_pkg
    set_user_config
}

install_pkg() {
    pkg_list=(snap zsh fish fzf ranger rsync podman zoxide gocryptfs exa tmux)
    snap_list=(starship bottom)

    sudo apt-get update
    sudo apt-get upgrade -y
    sudo apt-get install -y ${pkg_list[@]}

    sudo snap install ${snap_list[@]}

    # 防火墙
    sudo apt-get install -y firewalld
    sudo apt-get purge -y ufw

    # nvim
    sudo apt-get install -y g++
    sudo snap install --beta nvim --classic
}

set_user_config() {
    user_home=/home/$USER

    local scripts_dir=$user_home/$scripts_name

    git clone --depth=1 $scripts_repo $scripts_dir
    setup_sh
}

setup_sh() {
    local setup_sh=$scripts_dir/shell/setup.sh

    bash $setup_sh $1
}

main "$@"
