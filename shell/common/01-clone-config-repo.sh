git clone --depth=1 $config_repo $config_dir

git config --global credential.helper store
git config --global pull.rebase false
git config --global user.email $git_user_email
git config --global user.name $git_user_name
