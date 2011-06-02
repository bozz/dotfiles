# colors and prompt
export DISPLAY=:0.0
export TERM=xterm-color
export CLICOLOR=true
export LSCOLORS=true
export LSCOLORS=DxGxcxdxCxegedabagacad
PS1='\[\033[0;32m\]\u@\h\[\033[0;36m\]\W\$ \[\033[1;37m\]'

# use vim as git/svn editor
export GIT_EDITOR='vim -wl1'
export SVN_EDITOR='vim -w'

source ~/.aliases

# needed for rvm gem (Ruby Version Manager)
[[ -s $HOME/.rvm/scripts/rvm ]] && source $HOME/.rvm/scripts/rvm

# use .bashrc.local for settings specific to one system
if [ -f ~/.bashrc.local ]; then
  source ~/.bashrc.local
fi
