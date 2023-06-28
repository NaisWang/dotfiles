if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
export PATH="/opt/homebrew/opt/maven@3.5/bin:$PATH"

export PATH="$PATH:~/apache-tomcat-9.0.63/bin"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
