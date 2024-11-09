#!/bin/bash

echo "Vous voila désormais connecté au réseau ! D'après vos informateurs, une machine peu sécurisé porte le nom $(basename $(head -n 1 temp/machines)). Trouvez là, et naviguez dans son dossier avant de l'éxécuter"
for i in {1..4}; do
  rm $(sed -n "${i}p" temp/machines)
  cp ./enigme_$i.sh $(sed -n "${i}p" temp/machines)
done
rm $(sed -n "5p" temp/machines)
cp temp/code $(sed -n "5p" temp/machines)
