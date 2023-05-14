conf_dir=/srv/http/mnt/pod

podman pod kill -a
podman pod rm -a
podman rmi -a

cd $conf_dir
podman kube play http.yaml
