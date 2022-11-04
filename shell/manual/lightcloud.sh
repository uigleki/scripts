#!/usr/bin/env bash
set -eo pipefail

gleki_repo=https://gitlab.com/uigleki/gleki.git
srv=/srv/http

var_read() {
    local var_name="$1"

    read -p "${var_name}: " $1
    echo "${var_name}=${!var_name}"
}

clone_repo() {
    sudo mkdir -p $srv
    sudo chown -R $USER: $srv
    cd $srv
    mkdir mnt
    git clone --depth=1 $gleki_repo
}


copy_config() {
    cd $srv/gleki
    gocryptfs cry ../mnt
    rsync -rt ../mnt/vpn/etc ..
}

change_cloud_pass() {
    cd $srv/gleki
    var_read admin
    var_read cloudpass
    sed -i "s/admin/${admin}/" pod/cloud.yaml
    sed -i "s/cloudpass/${cloudpass}/" pod/cloud.yaml
}

run_pod() {
    cd $srv/mnt/vpn/pod
    podman kube play cloud.yaml
    fusermount -u $srv/mnt
}

auto_start() {
    mkdir -p ~/.config/systemd/user
    cd ~/.config/systemd/user
    # 用户实例自动启动，让用户进程跟会话分离
    sudo loginctl enable-linger $USER
    podman generate systemd -f -n cloud
    systemctl --user enable pod-cloud
}

main() {
    clone_repo
    copy_config
    change_cloud_pass
    run_pod
    auto_start
}

main
