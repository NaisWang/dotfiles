nowPath="$(pwd)"
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

Print() {
  echo -e "\033[32m==============================\033[0m"
  echo -e "\033[32m============================== $1\033[0m"
  echo -e "\033[32m==============================\033[0m"
}

# update 
Print "update"
${PM} update

# python2
Print "python2"
${PM} install python2

# python3
Print "python3"
${PM} install python3

# jdk-11
Print "java-11"
if [ ! "Darwin" = $(uname) ]; then
  ${PM} install openjdk-11-jdk
fi

# curl
Print "curl"
${PM} install curl

# node
Print "node"
curl -sL install-node.vercel.app/lts | bash

# yarn 
Print "yarn"
npm -g install yarn

# tmux 
Print "tmux"
${PM} install tmux
[ -f ~/.tmux.conf ] && rm ~/.tmux.conf
ln -s ${nowPath}/tmux/.tmux.conf ~/.tmux.conf

# ranger 
Print "ranger"
${PM} install ranger
mkdir -p ~/.config
[ -d ~/.config/ranger ] && rm -rf ~/.config/ranger
ln -s ${nowPath}/ranger ~/.config/ranger

# fzf 
Print "fzf"
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# tree
Print "tree"
${PM} install tree

# trash
Print "trash"
if [ "Darwin" = $(uname) ]; then
  ${PM} install trash
else
  ${PM} install trash-cli
fi

# vim
Print "vim"
${PM} install vim
[ -f ~/.vimrc ] && rm ~/.vimrc
ln -s ${nowPath}/vim/.vimrc ~/.vimrc

# plug.vim 
Print "plug.vim"
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# bash config
Print "bash config"
[ -f ~/.bashrc ] && rm ~/.bashrc
[ -f ~/.bash_profile ] && rm ~/.bash_profile
ln -s ${nowPath}/terminal/.bashrc ~/.bashrc
ln -s ${nowPath}/terminal/.bash_profile ~/.bash_profile
. ~/.bashrc
