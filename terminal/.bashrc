export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1='\u@:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export CLICOLOR=1
export LANG="zh_CN.UTF-8"
export MYNVIMRC="~/.config/nvim/init.vim"

alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
alias ra='ranger'

alias git-='git add . && git commit -m "$(date)" && git push origin master'


[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ "Darwin" = $(uname) ]; then
  alias pi='echo "![]("$(picgo u | tail -1)")" | pbcopy && echo $(pbpaste)'
  alias la='ls -a'
  alias ll='ls -il'
  alias lla='ls -la'
  alias gh='cd ~'
  alias fzf='~/.fzf/bin/fzf'
  alias gd='cd ~/Desktop'
  alias gG='cd ~/Git'
  alias rm='trash -F'
  alias gn='cd ~/Git/Blog/notes'

  # 在命令行中输入code能打开vscode
  code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

  . "$HOME/.cargo/env"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  alias rm='trash -fr'
fi

