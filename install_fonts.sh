#!/usr/bin/env bash

set -euo pipefail

# installing fonts
sudo pacman -S --noconfirm --needed ttf-dejavu noto-fonts ttf-cascadia-code-nerd \
	ttf-jetbrains-mono-nerd ttf-nerd-fonts-symbols \
	fontconfig xdg-uils
