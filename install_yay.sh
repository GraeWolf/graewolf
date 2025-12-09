#!/usr/bin/env bash

set -euo pipefail

git clone https://aur.archlinux.org/yay.git $(pwd)/

cd $(pwd)/yay
makepkg -si

# Make sure yay is installed
if command -v yay >/dev/null 2>&1; then
	rm -rf $(pwd)/yay
else
	echo "Yay did not install."
