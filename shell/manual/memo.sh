echo '这是命令备忘录'
exit 1


# 检查终端是否支持真彩色
curl https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash

# arch 的分区中，cryptsetup 加密会占用 16 MiB，所以如果 arch 要刚好 300 G
parted -s /dev/nvme0n1 \
       mkpart esp 1MiB 495MiB \
       set 1 esp on \
       mkpart arch 496MiB 300.5GiB

# 列出启动失败的服务
systemctl list-units --state failed
