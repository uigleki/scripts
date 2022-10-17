#!/usr/bin/env bash
set -eo pipefail

# 允许用户使用 80 端口
echo 'net.ipv4.ip_unprivileged_port_start = 80' | sudo tee /etc/sysctl.d/podman.conf

# 开放 http 端口
sudo firewall-cmd --add-service http --permanent
sudo firewall-cmd --add-service https --permanent
sudo firewall-cmd --reload

# need reboot
