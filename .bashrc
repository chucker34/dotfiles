# export PATH=/opt/local/apache2/bin:$PATH
# export PATH=/opt/local/bin:/opt/local/sbin/:$PATH
# export MANPATH=/opt/local/man:$MANPATH

alias mvim="mvim --remote-tab-silent"

alias atom="open -a /Applications/Atom.app"

export GIT_PAGER='less -r -I'

## ssh
alias luzcia.lolipop.jp="ssh lolipop.jp-luzcia@ssh034.lolipop.jp -p 2222"
alias lunchteiki.sunnyday.jp="ssh sunnyday.jp-lunchteiki@ssh077.lolipop.jp -p2222"

alias migrate="rake db:create db:migrate RAILS_ENV=test"

alias ls='ls -G'
export LSCOLORS=gxfxcxdxbxegedabagacad

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
