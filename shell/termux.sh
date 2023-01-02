#!/data/data/com.termux/files/usr/bin/env bash
set -eo pipefail

config_name=dotfiles
config_dir=$HOME/$config_name
config_repo=https://gitlab.com/uigleki/$config_name.git

git_user_email=rraayy246@gmail.com
git_user_name=ray

main() {
    color

    case "$1" in
        -h | --help)
            usage 0
            ;;
        *)
            usage 1
            ;;
    esac

    install_proc
}

usage() {
    local exit_code="$1"

    echo -e "${g}termux.sh${e} 0.1.0"
    echo -e "install basic pkg and config"
    echo -e ""
    echo -e "${y}usage:${e}"
    echo -e "    termux.sh [options]"
    echo -e ""
    echo -e "${y}options:${e}"
    echo -e "    ${g}-h${e}, ${g}--help${e}"
    echo -e "        print this help message"

    exit ${exit_code}
}

install_proc() {
    termux_set
    install_pkg
    set_user_config
    system_config

    echo "please reboot"
}

termux_set() {
    # 连接内部存储。
    termux-setup-storage
}

change_source() {
    sed -i 's@^\(deb.*stable main\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/termux-packages-24 stable main@' $PREFIX/etc/apt/sources.list
    sed -i 's@^\(deb.*games stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/game-packages-24 games stable@' $PREFIX/etc/apt/sources.list.d/game.list
    sed -i 's@^\(deb.*science stable\)$@#\1\ndeb https://mirrors.tuna.tsinghua.edu.cn/termux/science-packages-24 science stable@' $PREFIX/etc/apt/sources.list.d/science.list
    pkg update
}

install_pkg() {
    local base_pkg=(curl git openssh rsync)
    local shell_pkg=(fish helix neovim ranger starship zoxide)
    local other_pkg=(bat exa fzf ripgrep zsh)

    pkg upgrade -y
    pkg install -y ${base_pkg[@]} ${shell_pkg[@]} ${other_pkg[@]}
}

clone_config_repo() {
    git clone --depth=1 $config_repo $config_dir

    git config --global credential.helper store
    git config --global pull.rebase false
    git config --global user.email $git_user_email
    git config --global user.name $git_user_name
}

set_user_config() {
    clone_config_repo

    cd $config_dir
    fish env.fish
    rsync -a .config $HOME
}

system_config() {
    chsh -s fish

    curl -fLo $HOME/.termux/font.ttf --create-dirs https://github.com/powerline/fonts/raw/master/UbuntuMono/Ubuntu%20Mono%20derivative%20Powerline.ttf
}

error() {
    local wrong_reason="$*"

    echo -e "${r}error:${e} ${wrong_reason}"
    exit 1
}

color() {
    r="\033[31m" # 红
    g="\033[32m" # 绿
    y="\033[33m" # 黄
    b="\033[34m" # 蓝
    p="\033[35m" # 紫
    c="\033[36m" # 青
    w="\033[37m" # 白
    e="\033[0m"  # 后缀
}

main "$@"
