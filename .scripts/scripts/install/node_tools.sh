#!/usr/bin/env bash
set -eu

cat $(dirname $0)/../../configs/install/node_tools | while read line
do
	sudo npm i -g $line
done
sudo n latest