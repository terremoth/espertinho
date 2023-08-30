#!/bin/bash

set -oue pipefail

if ! command -v catimg &> /dev/null
then
    echo "catimg command not found, please install it before use this script."
    exit
fi

sprite_dir=$1

while true; do
    for file in $(ls $sprite_dir); do
        clear;
        catimg "${sprite_dir}${file}";
        sleep 0.2;
    done
done;
