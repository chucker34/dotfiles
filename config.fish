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
set -x PATH /usr/local/opt/openssl/bin $PATH
set -x PATH /Users/kawakami/Library/Android/sdk/platform-tools $PATH
set -x PATH /Users/kawakami/Library/Android/sdk/tools $PATH
set -x ANDROID_SDK /Users/kawakami/Library/Android/sdk

# nvm
function nvm
   bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -x NVM_DIR ~/.nvm
nvm use default --silent
set -x NODE_VERSIONS ~/.nvm/versions/node
set -x NODE_VERSION_PREFIX v

# serverless framework
set -x PATH ./node_modules/.bin $PATH

# docker-composeで使うネットワークのタイムアウトを伸ばす
set -x COMPOSE_HTTP_TIMEOUT 200

# 反映されないから/Users/kawakami/.config/fisherman/z/functions/z.fishに直接書いた
# set -gx Z_SCRIPT_PATH /usr/local/etc/profile.d/z.sh

# tmux
set -x TERM screen-256color

# direnv
eval (direnv hook fish)
