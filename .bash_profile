if [ -f ~/.profile ]; then
  source ~/.profile
fi

if [ -f ~/.bashrc ] ; then
. ~/.bashrc
fi

##
# Your previous /Users/kawakami/.bash_profile file was backed up as /Users/kawakami/.bash_profile.macports-saved_2014-01-05_at_22:51:37
##

# MacPorts Installer addition on 2014-01-05_at_22:51:37: adding an appropriate PATH variable for use with MacPorts.
# export PATH=/opt/local/bin:/opt/local/sbin:$PATH
# Finished adapting your PATH environment variable for use with MacPorts.
export PATH=/usr/local/bin:$PATH
eval "$(rbenv init -)"
export PATH=/usr/local/sbin:$PATH
