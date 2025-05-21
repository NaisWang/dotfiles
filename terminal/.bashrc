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
alias ipy='ipython'
alias grep='grep --color'
alias note="/Users/wanghengzhi/Library/Mobile\ Documents/com~apple~CloudDocs/blog/bin/client.sh"
alias vs="/Applications/Aqua.app/Contents/MacOS/aqua >/dev/null 2>&1 "
alias fp="~/Applications/fp/fp.sh"

alias git-='git add . && git commit -m "$(date)" && git push origin master'
alias gitlog="git log --graph --abbrev-commit --decorate --date=relative --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"

alias sshl="cat ~/.ssh/config | grep -E '^Host|^[ ]*(User|HostName)' | sed 's/Host /---------------\n&/g' | awk '{gsub(/Host /, \"\033[1;31m&\033[0m\"); print}'"

ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$*"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ "Darwin" = $(uname) ]; then
  alias pi='echo "![]("$(picgo u | tail -1)")" | pbcopy && echo $(pbpaste)'
  alias tp='open -a /Applications/Typora.app'
  alias finder='open -R'
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
  alias gn="cd ~/Git/notes"
  alias O='open ./'
  alias ,='qlmanage -p'

  . "$HOME/.cargo/env"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  alias rm='trash -fr'
fi

#vs() {
#  folder=$(fzf --height 40% --layout=reverse)
#
#  if [ -n "$folder" ];
#  then
#    code $folder
#  fi
#}


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
