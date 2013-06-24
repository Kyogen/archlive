#!/bin/bash

set -e -u

sed -i 's/#\(de_DE\.UTF-8\)/\1/' /etc/locale.gen
locale-gen

ln -sf /usr/share/zoneinfo/UTC /etc/localtime

usermod -s /bin/bash root
cp -aT /etc/skel/ /root/

useradd -m -p "" -g users -G "adm,audio,video,floppy,log,network,rfkill,scanner,storage,optical,power,wheel" -s /bin/bash arch

chmod 750 /etc/sudoers.d
chmod 440 /etc/sudoers.d/g_wheel

sed -i "s/#Server/Server/g" /etc/pacman.d/mirrorlist

systemctl enable multi-user.target pacman-init.service NetworkManager.service display-manager.service
