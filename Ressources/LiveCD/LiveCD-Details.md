:house: [**Retour au menu principal**](/TChelp)
# Utilisation d'un live-cd

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

*remarque* : Pensez à faire un sync;sync sous linux pour être sur que votre clé soit bien écrite.

- 3 démarrer votre machine sur la clé USB
Démarrer une machine sur une clé USB peut dans certains cas ne pas fonctionner pour des raisons matérielles, mais cela est maintenant très rare. Il faut configurer son BIOS (le truc qu'on ne démarrage jamais quand la machine se lance en appuyant sur ESC, F2, F10 ou Supp). Le BIOS est une application qui défini le comportement de votre machine avant l'installation d'un système d'exploitation. Vous pouvez manipuler quelques paramètres de gestion matériel et par exemple paramétrer la manière dont les systèmes de démarrage seront recherchés sur votre machine. La plupart du temps le BIOS est configuré pour chercher votre sur votre disque dur (HDD) un emplacement à partir duquel on trouvera un gestionnaire de démarrage (bootloader). Vous devez changer cette configuration pour lui indiquer de recherche un bootloader sur les périphérique de stockage accessibles sur les ports USB. 
Si vous arrivez à modifier votre BIOS de cette manière, vous pouvez alors démarre votre live cd inscrit sur la clé USB. S'il ne trouve rien sur la clé, pas de panique, il démarrera ce qu'il trouve sur votre disque dur.


## OK, j'arrive à démarrer mon live-cd. Est-ce que je dois installer debian ? 

Non, vous pouvez travailler directement à partir de cet environnement. Le live-cd par contre est installé en lecture seule.

## Peut t'on créer un live-cd ?
Oui, la procédure pour débian passe par l'utilitaire live-build. 
Si vous avez booté sur un live-cd, que vous avez un réseau disponible, fabriquer un live cd est assez simple. 
Attention l'utilitaire fonctionne, mais il est très fragile si vous voulez tester... En gros cela fonctionne très bien une fois que la chaine est en place. La mise en place est assez sensible aux erreurs. Je donne la procédure simple utilisée pour créer des live-cd (usb pour tc).

1. Démarrer une debian
Lancer un live-cd debian ayant les bonnes caractéristiques (cf partie précédente : amd64, cinnamon, network).

2. Installer live-build
`apt-get install live-build`

3. Préparer l'environnement
On part d'un répertoire vide `test`.
Live-build installe trois utilitaires de base qui sont simples à comprendre. 
Créer simplement mais avec du temps un live-cd, se fait en passant successivement les trois commandes : `lb clean && lb config && lb build`

```bash
lb clean : supprime une installation conserve la configuration et certains éléments en cache. Pour repartir proprement le plus simple est `\rm -rf test`.  
lb config : définit une configuration qui sera stocké dans un répertoire config/
lb build : fabrique le live-cd
```

En partant d'un répertoire vide, inutile de faire un `lb clean`. Je préfère avoir un script de configuration que je lance pour créer la configuration. Le script est donné dans le git. 

```sh
lb config \ 
  --bootappend-live "boot=live locales=fr_FR.UTF-8 keyboard-layouts=fr persistence" \
  --mode debian \ 
  --system live \
  --distribution bullseye \
  --archive-areas "main contrib non-free" \
  --binary-images iso-hybrid

echo task-cinnamon-desktop > config/package-lists/desktop.list.chroot
echo gnuradio >> config/package-lists/desktop.list.chroot
echo arduino >> config/package-lists/desktop.list.chroot
echo dublin-traceroute >> config/package-lists/desktop.list.chroot
echo wget >> config/package-lists/desktop.list.chroot

cp ../vscode.chroot config/hooks/live/
```

La commande de configuration présente les paramètres suivants : 
  --bootappend-live : ajoute au démarrage du live-cd les options de lancement.
     --> locales françaises pour le clavier et les messages du système.
     --> boot = live : pour démarrer sur un filesystème live
     --> persistence : permet de récupérer de l'espace sur la clé pour faire des écritures
  --mode debian : il est possible de faire différentes distributions (debian, ubuntu...)
  --system live : on crée un live-cd, pas un cd d'installation
  --distribution bullseye : on repose sur les fichier provenant de la version bullseye de debian
  --archive-ares "main contrib non-free" : on utilise les paquets provenant de ces trois domaines
  --binary-images iso-hybrid : on utilise le format iso sur une clé usb (iso-hybrid)

Puis elle force l'installation de certains packages supplémentaires. Le nom des paquets est stocké dans le fichier `config/package-lists/desktop.list.chroot`.

Enfin elle copie un script de récupération de vscode pour l'installer automatiquement. Le script est également fourni dans le github. 

Les paquets supplémentaires et le script ne sont pas nécessaires pour vos premiers tests. 

On lance donc ce script à partir d'un repertoire vide `../config.sfr`.
S'il n'y a pas d'erreur, il va créer un répertoire config et un repertoire cache. 

4. Lancer la création de l'image
Il suffit maintenant de lance la commande de construction de l'image live-cd. `lb build` et d'attendre environ 1h. 

Le script se décompose en beaucoup d'étapes. Ces étapes sont décomposées en trois phases de préparation. 
Les trois grandes  phases étant :
    1. bootstrap : installation d'un système de démarrage minimaliste
    2. chroot : création de l'environnement du system debian
    3. binary : préparation des binaires comme le noyau, l'image mémoire et le systèmes de fichier compressé

Chaque phase est également décomposée en pleins de sous-étapes. Le guide du fonctionnement et le manuel permettent de comprendre les grandes lignes du système live-build. 
`https://www.venea.net/man/live-build(7)`
`https://live-team.pages.debian.net/live-manual/html/live-manual/index.en.html`

5. Tester et installer l'image
A l'issue de la création on obtient une image xxx.iso à la racine du projet. Cette image peut être copiée sur une clé usb avec la commande `dd` ou testée localement pour la contrôler. Il est difficile de l'adapter sans relancer toute la chaîne de création...

Pour copier sur une clé usb : 
  `dd if=./live.....iso of=/dev/sdc bs=2M status=progress`
Attention au device choisi (n'écrasez pas votre disque dur...), il ne faut pas que la clé soit montée et comprendre que toutes les données de la clé sont supprimées. 
Remarque quand vous utilisez la commande dd, et comme souvent vouas allez rebooter dans la foulée. N'hésitez-pas à utiliser la commande `sync` pour purger les caches mémoires. 

Pour tester l'installation vous pouvez :  
1. monter l'image iso et voir son contenu. 
`mount -o loop ./live...iso /mnt`
2. monter le sqashfs du système de fichier de la clé pour voir les fichier accessibles. 
`mount -o loop /mnt/live/xxxx.squashfs /mnt/files` par exemple. Vous verrez normalement l'arborescence de votre os (/usr/ /dev /bin /boot).

Ref : https://arpinux.developpez.com/construire-un-live-debian/
Ref : Live Cd TC : https://tc-net2.insa-lyon.fr/iso/
