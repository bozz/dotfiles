# colors and prompt
export DISPLAY=:0.0
export TERM=xterm-color
export CLICOLOR=true
export LSCOLORS=true
export LSCOLORS=DxGxcxdxCxegedabagacad
PS1='\[\033[0;32m\]\u@\h\[\033[0;36m\]:\W\$ \[\033[1;37m\]'

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
fi

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
