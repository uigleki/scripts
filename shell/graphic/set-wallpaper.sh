tmp() {
    local wallpaper_dir=$HOME/dilnu/jmaji/pixra/bimple
    local wallpaper_name=ArchLinux.png
    local sddm_theme_dir=/usr/share/sddm/themes/breeze

    mkdir -p $wallpaper_dir
    rsync $wallpaper_name $wallpaper_dir/$wallpaper_name

    sudo rsync $wallpaper_name $sddm_theme_dir/$wallpaper_name
    cat << EOF | sudo tee $sddm_theme_dir/theme.conf.user
[General]
background=${wallpaper_name}
type=image
EOF
}

tmp
