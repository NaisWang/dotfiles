export BASH_SILENCE_DEPRECATION_WARNING=1
export PS1='\u@:\[\e[01;32m\]\w\[\e[0m\]\$ '
export EDITOR='vim'
export CLICOLOR=1

alias la='ls -a'
alias ll='ls -il'
alias lla='ls -la'
alias gh='cd ~'

# 在命令行中输入code能打开vscode
code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}

. "$HOME/.cargo/env"
eval "$(/opt/homebrew/bin/brew shellenv)"

