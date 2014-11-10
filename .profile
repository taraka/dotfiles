black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

trap 'SECONDS=0' DEBUG

# Git branch in prompt.
parse_git_branch() {
  CURR_BRANCH=`git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/'`
  if [ -n "$CURR_BRANCH" ]; then
    echo "-[$lt_blue$CURR_BRANCH$black]"
  fi
}

__exit_status() {
    if [ $? -eq 0 ]; then
        echo $dk_blue;
    else
        echo $red;
    fi
}

export PS1="\[\$bold\]\[\$black\][\[\$dk_blue\]took: \${SECONDS}s\[\$black\]]\n\n[\[\$(__exit_status)\]\@\[\$black\]]-[\[\$green\]\u\[\$black\]]-[\[\$yellow\]\h\[\$black\]]-[\[$pink\]\w\[\$black\]]\$(parse_git_branch)\[\$reset\]\n\[$reset\]$ "
export npm_config_registry=http://gueacontroltst01.skybet.net:5984

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias ls='ls -G'
alias grep='grep --color=auto -n'

if [ -f /usr/local/share/chruby/chruby.sh ]; then
  source /usr/local/share/chruby/chruby.sh
fi

export PATH=$PATH:~/bin

if which brew > /dev/null 2>&1; then
  export PATH="$(brew --prefix josegonzalez/php/php56)/bin:/usr/local/bin:$PATH"
fi

# Local settings
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi
