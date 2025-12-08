#!/usr/bin/env bash

set -euo pipefail


# Checking if kernels headers exist and if not instll them

if pacman -Q linux-headers &>/dev/null; then
	echo "linux-headers are installed"
else
	echo "linux-headers not installed."
	echo "installing now"
	sudo pacman -S --noconfirm --needed linux-headers
fi

# Checkin to make sure multilib is uncommented and if not uncomment it.
PACMAN_CONF="/etc/pacman.conf"

# 1. Check if [multilib] repo is enabled
if ! grep -q '^\[multilib\]' "$PACMAN_CONF"; then
    echo "[*] [multilib] repo is still commented — enabling it."
    sudo sed -i '/^\s*#\s*\[multilib\]/s/^#\s*//' "$PACMAN_CONF"
fi

# 2. Check if the multilib Include line is enabled
#    We search only *after* the [multilib] block header, but stop before next repo block.
#    That prevents matching Include lines from multilib-testing, etc.

if ! awk '
    $0 ~ /^\[multilib\]/ { in_multilib=1; next }
    in_multilib && $0 ~ /^\[/ { exit }   # stop at next repo block
    in_multilib && $0 ~ /^[[:space:]]*[^#]/ && $0 ~ /Include/ { f=1 }
    END { exit !f }
' "$PACMAN_CONF"; then

    echo "[*] multilib Include line is commented — enabling it."

    # Simpler reliable version (uncomment any Include line within multilib block):
    sudo sed -i '/^\[multilib\]/,/^\[/ s/^\s*#\s*\(Include = \/etc\/pacman\.d\/mirrorlist\)/\1/' \
        "$PACMAN_CONF"
fi

echo "[*] Done."

# Installing the Nvidia drivers
sudo pacman -Sy --noconfimr --needed nvidia-dkms nvidia-utils
