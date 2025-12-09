#!/usr/bin/env bash

set -euo pipefail

# Install Bspwm, polybar and helper apps.
sudo pacman -S --noconfirm --needed bspwm sxhkd rofi picom polybar fastfetch \
           arandr polkit-gnome gvfs udisks2 udiskie networkmanager \
           network-manager-applet nm-connection-editor \
           bluez bluez-utils pulseaudio-alsa pavucontrol \
           lxappearance lxsession feh unzip unzip alsa-utils

chmod 755 bspwm/bspwmrc
chmod 644 sxhkd/sxhkdrc

ln -sfn bspwm $USER/.config/bspwm
ln -sfn picom $USER/.config/picom
ln -sfn polybar $USER/.config/polybar
ln -sfn sxhkd $USER/.config/sxhkd
ln -sfn xinitrc $USER/.xinitrc
