#!/bin/bash

PATH=/usr/local/bin:/usr/bin:/bin

MY_DIR=$(dirname "$(realpath "$0")")

cat `ls $MY_DIR/modules.load.* | grep -v 'modules\.load\.normal$'`

# Unused for boot/recovery, just for testing
echo 'wcn36xx.ko'
