#!/usr/bin/env bash
SCRIPT_DIR=$(cd $(dirname $0); pwd)
echo "scriptdir $SCRIPT_DIR"
$SCRIPT_DIR/.scripts/init.sh
exit 0
