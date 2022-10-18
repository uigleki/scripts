tmp() {
    local wallpaper_name=ArchLinux.png
    local wallpaper_file=$config_dir/img/$wallpaper_name
    local kde_wallpaper_dir=$HOME/dilnu/jmaji/pixra/bimple
    local sddm_theme_dir=/usr/share/sddm/themes/breeze

    mkdir -p $kde_wallpaper_dir
    rsync -t $wallpaper_file $kde_wallpaper_dir

    sudo rsync -t $wallpaper_file $sddm_theme_dir
    cat << EOF | sudo tee $sddm_theme_dir/theme.conf.user
[General]
background=${wallpaper_name}
type=image
EOF
}

tmp
