export BASH_SILENCE_DEPRECATION_WARNING=1
export HOMEBREW_NO_AUTO_UPDATE=true
export PS1='\u@:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export CLICOLOR=1
export LANG="zh_CN.UTF-8"
export MYNVIMRC="~/.vimrc"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/zulu-17.jdk/Contents/Home
export PATH=$JAVA_HOME/bin:$PATH
export CLASSPATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar

#alias ranger='ranger --choosedir=$HOME/.rangerdir; LASTDIR=`cat $HOME/.rangerdir`; cd "$LASTDIR"'
#alias ra='ranger'
alias python='python3'
alias pip='pip3'
alias grep='grep --color'
alias code='code -n'
alias note="~/iCloud/blog/bin/client.sh"

alias git-='git add . && git commit -m "$(date)" && git push origin master'
alias gitlog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ "Darwin" = $(uname) ]; then
  alias pi='echo "![]("$(picgo u | tail -1)")" | pbcopy && echo $(pbpaste)'
  alias tp='open -a /Applications/Typora.app'
  alias la='ls -a'
  alias ll='ls -il'
  alias l='ls -il'
  alias lla='ls -la'
  alias gh='cd ~'
  alias gi='cd ~/iCloud'
  alias fzf='~/.fzf/bin/fzf'
  alias gt='cd ~/notSync'
  alias gd='cd ~/iCloud/Documents'
  alias gx='cd ~/Downloads'
  alias gg='cd ~/Git'
  alias rm='trash -F'
  alias gn="cd ~/iCloud/blog/notes"
  alias O='open ./'
  alias ,='qlmanage -p'

  . "$HOME/.cargo/env"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  alias rm='trash -fr'
fi

vs() {
  folder=$(fzf --height 40% --layout=reverse)

  if [ -n "$folder" ];
  then
    code $folder
  fi
}

