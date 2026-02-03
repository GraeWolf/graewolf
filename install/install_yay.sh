#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --noconfirm --needed debugedit base-devel

git clone https://aur.archlinux.org/yay.git $(pwd)/yay

cd $(pwd)/yay
makepkg -si --noconfirm

# Make sure yay is installed
if command -v yay >/dev/null 2>&1; then
	rm -rf $(pwd)/yay
else
	echo "Yay did not install."
fi
