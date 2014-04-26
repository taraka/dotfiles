# Git branch in prompt.
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

function timer_start {
  echo 'running';
  timer=${timer:-$SECONDS}
}

function timer_stop {
  timer_show=$(($SECONDS - $timer))
  unset timer
}

#trap 'timer_start' DEBUG
#PROMPT_COMMAND="timer_stop; echo 'run'"

__vcs_name() {
    if [ -d .svn ]; then
        echo "-[svn]";
    elif __has_parent_dir ".git"; then
        echo "-[$(__git_ps1 'git %s')]";
    elif __has_parent_dir ".hg"; then
        echo "-[hg $(hg branch)]"
    fi
}

black=$(tput -Txterm setaf 0)
red=$(tput -Txterm setaf 1)
green=$(tput -Txterm setaf 2)
yellow=$(tput -Txterm setaf 3)
dk_blue=$(tput -Txterm setaf 4)
pink=$(tput -Txterm setaf 5)
lt_blue=$(tput -Txterm setaf 6)

bold=$(tput -Txterm bold)
reset=$(tput -Txterm sgr0)

__exit_status() {
    if [ $? -eq 0 ]; then
        echo $dk_blue;
    else
        echo $red;
    fi
}


export PS1="\n\[\$bold\]\[\$black\][\[\$(__exit_status)\]\@\[\$black\]]-[\[\$green\]\u\[\$yellow\]@\[\$green\]\h\[\$black\]]-[\[$pink\]\w\[\$black\]]\[\$lt_blue\]\$(parse_git_branch)\[\$reset\]\n\[$reset\]$ "

if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

alias ls='ls -G'
alias grep='grep --color=auto -n'

source /usr/local/share/chruby/chruby.sh

PATH=$PATH:~/bin

export PATH="$(brew --prefix josegonzalez/php/php56)/bin:/usr/local/bin:$PATH"

#eval "$(rbenv init -)"

##
# Your previous /Users/rawclift/.profile file was backed up as /Users/rawclift/.profile.macports-saved_2013-11-29_at_11:44:02
##

# MacPorts Installer addition on 2013-11-29_at_11:44:02: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.

