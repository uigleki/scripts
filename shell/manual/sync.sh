#!/usr/bin/env bash
set -eo pipefail

# rsync 以修改日期和文件大小判断是不是同一个文件
exclude_list=$HOME/exclude.list
rsync_argu=(--delete --exclude-from=$exclude_list --inplace --no-whole-file --partial --progress --recursive --times)

cat << EOF > $exclude_list
.dropbox*
EOF

rsync --dry-run ${rsync_argu[@]} "$@"
echo -ne "are you sure? "
read sure
if [ "$sure" = '' -o "$sure" = 'y' ]; then
    rsync ${rsync_argu[@]} "$@"
fi

rm $exclude_list
