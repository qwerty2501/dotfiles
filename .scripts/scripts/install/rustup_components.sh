#!/usr/bin/env bash
set -eu

rustup=$HOME/.cargo/bin/rustup
$rustup default stable
cat $(dirname $0)/../../configs/install/rustup_components | while read line
do
	$rustup component add $line
done
