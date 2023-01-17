source ~/.profile

set -g theme_display_ruby no

set -g fish_user_paths "/usr/local/sbin" $fish_user_paths

function fish_user_key_bindings
  bind \cr peco_select_history # Bind for prco history to Ctrl+r
end

function sync_history --on-event fish_preexec
  history --save
  history --merge
end

# docker-composeで使うネットワークのタイムアウトを伸ばす
set -x COMPOSE_HTTP_TIMEOUT 200

# tmux
set -x TERM screen-256color
set -x TMUX_TMPDIR ~/.tmux/tmp

# direnv
eval (direnv hook fish)

# Nix
if test '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
  bass source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
end

# rbenv
set -x PATH $HOME/.rbenv/bin $PATH
status --is-interactive; and source (rbenv init -|psub)

# nvm
function nvm
  bass source (brew --prefix nvm)/nvm.sh --no-use ';' nvm $argv
end
set -x NVM_DIR ~/.nvm
nvm use default --silent
set -x NODE_VERSIONS ~/.nvm/versions/node
set -x NODE_VERSION_PREFIX v

# openssl
set -x PATH /usr/local/opt/openssl@1.1/bin $PATH

# Android
set -x PATH ~/Library/Android/sdk/platform-tools $PATH
set -x PATH ~/Library/Android/sdk/tools $PATH
set -x PATH ~/Library/Android/sdk/tools/bin/sdkmanager $PATH
set -x ANDROID_HOME $HOME/Library/Android/sdk
set -x ANDROID_SDK_ROOT ~/Library/Android/sdk
set -x ANDROID_AVD_HOME ~/.android/avd
set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
