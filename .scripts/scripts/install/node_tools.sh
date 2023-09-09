#!/usr/bin/env bash
set -eu

sudo npm i -g n
sudo n latest

sudo npm i -g npm

cat $(dirname $0)/../../configs/install/node_tools | while read line
do
	sudo npm i -g $line
done
