if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
export PATH="/opt/homebrew/opt/maven@3.5/bin:$PATH"
export GRAPHVIZ_DOT='/opt/homebrew/Cellar/graphviz/12.2.1/bin/dot'
export PATH="$PATH:~/apache-tomcat-9.0.63/bin:$GRAPHVIZ_DOT"
export HOMEBREW_BOTTLE_DOMAIN=https://mirrors.aliyun.com/homebrew/homebrew-bottles
