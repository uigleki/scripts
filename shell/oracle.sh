MAIN_VER=$(cat /etc/os-release | grep VERSION_ID | cut -d '"' -f 2 | cut -d '.' -f 1)

sudo dnf install -y oracle-epel-release-el${MAIN_VER}
sudo dnf config-manager --enable ol${MAIN_VER}_developer_EPEL

sudo dnf copr enable atim/bottom -y
sudo dnf copr enable atim/starship -y

sudo dnf install -y bottom eza fish fzf git ranger starship tmux zoxide zsh
