#!/usr/bin/env bash
DOTFILES="$HOME/.dotfiles"
CONFIG_HOME="$HOME/.config"
VIMCONFIG="$CONFIG_HOME/nvim"
LVIMCONFIG="$CONFIG_HOME/lvim"
NPM_PATH="$CONFIG_HOME/node_modules"

# back current configs
cp -rf ~/.config ~/.config.bak


# copy configs
cp -rf .config/*  ~/.config


# Tmux Plugins
git clone https://github.com/tmux-plugins/tpm "$CONFIG_HOME/tmux/plugins/tpm"
"$CONFIG_HOME/tmux/plugins/tpm/bin/install_plugins"
