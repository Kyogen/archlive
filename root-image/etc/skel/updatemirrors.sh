#!/bin/sh

reflector -c Germany -l 5 --sort score --save /etc/pacman.d/mirrorlist
