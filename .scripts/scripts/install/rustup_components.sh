#!/usr/bin/env bash


cat $(dirname $0)/../../configs/install/rustup_components | while read line
do
	rustup component add $line
done
