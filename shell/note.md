# shell

## 检查终端是否支持真彩色

```shell
curl https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash
```

## 列出启动失败的服务

```shell
systemctl list-units --state failed
```

## 同步 a 目录

```shell
rsync -ah --info=progress2 --delete --inplace --no-whole-file --exclude 'uz' -e 'ssh -p 8022' /storage/emulated/0/a
```

## matrix 的自托管 synapse 新增用户

```shell
podman exec -it http-chat register_new_matrix_user -c /data/config/homeserver.yaml
```
