# rsync 以修改日期和文件大小判断是不是同一个文件
rsync_argu=(--delete --inplace --no-whole-file --partial --progress --recursive --times --update)
rsync --dry-run ${rsync_argu[@]} "$@"
echo -ne "are you sure? "
read sure
if [ "$sure" = '' -o "$sure" = 'y' ]; then
  rsync ${rsync_argu[@]} "$@"
fi
