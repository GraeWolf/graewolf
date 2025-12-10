#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --noconfirm --needed ghostty

ln -sfn $(pwd)/ghostty /home/$USER/.config/ghostty

