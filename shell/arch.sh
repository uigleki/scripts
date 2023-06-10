#!/usr/bin/env bash
set -eo pipefail

config_repo=https://gitlab.com/uigleki/dotfiles.git
config_dir=~/dotfiles
rsync_argu=(--inplace --no-whole-file --recursive --times)

pacman -Syu bash-language-server curl exa fish git git-delta helix lazygit openssh python-lsp-server ranger ripgrep rsync starship zoxide zsh

git clone --depth=1 $config_repo $config_dir
git clone --depth=1 https://gitlab.com/uigleki/scripts.git

cd $config_dir
rsync ${rsync_argu[@]} .config $HOME

sudo chsh -s /bin/zsh $USER
sudo mkdir -p /etc/zsh
echo 'export ZDOTDIR=~/.config/zsh' | sudo tee /etc/zsh/zshenv
