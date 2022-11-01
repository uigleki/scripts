#!/usr/bin/env bash
set -eo pipefail

# 为内核加载 bbr 模块
echo "tcp_bbr" | sudo tee -a /etc/modules-load.d/modules.conf

# 将默认的拥塞算法设置为 bbr
cat << EOF | sudo tee /etc/sysctl.d/tcp_bbr.conf
net.core.default_qdisc = fq
net.ipv4.tcp_congestion_control = bbr
EOF

echo 'need reboot'
