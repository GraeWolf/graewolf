#!/usr/bin/env bash

set -euo pipefail

# Installing the Xlibre verson of xorg

sudo pacman-key --recv-keys 73580DE2EDDFA6D6
sudo pacman-key --finger 73580DE2EDDFA6D6
sudo pacman-key --lsign-key 73580DE2EDDFA6D6

# Adding the XLibre repository to Pacman
echo -e "[xlibre]\nServer = https://x11libre.net/repo/arch_based/x86_64" | sudo tee -a /etc/pacman.conf > /dev/null

sudo pacman -S --noconfirm --needed xlibre-server xlibre-input-libinput xorg-xinit \
	xorg-xauth xorg-xrandr xclip xorg-setxkbmap



