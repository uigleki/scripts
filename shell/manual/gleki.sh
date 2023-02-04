#!/usr/bin/env bash
set -eo pipefail

gleki_repo=https://gitlab.com/uigleki/gleki.git
srv=/srv/http
gleki=$srv/gleki
mnt=$srv/mnt
prefix=$1
doname=gleki.com


clone_repo() {
    sudo mkdir -p $srv
    sudo chown -R $USER: $srv
    mkdir -p $mnt
    git clone --depth=1 $gleki_repo $gleki
}


replace_doname() {
    doname=$prefix.$doname
    sed -i "s/gleki.com/${prefix}.&/g" $(grep -rl 'gleki.com' $mnt)
    sed -i "/[./]${prefix}.gleki/s/${prefix}.gleki.com/gleki.com/g" $mnt/{.,vpn}/etc/caddy/Caddyfile
}

copy_config() {
    gocryptfs $gleki/cry $mnt

    if [ -n "$prefix" ]; then
        replace_doname
    fi

    rsync -rt $mnt/etc $srv

    if [ -n "$prefix" ]; then
        rsync -rt $mnt/vpn/etc $srv
    fi
}

set_synapse() {
    podman run -it --rm \
           -v synapse:/data \
           -v $srv/etc/synapse:/data/config \
           -e SYNAPSE_CONFIG_DIR=/data/config \
           -e SYNAPSE_SERVER_NAME=$doname \
           -e SYNAPSE_REPORT_STATS=yes \
           matrixdotorg/synapse generate
}

run_pod() {
    if [ -z "$prefix" ]; then
        cd $mnt/pod
    else
        cd $mnt/vpn/pod
    fi
    podman play kube http.yaml
}

main() {
    clone_repo
    copy_config

    if [ -z "$prefix" ]; then
        set_synapse
    fi

    run_pod
}

main
