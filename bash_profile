export PATH="/usr/local/bin:/usr/local/sbin:./bin:$PATH"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[\e[0;33m\]$(hostname) \[\e[01;31m\]\W \$(parse_git_branch): \[\e[00m\]"

export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

export GIT_EDITOR=vim
export GIT_MERGE_AUTOEDIT=no
export AWS_REGION=us-east-1

