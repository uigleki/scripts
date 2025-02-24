# 实用命令笔记

部分命令使用了 fish shell 特有语法，在 bash 中可能不兼容。

## 命令

### 保持用户服务在登出后继续运行

```bash
sudo loginctl enable-linger $USER
```

### 查看所有失败状态的服务单元

```bash
systemctl list-units --state failed
```

### 测试终端 24 位真彩色支持

```bash
curl https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash
```

### 增量同步指定目录

```bash
rsync -ah --info=progress2 --delete --inplace --no-whole-file -e 'ssh -p PORT' SRC REMOTE:/DEST
```

### 输出仓库所有文件内容

```fish
fd -H -E .git -E LICENSE -tf . | while read -l file
    echo "=== $file ==="
    bat -pp "$file"
end
```

### 输出音乐文件列表

```bash
fd -tf . TARGET_DIR | sd -- '.*/(.*)\.[^.]*$' '- $1' | sort
```

### 检查目录下所有媒体文件完整性

```fish
for file in (fd -tf . TARGET_DIR)
    echo "=== $file ==="
    ffmpeg -v error -i "$file" -f null - 2>&1
end
```
