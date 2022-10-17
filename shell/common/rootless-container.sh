# 让用户可以运行容器
sudo touch /etc/subuid /etc/subgid
sudo chmod 644 /etc/subuid /etc/subgid
sudo usermod --add-subuids 100000-165535 --add-subgids 100000-165535 $USER

# docker 镜像拉取
echo 'unqualified-search-registries = ["docker.io"]' | sudo tee -a /etc/containers/registries.conf
