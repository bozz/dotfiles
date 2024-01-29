# Dotfiles

My personal dotfiles.

This includes scripts for setting up my complete development environment for both Linux and MaxOS.

The goal is to have a full reproducable environment with a single command.

Most dotfiles will be symlinked to the home directory.

## prerequisites

1. nodejs
2. zx package (global install)

## usage

1. clone repo
2. zx setup.mjs

## ZSH

To enable zsh-autosuggestions (https://github.com/zsh-users/zsh-autosuggestions) run:

```
git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
```
