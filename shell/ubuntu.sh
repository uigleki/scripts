#!/usr/bin/env bash

set -eo pipefail

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

    # 安装 starship
    sudo passwd -d ubuntu
    curl -sS https://starship.rs/install.sh | sh
}

set_user_config() {
    # tmux
    tmux_conf_url="https://raw.githubusercontent.com/uigleki/dotfiles/main/etc/tmux.conf"
    curl -sL "$tmux_conf_url" | sudo tee /etc/tmux.conf > /dev/null

    # zsh
    sudo apt-get install -y zsh-syntax-highlighting zsh-autosuggestions
    cat << 'EOF' >> ~/.zshrc
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

alias l="eza -laF"
alias lt="eza -TF"
alias r="rsync"
alias ra="ranger"
alias s="sudo"
alias t="tmux new -A"
EOF
    chsh -s $(which zsh)
}

main "$@"
