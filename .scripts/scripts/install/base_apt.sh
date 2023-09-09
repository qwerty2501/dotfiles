#!/usr/bin/env bash
set -eu

sudo apt install -y apt-transport-https \
	ca-certificates \
	gnupg-agent \
	software-properties-common \
	curl \
	wget \
	git

sudo apt update
