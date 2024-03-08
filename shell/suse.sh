#!/usr/bin/env bash
set -eo pipefail

config_repo=https://gitlab.com/uigleki/dotfiles.git
config_dir=~/dotfiles
rsync_argu=(--inplace --no-whole-file --recursive --times)

sudo zypper dup -y
sudo zypper in -y bat eza fd fish fzf git git-delta helix lazygit ranger ripgrep rsync starship zoxide zsh

git clone --depth=1 $config_repo $config_dir
git clone --depth=1 https://gitlab.com/uigleki/scripts.git

rsync ${rsync_argu[@]} $config_dir/.config $HOME

sudo chsh -s /bin/zsh $USER
echo 'export ZDOTDIR=~/.config/zsh' | sudo tee /etc/zshenv
fish -c 'fish_update_completions'

fd --hidden '.bash' $HOME -d 1 -X rm
