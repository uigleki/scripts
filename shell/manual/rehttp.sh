#!/usr/bin/env bash
set -eo pipefail

name=http

podman pod kill $name
podman pod rm $name
podman rmi -a

cd /srv/http/mnt/pod
podman kube play http.yaml
