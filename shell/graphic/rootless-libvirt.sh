sudo sed -i '/#unix_sock_group = "libvirt"/s/#//' /etc/libvirt/libvirtd.conf
sudo sed -i '/#unix_sock_rw_perms = "0770"/s/#//' /etc/libvirt/libvirtd.conf
sudo usermod -aG libvirt $USER
