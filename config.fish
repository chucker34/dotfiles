if status is-interactive
  eval (/opt/homebrew/bin/brew shellenv)
end

source ~/.profile

set -g theme_display_ruby no

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
# if test '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
#   bass source '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
# end

set -x PATH "/Applications/Visual Studio Code.app/Contents/Resources/app/bin" $PATH

# pipx binaries
set -x PATH "/Users/takahirokawakami/.local/bin" $PATH

# devbox shellが起動してない場合はPATHを通す
if not test $DEVBOX_SHELL_ENABLED
  # anyenv
  status --is-interactive; and source (anyenv init -|psub)

  # openssl
  set -x PATH /opt/homebrew/bin/openssl@3/bin $PATH
  set -x RUBY_CONFIGURE_OPTS "--with-openssl-dir=/opt/homebrew/opt/openssl@3"

  # Android
  set -x PATH ~/Library/Android/sdk/platform-tools $PATH
  set -x PATH ~/Library/Android/sdk/tools $PATH
  set -x PATH ~/Library/Android/sdk/tools/bin/sdkmanager $PATH
  set -x ANDROID_HOME $HOME/Library/Android/sdk
  set -x ANDROID_SDK_ROOT ~/Library/Android/sdk
  set -x ANDROID_AVD_HOME ~/.android/avd
  set -x JAVA_HOME "/Library/Java/JavaVirtualMachines/zulu-11.jdk/Contents/Home"
end

