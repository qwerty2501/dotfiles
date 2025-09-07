#!/usr/bin/env bash

#sudo apt update
sudo apt install -y apt-transport-https \
	ca-certificates \
	gnupg-agent \
	software-properties-common \
	curl \
	wget \
  build-essential \
	git

sudo install -m 0755 -d /etc/apt/keyrings

#sudo apt update
