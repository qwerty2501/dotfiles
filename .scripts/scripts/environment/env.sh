#!/usr/bin/env bash


sudo apt install -y language-pack-ja manpages-ja manpages-ja-dev


localectl set-locale LANG=ja_JP.UTF-8 LANGUAGE="ja_JP:ja"

sudo timedatectl set-timezone Asia/Tokyo

LANG=C xdg-user-dirs-gtk-update

gsettings set org.gnome.desktop.input-sources xkb-options "['ctrl:nocaps']"

