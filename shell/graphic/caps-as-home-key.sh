cat << EOF | sudo tee $HOME/.Xmodmap
! 将 CapsLock 作为额外的 Home 键
remove Lock = Caps_Lock
keysym Caps_Lock = Home
EOF
