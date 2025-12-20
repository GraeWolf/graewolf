#!/usr/bin/env bash

set -euo pipefail

# Install Bspwm, polybar and helper apps.
sudo pacman -S --noconfirm --needed bspwm sxhkd rofi picom polybar fastfetch \
           arandr polkit-gnome gvfs udisks2 udiskie networkmanager \
           network-manager-applet nm-connection-editor \
           bluez bluez-utils pulseaudio-alsa pavucontrol \
           lxappearance lxsession feh unzip unzip alsa-utils eza bat \
		   pcmanfm xsettingsd

chmod 755 bspwm/bspwmrc
chmod 644 sxhkd/sxhkdrc

ln -sfn $(pwd)/bspwm /home/$USER/.config/bspwm
ln -sfn $(pwd)/xsettingsd /home/$USER/.config/xsettingsd
ln -sfn $(pwd)/picom /home/$USER/.config/picom
ln -sfn $(pwd)/polybar /home/$USER/.config/polybar
ln -sfn $(pwd)/sxhkd /home/$USER/.config/sxhkd
ln -sfn $(pwd)/xinitrc /home/$USER/.xinitrc
ln -sfn $(pwd)/scripts /home/$USER/.local/scripts

