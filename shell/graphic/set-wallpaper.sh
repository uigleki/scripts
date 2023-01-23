tmp() {
    local wallpaper_name=ArchLinux.png
    local wallpaper_file=$config_dir/img/$wallpaper_name
    local sddm_theme_dir=/usr/share/sddm/themes/breeze

    sudo rsync -t $wallpaper_file $sddm_theme_dir
    cat << EOF | sudo tee $sddm_theme_dir/theme.conf.user
[General]
background=${wallpaper_name}
type=image
EOF
}

tmp
