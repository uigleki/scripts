#!/usr/bin/env bash
set -eo pipefail

gleki_repo=https://gitlab.com/uigleki/gleki.git

var_read() {
    local var_name="$1"

    read -p "${var_name}: " $1
    echo "${var_name}=${!varn_name}"
}

sudo chown -R $USER: /srv/http
cd /srv/http
mkdir mnt
git clone --depth=1 $gleki_repo

cd gleki
gocryptfs cry ../mnt
rsync -rt ../mnt/etc ..
fusermount -u ../mnt

var_read admin
var_read cloudpass
sed -i "s/admin/${admin}/" pod/cloud.yaml
sed -i "s/cloudpass/${cloudpass}/" pod/cloud.yaml
sed -i "/image: postgres/s/postgres/&:14/" pod/cloud.yaml

cd pod
podman play kube cloud.yaml

mkdir -p ~/.config/systemd/user
cd ~/.config/systemd/user
podman generate systemd -f -n cloud
systemctl --user enable pod-cloud
