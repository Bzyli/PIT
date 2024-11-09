#!/bin/bash

ROOT_DIR=$(pwd | awk -F'super_secure_network' '{print $1}')
NEW_COMPUTER="$(basename $(sed -n '3p' $ROOT_DIR/.utils/temp/machines))"

echo $NEW_COMPUTER | base64
