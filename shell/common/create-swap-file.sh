tmp() {
    local swap_file=/var/lib/swap/swapfile
    local swap_size=2G

    sudo mkdir -p $(dirname $swap_file)
    sudo touch $swap_file
    sudo chattr +C $swap_file
    sudo chattr -c $swap_file

    sudo fallocate -l $swap_size $swap_file

    sudo chmod 600 $swap_file
    sudo mkswap $swap_file

    echo "${swap_file} none swap defaults 0 0" | sudo tee -a /etc/fstab

    # 最大限度使用物理内存
    echo "vm.swappiness = 0" | sudo tee /etc/sysctl.d/swappiness.conf
}

# 用 zram 替代
#tmp
