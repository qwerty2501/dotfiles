#!/usr/bin/env bash
set -eu

latest_version(){
  base_url=$1
  get_latest_url="$base_url/releases/tag"
  echo -En "$(curl -sSfI "$base_url/releases/latest"| grep -i "location:" | sed -e "s%location: $get_latest_url/%%i" | sed 's/\r//g')"
}
target_file(){
  if [ "$(uname)" == "Darwin" ]; then
    echo "nvim-macos"
  elif [[ "$(uname)" =~ "Linux" ]]; then
    echo "nvim-linux64"
  else
    echo "$(uname) is not supported" >&2
    exit 1
  fi
}

base_url="https://github.com/neovim/neovim"

latest_neovim_version=$(latest_version "$base_url")
file=$(target_file)

neovim_url="${base_url}/releases/download/${latest_neovim_version}/${file}.tar.gz"

tmp_dir=$(mktemp -d)
curl -sSL "$neovim_url" | tar xz --directory "${tmp_dir}"

sudo rsync -a ${tmp_dir}/${file}/ /usr/local/
