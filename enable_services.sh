#!/usr/bin/env bash

set -euo pipefail

echo "Enabling and starting NetworkManager."
systemctl enable --now NetworkManager

echo "Enabling and starting Bluetooth."
systemctl enable --now bluetooth

echo "Enabling and starting timesyncd."
systemctl enable --now systemd-timesyncd

