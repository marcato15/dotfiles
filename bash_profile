export PATH="/usr/local/bin:/usr/local/sbin:./bin:$PATH"

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

PS1="\[\e[0;33m\]$(hostname) \[\e[01;31m\]\W \$(parse_git_branch): \[\e[00m\]"

export GOPATH=~/go
export GOROOT=/usr/local/go
export PATH=$PATH:/usr/local/go_appengine:/usr/local/go/bin
export PATH=$PATH:$(go env GOPATH)/bin

export GIT_MERGE_AUTOEDIT=no
