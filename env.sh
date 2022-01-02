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

# python
${PM} install python2
${PM} install python3

# curl
${PM} install curl

# node
curl -sL install-node.vercel.app/lts | bash

# yarn 
npm -g install yarn

# tmux 
${PM} install tmux
ln -s ${nowPath}/tmux/.tmux.conf ~/.tmux.conf

# ranger 
${PM} install ranger

# fzf 
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# tree
${PM} install tree

# trash
if [ "Darwin" = $(uname) ]; then
  ${PM} install trash
else
  ${PM} install trash-cli
fi

# neovim 
${PM} install neovim
mkdir ~/.config/nvim/
ln -s ${nowPath}/nvim/init.vim ~/.config/nvim/init.vim
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
cd ~/.config/nvim/plugged/
git clone git@github.com:neoclide/coc.nvim.git
cd ./coc.nvim
yarn install
yarn build
cd ${nowPath}

# bash config
rm ~/.bashrc
rm ~/.bash_profile
ln -s ${nowPath}/terminal/.bashrc ~/.bashrc
ln -s ${nowPath}/terminal/.bash_profile ~/.bash_profile
. ~/.bashrc
