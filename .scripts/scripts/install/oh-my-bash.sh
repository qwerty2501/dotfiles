#!/usr/bin/env bash
set -eu

if [ ! -d "$HOME/.oh-my-bash" ];then
	git clone https://github.com/ohmybash/oh-my-bash.git $HOME/.oh-my-bash
fi
