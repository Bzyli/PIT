# Projet PIT

Jeu d'escape game.
On est un gros hacker qui doit trouver un fichier caché contenant le code d'accès, la clé du royaume.

- [x] Etape 1 : Trouver son chemin, grosse arbo de dossiers, ça représente le réseau. On veut aller sur une machine en particulier.
Chaque machine est un script bash

- [x] Etape 2 : Si c'est la bonne machine, ça sort une archive log.tar.gz
Il faut l'ouvrir et chercher les communications avec une autre machine.

- [x] Etape 3 : On arrive sur l'autre machine, cette fois-ci le script sort du base64. Il faut le décoder pour arriver sur une autre machine

- [ ] Etape 4 : Nouvelle machine, il faut kill l'antivirus et verif

- [x] Etape 5 : Machine de gestion des accès, il faut s'ajouter dans un group random genre admin123458 et ça donne la dernière machine

- [x] Etape 6 : dernière machine, on y accède que si on est dans le bon groupe. Y'a un code dedans. C'est 42. Le script vérifie que c'est 42. 
Le script félicite : Super ! Vous voulez du gateau ? ah bah non the cake is a lie

TODO :
- [x] Script de verif du code
- [x] Generateur d'arbo random
- [x] Generer archive avec fichier texte dedans
- [x] base64 avec nom de machine
- [ ] Creer processus et verifier qu'il est kill
- [x] Gestion des groupes
- [x] Facile, on écrit juste un fichier code_super_secret avec 42 dedans
