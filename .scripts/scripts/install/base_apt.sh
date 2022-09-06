#!/usr/bin/env bash

sudo apt install -y apt-transport-https \
	ca-certificates \
	gnupg-agent \
	software-properties-common \
	curl \
	wget \
	git
sudo add-apt-repository -y ppa:neovim-ppa/stable

sudo apt update
