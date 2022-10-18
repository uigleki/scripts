tmp() {
    local rsync_argu=(--inplace --no-whole-file --recursive --times)

    cd $config_dir

    fish env.fish
    rsync ${rsync_argu[@]} .config .local $HOME

    sudo fish env.fish
    sudo rsync ${rsync_argu[@]} .config .local /root

    sudo rsync ${rsync_argu[@]} etc /
}

tmp
