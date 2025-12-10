#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --noconfirm --needed xdg-user-dirs

xdg-user-dirs-update
