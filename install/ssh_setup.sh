#!/usr/bin/env bash

set -euo pipefail

sudo pacman -S --noconfirm --needed git neovim cifs gvfs-smb

#use user name to mount smb share

echo "Please enter the smb share username: "
read smbUser

sudo mount -t cifs -o username=$smbUser //192.168.1.3/storage/data/LinuxPC/kmccuddy /mnt

# Check to see if the .data directory is mounted and the .ssh directory exists
if [ -d "/mnt/.ssh" ]; then
	cp -R "/mnt/.ssh" "$HOME/"
	chmod 700 "$HOME/.ssh"
	chmod 600 "$HOME/.ssh/id_"* "$HOME/.ssh/config"
	chmod 644 "$HOME/.ssh/"*.pub
	echo ".ssh has been copied over and permissions set"
else
	echo "Directory not found"
fi

sudo umount /mnt

# convert graewolf repo to ssh
git remote set-url origin git@github.com:GraeWolf/graewolf.git
