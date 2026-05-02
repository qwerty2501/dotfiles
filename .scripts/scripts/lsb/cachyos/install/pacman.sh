#!/usr/bin/env bash
set -eu

sudo pacman -S --noconfirm $(cat $(dirname $0)/../../../../configs/lsb/chachyos/install/pacman)
