#!/usr/bin/env bash

yes | sudo pacman -Sy $(cat $(dirname $0)/../../../../configs/install/pacman)
