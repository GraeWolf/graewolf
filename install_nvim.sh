#!/usr/bin/env bash

set -euo pipefail

# Install neovim and its dependencies
sudo pacman -S --noconfirm --needed neovim ripgrep fzf luarocks wget npm

ln -sfn $(pwd)/nvim /home/$USER/.config/nvim

