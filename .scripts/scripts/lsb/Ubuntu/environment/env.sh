#!/usr/bin/env bash


if [ "$(which xdg-user-dirs-gtk-update)" != "" ]; then

  sudo apt install -y language-pack-ja manpages-ja manpages-ja-dev

  localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"

  sudo timedatectl set-timezone Asia/Tokyo

  LANG=C xdg-user-dirs-gtk-update
fi

