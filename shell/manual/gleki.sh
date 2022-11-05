#!/usr/bin/env bash
set -eo pipefail

gleki_repo=https://gitlab.com/uigleki/gleki.git
srv=/srv/http
sec=$srv/mnt
prefix=$1

var_read() {
    local var_name="$1"

    read -p "${var_name}: " $1
    echo "${var_name}=${!var_name}"
}

clone_repo() {
    sudo chown -R $USER: $srv
    cd $srv
    mkdir $sec
    git clone --depth=1 $gleki_repo
}


copy_config() {
    cd $srv/gleki
    gocryptfs cry $sec
    rsync -rt $sec/etc ..
}

change_cloud_pass() {
    cd $srv/gleki
    var_read admin
    var_read cloudpass
    sed -i "s/admin/${admin}/" pod/cloud.yaml
    sed -i "s/cloudpass/${cloudpass}/" pod/cloud.yaml
}

set_synapse() {
    cd $srv/gleki
    chmod -R a+rX ../etc/synapse
    podman run -it --rm \
           -v synapse:/data \
           -v ../etc/synapse:/data/config \
           -e SYNAPSE_CONFIG_DIR=/data/config \
           -e SYNAPSE_SERVER_NAME=gleki.com \
           -e SYNAPSE_REPORT_STATS=yes \
           matrixdotorg/synapse generate
}

replace_doname() {
    if [ -n "$prefix" ]; then
        sed -i "s/gleki.com/${prefix}.&" $(grep 'gleki.com' $sec)
    fi
}

run_pod() {
    cd $sec/pod
    podman play kube http.yaml
    cd $srv
    fusermount -u $sec
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
    replace_doname
    run_pod
    auto_start
}

main
