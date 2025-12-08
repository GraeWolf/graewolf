#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --noconfirm --needed

echo "Enabling and starting ufw."
systemctl enable --now ufw
sudo ufw default deny incoming
sudo ufw fefault allow outgoing
sudo ufw enable
