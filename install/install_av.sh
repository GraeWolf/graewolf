#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --noconfirm --needed mpv ffmpeg gstreamer gst-libav \
	gst-plugins-bad gst-plugins-base gst-plugins-good gst-plugins-ugly \
	gst-plugin-pipewire
