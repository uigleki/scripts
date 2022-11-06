#!/usr/bin/env bash
set -eo pipefail

gleki_repo=https://gitlab.com/uigleki/gleki.git
srv=/srv/http
gleki=$srv/gleki
mnt=$srv/mnt
prefix=$1
doname=gleki.com


var_read() {
    local var_name="$1"

    read -p "${var_name}: " $1
    echo "${var_name}=${!var_name}"
}

clone_repo() {
    sudo mkdir -p $srv
    sudo chown -R $USER: $srv
    mkdir -p $mnt
    git clone --depth=1 $gleki_repo $gleki
}


replace_doname() {
    if [ -n "$prefix" ]; then
        doname=$prefix.$doname
        sed -i "s/gleki.com/${prefix}.&/g" $(grep -rl 'gleki.com' $mnt)
        sed -i "/[./]${prefix}.gleki/s/${prefix}.gleki.com/gleki.com/g" $mnt/etc/caddy/Caddyfile
    fi
}

copy_config() {
    gocryptfs $gleki/cry $mnt
    replace_doname
    rsync -rt $mnt/etc $srv

    if [ -n "$prefix" ]; then
        rsync -rt $mnt/vpn/etc $srv
    fi
}

change_cloud_pass() {
    if [ -z "$prefix" ]; then
        var_read admin
        var_read cloudpass
        sed -i "s/admin/${admin}/" $mnt/pod/http.yaml
        sed -i "s/cloudpass/${cloudpass}/" $mnt/pod/http.yaml
    fi
}

set_synapse() {
    chmod -R a+rX $srv/etc/synapse
    podman run -it --rm \
           -v synapse:/data \
           -v $srv/etc/synapse:/data/config \
           -e SYNAPSE_CONFIG_DIR=/data/config \
           -e SYNAPSE_SERVER_NAME=$doname \
           -e SYNAPSE_REPORT_STATS=yes \
           matrixdotorg/synapse generate
}

run_pod() {
    cd $mnt/pod
    podman play kube http.yaml
}

auto_start() {
    mkdir -p ~/.config/systemd/user
    cd ~/.config/systemd/user
    # 用户实例自动启动，让用户进程跟会话分离
    sudo loginctl enable-linger $USER
    podman generate systemd -f -n http
    systemctl --user enable pod-http
}

main() {
    clone_repo
    copy_config
    change_cloud_pass
    set_synapse
    run_pod
    auto_start
}

main
