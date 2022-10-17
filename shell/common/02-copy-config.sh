rsync_argu=(--inplace --no-whole-file --recursive --times)

cd $config_dir

fish env.sh
rsync ${rsync_argu[@]} .config .local $HOME

sudo fish env.sh
sudo rsync ${rsync_argu[@]} .config .local /root

sudo rsync ${rsync_argu[@]} etc /
