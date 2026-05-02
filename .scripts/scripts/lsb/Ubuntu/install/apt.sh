#!/usr/bin/env bash
set -eu

sudo apt install -y $(cat $(dirname $0)/../../../../configs/lsb/Ubuntu/install/apt)
