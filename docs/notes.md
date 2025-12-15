# Useful Command Notes

## bash

### List all failed service units

```bash
systemctl list-units --state failed
```

### Test terminal 24-bit true color support

```bash
curl https://raw.githubusercontent.com/gnachman/iTerm2/master/tests/24-bit-color.sh | bash
```

### Incremental sync of specified directory

```bash
rsync -ah --info=progress2 --delete --inplace --no-whole-file -e 'ssh -p PORT' SRC REMOTE:/DEST
```

### Output music file list

```bash
fd -tf . TARGET_DIR | sd -- '.*/(.*)\.[^.]*$' '- $1' | sort
```

### Check btrfs filesystem usage

```bash
sudo btrfs filesystem usage /
```

## fish

### Output all repository file contents

```fish
for file in (fd -H -E .git -E LICENSE -tf .)
    echo "=== $file ==="
    bat -pp "$file"
end
```

### Check integrity of all media files in directory

```fish
for file in (fd -tf . TARGET_DIR)
    echo "=== $file ==="
    ffmpeg -v error -i "$file" -f null - 2>&1
end
```

## powershell

### Update Winget packages

```powershell
winget upgrade --all
```
