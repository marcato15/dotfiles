alias tmux="/usr/bin/tmux"
alias vim="nvim"
# docker-compose with persistent s3 and mysql
alias dcp="docker-compose -f docker-compose.yml -f docker-compose-persist.yml $@"
# docker-compose for webtest
alias dcwt="docker-compose -f docker-compose.yml -f docker-compose-webtest.yml $@"
