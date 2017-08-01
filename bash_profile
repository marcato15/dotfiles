export TERM=xterm-256color
export EDITOR=vim
export TODOTXT_DEFAULT_ACTION=ls

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
