#!/bin/bash

# setup of basic packages for clean ubuntu systems

apt-get install git curl wget vim

# prerequisites for tmux
apt-get install libevent-1.4 libevent-dev libncurses5-dev

cd /tmp
wget http://downloads.sourceforge.net/tmux/tmux-1.6.tar.gz
cd tmux-1.6
./configure
make install
cd ..
rm -rf tmux-1.6
rm tmux-1.6.tar.gz

# setup solarized colors:
# https://github.com/altercation/solarized/tree/master/vim-colors-solarized
# https://github.com/sigurdga/gnome-terminal-colors-solarized
