tmp() {
    local wallpaper_name=ArchLinux.png
    local wallpaper_file=$config_dir/img/$wallpaper_name
    local kde_wallpaper_file=$HOME/dilnu/jmaji/pixra/bimple/$wallpaper_name
    local sddm_wallpaper_file=/usr/share/sddm/themes/breeze/$wallpaper_name

    mkdir -p $(dirname $wallpaper_dir)
    rsync -t $wallpaper_file $kde_wallpaper_file

    sudo rsync -t $wallpaper_file $sddm_wallpaper_file
    cat << EOF | sudo tee $sddm_theme_dir/theme.conf.user
[General]
background=${wallpaper_name}
type=image
EOF
}

tmp
