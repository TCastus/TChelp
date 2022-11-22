# Utilisation d'un live-cd au département

## Dis papa c'est quoi un live-cd ?

Un live-cd est une distribution d'un système d'exploitation sur un cd ou une clé usb qui permet de ne rien installer sur ma machine, et de n'utiliser que sont port usb pour s'installer. Un live-cd permet de fabriquer une installation générique sans avoir à installer ma machine.

## Comment fait-on un live-cd ?

C'est assez simple, il faut une machine qui fonctionne avec quelques GB disponible pour graver l'image.  
Une image est un fichier de 3 ou 4 GB qui représente toute l'installation du système d'exploitation. Dans le cas de linux, il s'agit d'un gestionnaire de démarrage (bootloader), d'un noyau (kernel) et d'un système de fichier contenant les applications initialement disponibles au démarrage.  

Au plus simple pour se faire un live-cd : 3 étapes

- 1 récupérer une image de type live dans une distribution particulière. Je prends pour exemple debian.  
Je choisi :  
  1. une image iso de type bullseye stable chez debian  
  2. le support pour un environnement graphique cinnamon
  3. la distribution contenant certains drivers proprietaire non-free
  4. une architecture 64bits : amd64
  
Je récupère le fichier `debian-live-11.5.0-amd64-cinnamon+nonfree.iso` à partir du site : 'https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.5.0-live+nonfree/amd64/iso-hybrid/'.
La commande `wget https://cdimage.debian.org/images/unofficial/non-free/images-including-firmware/11.5.0-live+nonfree/amd64/iso-hybrid/debian-live-11.5.0-amd64-cinnamon+nonfree.iso` devrait faire le café.

- 2 graver le cd ou la clé usb  
Comme plus personne ne possède de lecteur de cd et encore moins de cd, il faut plutôt imaginer graver une image iso sur une clé usb. Pour cela, il faut juste faire attention à bien récupérer une iso de type hybride (ce qui est le cas de manière standard). La commande `dd` est la plus simple à lancer.  
Il faut bien évidemment une clé usb d'une taille suffisante pour installer les 3 ou 4GB de l'image iso.
Sous unix l'instruction : `dd if=./debian-live-11.5.0-amd64-cinnamon+nonfree.iso of=/dev/sdc bs=10M status=progress` est assez explicite.  
  - if : input file
  - of : output file
  - bs = 10M : est un paramètre important qui peut faire varier votre vitesse de transfert sur votre clé de 0,2MB/s à 200MB/s. Ce qui, pour 4GB vous fera passer de 1h à 3 min. La bonne valeur n'est pas claire. Il faut essayer entre 2m et 10m ca devrait être pas mal.  
  - status : pour avoir une barre de progression. Attention sur MacOS l'option n'existe pas, il faut faire des CTRL-T dans la fenêtre pour voir la progression

- 3 démarrer votre machine sur la clé USB
Démarrer une machine sur une clé USB peut dans certains cas ne pas fonctionner pour des raisons matérielles, mais cela est maintenant très rare. Il faut configurer son BIOS (le truc qu'on ne démarrage jamais quand la machine se lance en appuyant sur ESC, F2, F10 ou Supp). Le BIOS est une application qui défini le comportement de votre machine avant l'installation d'un système d'exploitation. Vous pouvez manipuler quelques paramètres de gestion matériel et par exemple paramétrer la manière dont les systèmes de démarrage seront recherchés sur votre machine. La plupart du temps le BIOS est configuré pour chercher votre sur votre disque dur (HDD) un emplacement à partir duquel on trouvera un gestionnaire de démarrage (bootloader). Vous devez changer cette configuration pour lui indiquer de recherche un bootloader sur les périphérique de stockage accessibles sur les ports USB. 
Si vous arrivez à modifier votre BIOS de cette manière, vous pouvez alors démarre votre live cd inscrit sur la clé USB. S'il ne trouve rien sur la clé, pas de panique, il démarrera ce qu'il trouve sur votre disque dur. 

