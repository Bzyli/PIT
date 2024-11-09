#!/bin/bash


# Check if the user is in the "admin" group
if ! id -nG "$USER" | grep -qw "admin"; then
  echo "$USER n'a pas les permissions admin. Etes-vous bien dans le groupe admin ?"
else
  ROOT_DIR=$(pwd | awk -F'super_secure_network' '{print $1}')
  echo "$USER Accès autorisé. Vous pouvez désormais accéder à la machine $(basename $(sed -n '5p' $ROOT_DIR/.utils/temp/machines))"
fi
