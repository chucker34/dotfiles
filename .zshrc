# Path to your oh-my-zsh installation.
export ZSH=/Users/kawakami/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="steeef"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git git-flow github rails capistrano rake-fast cd-gitroot heroku git-open docker)

# User configuration

export PATH="/Users/kawakami/.plenv/shims:/usr/local/sbin:/Users/kawakami/.rbenv/shims:/usr/local/bin:/usr/local/heroku/bin:/Users/kawakami/.plenv/shims:/usr/local/sbin:/Users/kawakami/.rbenv/shims:/usr/local/bin:/usr/local/heroku/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/git/bin:/Users/kawakami/.plenv/shims:/usr/local/sbin:/Users/kawakami/.rbenv/shims:/usr/local/heroku/bin:/Users/kawakami/Library/Android/sdk/platform-tools:/Users/kawakami/Library/Android/sdk/tools:/Users/kawakami/Library/Android/sdk/platform-tools:/Users/kawakami/Library/Android/sdk/tools:/Users/kawakami/Library/Android/sdk/platform-tools:/Users/kawakami/Library/Android/sdk/tools:/Users/kawakami/.nodenv/bin"
export PATH=/usr/local/opt/openssl/bin:$PATH
export PATH=/usr/local/var/nodebrew/current/bin:$PATH
export NODEBREW_ROOT=/usr/local/var/nodebrew
export PYENV_ROOT=${HOME}/.pyenv
if [ -d "${PYENV_ROOT}" ]; then
    export PATH=${PYENV_ROOT}/bin:$PATH
    eval "$(pyenv init -)"
    eval "$(pyenv virtualenv-init -)"
fi
export PATH=./node_modules/.bin:$PATH

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# ===========
# My settings
# ===========

# general
# enable control-s and control-q
stty -ixon

# color
export LSCOLORS=exfxcxdxbxegedabagacad
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# List directory contents
alias ls='ls -GF'
alias lsa='ls -lahF'
alias l='ls -lahF'
alias ll='ls -lhF'
alias la='ls -lAhF'

# ログインし直す
alias relogin='exec $SHELL -l'

# rake taskで引数があるとzsh: no matches foundになる問題の対策
setopt nonomatch

# brewとpyenvのwarning回避
alias brew="env PATH=${PATH/${HOME}\/\.pyenv\/shims:/} brew"

# direnv
eval "$(direnv hook zsh)"

function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history
