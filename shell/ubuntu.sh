#!/usr/bin/env bash
set -eo pipefail

scripts_name=scripts
scripts_repo=https://gitlab.com/uigleki/$scripts_name.git

main() {
    install_pkg
    set_user_config
}

install_pkg() {
    pkg_list=(git zsh fish fzf ranger rsync zoxide eza tmux)

    sudo apt-get update
    sudo apt-get install -y ${pkg_list[@]}

    # 防火墙
    sudo apt-get purge -y ufw
    # sudo apt-get install -y firewalld

    # 系统更新
    sudo apt-get dist-upgrade -y
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
