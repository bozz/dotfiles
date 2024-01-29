#!/usr/bin/env zx

// This is the setup script for my config. The idea is to be able to run
// this after cloning the repo on a Mac or Ubuntu (WSL) system and be up
// and running very quickly.

const PWD = await $`pwd`;
const CONFIG_PATH = process.env.HOME + "/.config";

console.log(
  chalk.cyan.bold("================================================"),
);
console.log(chalk.cyan.bold("Dotfiles Setup"));
console.log(
  chalk.cyan.bold("================================================"),
);

if (process.platform === "darwin") {
  console.log(chalk.yellow("System: MacOS (darwin)"));
}

console.log(chalk.yellow("Config path:", CONFIG_PATH));

console.log(
  chalk.yellow.bold("================================================"),
);

// setup kitty
await $`mkdir -p ${CONFIG_PATH}/kitty`;
await $`ln -sf "$PWD/packs/kitty/kitty.conf" ${CONFIG_PATH}/kitty/kitty.conf`;
await $`ln -sf "$PWD/packs/kitty/themes" ${CONFIG_PATH}/kitty/themes`;

// bashtop dracula theme (still need to select within bashtop - press "m")
await $`ln -sf "$PWD/packs/btop/dracula.theme" ${CONFIG_PATH}/btop/themes/dracula.theme`;

await $`ln -sf "$PWD/shell/zshrc" "$HOME/.zshrc"`;
await $`ln -sf "$PWD/shell/aliases" "$HOME/.aliases"`;
await $`ln -sf "$PWD/shell/tmux.conf" "$HOME/.tmux.conf"`;

process.exit(1);

console.log(chalk.red("NOT HERE!!"));

throw new Error("NOTE HERE!!");

/*************************************************************
 * Mac Specific Setup
 *************************************************************/

// brew install packages
// await $`zsh neovim nvim tmux tpm fzf ripgrep tlrc eza btop neofetch`

// brew install casks
// await $`brew install --cask alacritty`
// await $`brew install --cask font-hack-nerd-font`
// await $`brew install --cask obsidian`
// await $`brew install --cask amethyst`

/*************************************************************
 * Linux Specific Setup
 *************************************************************/

// ubuntu apt neovim setup
//  gcc g++ unzip

// ubuntu brew
// fd fzf

// ubuntu brew for neovim setup
// neovim go lazygit

// ubuntu specific notes
// create symbolic link to neovim from vim. when not using neovim on
// Ubuntu systems, because I use the v alias everywhere.
// sudo ln -sf /usr/bin/vim /usr/bin/nvim

// ubuntu neovim setup
// there is an issue with npm on wsl ubuntu 22. Use this to install npm: https://stackoverflow.com/questions/73673804/npm-show-npm-elf-not-found-error-in-wsl

/*************************************************************
 * Global NPM Setup
 *************************************************************/

await $`npm install -g neovim`;

/*************************************************************
 * Common Setup
 *************************************************************/

// create directories
await $`export XDG_CONFIG_HOME="$HOME"/.config`;
await $`mkdir -p "$XDG_CONFIG_HOME"/bash`;
await $`mkdir -p "$XDG_CONFIG_HOME"/alacritty`;
await $`mkdir -p "$XDG_CONFIG_HOME"/skhd`;
// await $`mkdir -p "$XDG_CONFIG_HOME"/wezterm`

// # set up git prompt
// curl -L https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh >"$XDG_CONFIG_HOME"/bash/git-prompt.sh

// Symbolic links

// ln -s ./.amethyst.yml "$HOME"/.amethyst.yml
await $`ln -sf "$PWD/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml`;
await $`ln -sf "$PWD/alacritty.toml" "$XDG_CONFIG_HOME"/alacritty/alacritty.toml`;
// await $`ln -sf "$PWD/.bash_profile" "$HOME"/.bash_profile`
// await $`ln -sf "$PWD/.bashrc" "$HOME"/.bashrc`
// await $`ln -sf "$PWD/.inputrc" "$HOME"/.inputrc`
await $`ln -sf "$PWD/.tmux.conf" "$HOME"/.tmux.conf`;
await $`ln -sf "$PWD/nvim" "$XDG_CONFIG_HOME"/nvim`;
// await $`ln -sf "$PWD/skhdrc" "$XDG_CONFIG_HOME"/skhd/skhdrc`
// await $`ln -sf "$PWD/newsboat/config" "$HOME"/.newsboat/config`
// await $`ln -sf "$PWD/newsboat/urls" "$HOME"/.newsboat/urls`
// ln -sf "$PWD/wezterm.lua" /mnt/c/Users/PD2

// # set up blog
// # git clone git@github.com:mischavandenburg/hugo-PaperModX-theme.git themes/PaperModX --depth=1

// # Second Brain
// # This one's a little tricky because the path contains a space. It needs to be stored as an array,
// # and when called it needs to be quoted.
// # export SECOND_BRAIN=("/Users/mischa/Library/Mobile Documents/iCloud~md~obsidian/Documents/second-brain-01-07-23")
// export SECOND_BRAIN=("/Users/mischa/Library/Mobile Documents/iCloud~md~obsidian/Documents/The Garden")
// ln -sf "$SECOND_BRAIN" ~/garden
// #
// # iCloud
// # export ICLOUD=("/Users/mischa/Library/Mobile Documents/com~apple~CloudDocs")
// # ln -sf "$ICLOUD" ~/icloud
