if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

if [ -z $TMUX ]; then
  if $(tmux has-session); then
    tmux attach
  else
    tmux
  fi
fi
