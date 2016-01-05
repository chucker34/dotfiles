export CLICOLOR=1
# export TERM=xterm-color
export TERM=xterm-256color
export LSCOLORS=gxfxcxdxbxegedabagacad
export GIT_PAGER="less -r -I"

# Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

export PATH="/usr/local/bin:$PATH"
eval "$(rbenv init -)"
export PATH="/usr/local/sbin:$PATH"

if which plenv > /dev/null; then
    export PLENV_ROOT="${HOME}/.plenv"
    export PATH="${PLENV_ROOT}/shims:${PATH}"
    eval "$(plenv init -)";
fi

export PATH="/usr/local/share/python:$PATH"
export PATH=$PATH:/Users/kawakami/Library/Android/sdk/platform-tools
export PATH=$PATH:/Users/kawakami/Library/Android/sdk/tools

source ~/dotfiles/.git-prompt.sh
GIT_PS1_SHOWDIRTYSTATE=true
PS1='\u@\h:\W$(__git_ps1 "[\[\033[32m\]%s\[\033[0m\]]")\$ '

source ~/dotfiles/.git-completion.bash

HISTTIMEFORMAT='%y/%m/%d %H:%M:%S'

# enable control-s and control-q
stty -ixon
