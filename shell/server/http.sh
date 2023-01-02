# 允许用户使用 443 端口
echo 'net.ipv4.ip_unprivileged_port_start = 443' | sudo tee /etc/sysctl.d/podman.conf

# 开放 https 端口
sudo firewall-offline-cmd --add-service https
