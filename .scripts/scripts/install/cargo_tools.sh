#!/usr/bin/env bash


$HOME/.cargo/bin/cargo install $(cat $(dirname $0)/../../configs/install/cargo_tools)
