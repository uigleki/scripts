git clone --depth=1 $config_url $config_dir

git config --global credential.helper store
git config --global pull.rebase false
git config --global user.email $user_email
git config --global user.name $user_name
