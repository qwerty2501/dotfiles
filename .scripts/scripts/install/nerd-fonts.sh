#!/usr/bin/env bash
set -eu

work_dir=/tmp/nerd-fonts
git clone https://github.com/ryanoasis/nerd-fonts.git $work_dir

cd $work_dir

./install.sh

rm -rf $work_dir