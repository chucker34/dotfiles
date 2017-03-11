source ~/.profile

set -g theme_display_ruby no

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

function sync_history --on-event fish_preexec
  history --save
  history --merge
end

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths
set -x PATH /usr/local/heroku/bin $PATH
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH /usr/local/var/nodebrew/current/bin $PATH
set -x NODEBREW_ROOT /usr/local/var/nodebrew
set -x PATH /Users/kawakami/Library/Android/sdk/platform-tools $PATH
set -x PATH /Users/kawakami/Library/Android/sdk/tools $PATH
# for serverless framework
set -x PATH ./node_modules/.bin $PATH

eval (direnv hook fish)
