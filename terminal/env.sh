Get_Dist_Name() {
  if [ "Darwin" = $(uname) ]; then
    DISTRO='Mac'
    PM='brew'
  elif grep -Eqii "CentOS" /etc/issue || grep -Eq "CentOS" /etc/*-release; then
    DISTRO='CentOS'
    PM='yum'
  elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue || grep -Eq "Red Hat Enterprise Linux Server" /etc/*-release; then
    DISTRO='RHEL'
    PM='yum'
  elif grep -Eqi "Aliyun" /etc/issue || grep -Eq "Aliyun" /etc/*-release; then
    DISTRO='Aliyun'
    PM='yum'
  elif grep -Eqi "Fedora" /etc/issue || grep -Eq "Fedora" /etc/*-release; then
    DISTRO='Fedora'
    PM='yum'
  elif grep -Eqi "Debian" /etc/issue || grep -Eq "Debian" /etc/*-release; then
    DISTRO='Debian'
    PM='apt -y'
  elif grep -Eqi "Ubuntu" /etc/issue || grep -Eq "Ubuntu" /etc/*-release; then
    DISTRO='Ubuntu'
    PM='apt -y'
  elif grep -Eqi "Raspbian" /etc/issue || grep -Eq "Raspbian" /etc/*-release; then
    DISTRO='Raspbian'
    PM='apt -y'
  else
    DISTRO='unknow'
  fi
  echo $DISTRO;
}
Get_Dist_Name

# tmux 
${PM} install tmux
cp ../tmux/.tmux.conf ~/.tmux.conf

# ranger 
${PM} install ranger

# fzf 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# neovim 
${PM} install neovim
mkdir ~/.config/nvim/
cp ../nvim/init.vim ~/.config/init.vim

# yarn 
${PM} install yarn

/bin/cp -rf ../terminal/.bashrc ~/.bashrc
/bin/cp -rf ../terminal/.bash_profile ~/.bash_profile
source ~/.bashrc
