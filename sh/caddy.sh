# 允许用户使用 80 端口
echo 'net.ipv4.ip_unprivileged_port_start = 80' | sudo tee /etc/sysctl.d/podman.conf
sudo sysctl $(cat /etc/sysctl.d/podman.conf | sed 's/ //g')

podman run -d --name caddy \
       -p 80:80 -p 443:443 -p 443:443/udp \
       -v /srv/http:/srv/http \
       -v /etc/caddy:/etc/caddy \
       caddy
