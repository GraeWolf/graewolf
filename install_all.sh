#!/usr/bin/env bash

set -euo pipefail

./install/install_xdg_user_dirs.sh
./install/install_xlibre.sh
./install/install_nvidia.sh
./install/install_wm.sh
./install/install_fonts.sh
./install/install_ghostty.sh
./install/install_nvim.sh
./install/install_steam.sh
./install/install_lockscreen.sh
./install/install_av.sh
./install/install_firewall.sh
./install/install_yay.sh
./install/install_aurpkgs.sh
./install/enable_services.sh
