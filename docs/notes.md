# 实用命令笔记

## bash

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

### 输出音乐文件列表

```bash
fd -tf . TARGET_DIR | sd -- '.*/(.*)\.[^.]*$' '- $1' | sort
```

## fish

### 输出仓库所有文件内容

```fish
for file in (fd -H -E .git -E LICENSE -tf .)
    echo "=== $file ==="
    bat -pp "$file"
end
```

### 检查目录下所有媒体文件完整性

```fish
for file in (fd -tf . TARGET_DIR)
    echo "=== $file ==="
    ffmpeg -v error -i "$file" -f null - 2>&1
end
```

## powershell

### 更新 Winget 软件

```powershell
winget upgrade --all
```
