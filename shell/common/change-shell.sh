tmp() {
    local shell=zsh

    sudo chsh -s /bin/$shell $USER
    sudo chsh -s /bin/$shell

    fish -c 'fish_update_completions'
}

tmp
