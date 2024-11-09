#!/bin/bash

if [[ $(pgrep -f "firewall_9000_super_secure")]]; then
  echo "Le processus du firewall n'a pas été stoppé"
else
  ROOT_DIR=$(pwd | awk -F'super_secure_network' '{print $1}')
  echo "Le firewall a été désactivé, passez à la prochaine machine : $(basename $(sed -n '4p' $ROOT_DIR/.utils/temp/machines))"
fi
