# vim:ft=zsh:ts=2:sw=2:sts:et:

############################################################################################
# internal utility functions
############################################################################################

# Returns whether the given command is executable or aliased.
_has() {
  return $( whence $1 >/dev/null )
}

# Functions which modify the path given a directory, but only if the directory
# exists and is not already in the path. (Super useful in ~/.zshlocal)
_prepend_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}

_append_to_path() {
  if [ -d $1 -a -z ${path[(r)$1]} ]; then
    path=($1 $path);
  fi
}

_force_prepend_to_path() {
  path=($1 ${(@)path:#$1})
}

############################################################################################
# basic settings
############################################################################################

# use nvim as default editor
export EDITOR=nvim

export TERM=xterm-256color

# added this because jekyll would fail otherwise bei 'umlaute'
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path to your oh-my-zsh configuration.
# ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="bozz"
#ZSH_THEME="agnoster"

alias tree='nocorrect tree'
alias json='nocorrect json'

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# plugins=(z docker zsh-autosuggestions)

# source $ZSH/oh-my-zsh.sh

# enable color support of ls and also add handy aliases
# use gdircolors for mac...
#if [ -x /usr/local/bin/gdircolors ]; then
#    test -r ~/.dircolors && eval "$(gdircolors -b ~/.dircolors)" || eval "$(gdircolors -b)"
#    alias ls='gls --color=auto'
#fi
# if [ -x /usr/bin/dircolors ]; then
#     test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
#     alias ls='ls --color=auto'
# fi

############################################################################################
# VI MODE
############################################################################################

# set vi command mode
bindkey -v
bindkey -M viins 'jj' vi-cmd-mode

# show feedback if in NORMAL or INSERT mode
function zle-line-init zle-keymap-select {
    RPS1="${${KEYMAP/vicmd/-- NORMAL --}/(main|viins)/-- INSERT --}"
    RPS2=$RPS1
    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

############################################################################################
# INIT PROMPT
############################################################################################

# PROMPT='%F{202}i%f%F{208}a%f%F{214}npa%f%F{220}n%F{221}@%f%F{220}ub%f%F{214}un%f%F{208}tu:%f%F{202}%1~/%f %F{214}%#%f '

# FZF dracula colorscheme
# export FZF_DEFAULT_OPTS="--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:"

############################################################################################
# No duplicate history
############################################################################################

HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# case insensitive completion
autoload -U compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

############################################################################################
# COMPLETION SETTINGS
############################################################################################

autoload -Uz zrecompile
autoload -Uz compinit
dump=$ZSH_COMPDUMP

# http://zsh.sourceforge.net/Doc/Release/Conditional-Expressions.html
if [[ -s $dump(#qN.mh+24) && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    compinit -i d $ZSH_COMPDUMP
    zrecompile $ZSH_COMPDUMP
fi
compinit -C

############################################################################################
# PATH MODIFICATIONS
############################################################################################

_force_prepend_to_path ~/bin

_append_to_path /usr/local/sbin
_append_to_path /usr/local/opt/openjdk/bin

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="$HOME/.claude/local:$PATH"

############################################################################################
# bun setup
############################################################################################

export BUN_INSTALL="$HOME/.bun" 
export PATH="$BUN_INSTALL/bin:$PATH"

############################################################################################
# source files
############################################################################################

source $HOME/.config/zsh/aliases

# use .zshrc.local for settings specific to one system
if [ -f $HOME/.zshrc.local ]; then
  source $HOME/.zshrc.local
fi

############################################################################################
# setup antidote plugin manager
############################################################################################

# for zsh-autosuggest plugin
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

export ANTIDOTE_HOME=~/.cache/antidote

# needs to be installed here!
source $HOME/.config/antidote/antidote.zsh

# initialize plugins statically with ${ZDOTDIR:-~}/.zsh_plugins.txt
antidote load

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"


# bun completions
[ -s "/home/bsearles/.bun/_bun" ] && source "/home/bsearles/.bun/_bun"
