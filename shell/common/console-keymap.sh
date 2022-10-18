sudo mkdir -p /usr/local/share/kbd/keymaps
cat << EOF | sudo tee /usr/local/share/kbd/keymaps/personal.map
keycode 29 = Alt
keycode 56 = Control
keycode 58 = Home
EOF
echo 'KEYMAP=/usr/local/share/kbd/keymaps/personal.map' | sudo tee /etc/vconsole.conf
