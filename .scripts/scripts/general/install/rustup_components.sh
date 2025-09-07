#!/usr/bin/env bash
set -eu

rustup=$HOME/.cargo/bin/rustup
$rustup default stable
cat $(dirname $0)/../../../configs/general/install/rustup_components | while read line
do
	$rustup component add $line
done
