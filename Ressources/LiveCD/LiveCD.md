:house: [**Retour au menu principal**](/TChelp)

# Fabrication d'une clé USB du département

La création du live cd pour TC se fait en 2 étapes.

1. Installation de l'iso
2. Installation d'une partition de persistence
  
## Installation initiale

Pour fonctionner avec une partition de persistence, il est absolument nécessaire d'utiliser une clé USB rapide. Version 3.0 minimum, et si possible assez récente. L'image de base fait pour l'instant environ 3Go, une clé de 16Go est largement suffisante, mais vous pouvez prendre ce que vous voulez comme taille, tant quelle est rapide.  

Nous avons testé les clés suivantes qui passent facilement :  

- Corsair Flash voyager USB 3.0 32 Go
- Kingston DataTraveler Micro 3.1 - 32 Go
- Samsung MUF-64Da - 64Go
- Verbatim Store'n'Go - 32Go

Une clé USB 2.0 fonctionnera également en mode non persistent, mais trop lente pour le mode persistent.

1. Récupérer sur le site de télécom l'image iso courante
<https://tc-net.insa-lyon.fr/iso/>  
ou encore  
`wget --user <LOGIN> --ask-password https://tc-net2.insa-lyon.fr/iso/live-image-amd64.hybrid.iso`

2. Flashez cette image sur votre clé usb.  
2.1. Cherchez le nom du périphérique (/dev/sdXXX pour unix, /dev/diskXXX pour macos, un écran pour Windows).  
2.2. Utilisez l'utilitaire adéquat pour écrire sur votre clé.  

Je vous suggère de faire ces manipulations en tant que `root` : `sudo su -`

_Unix

```bash
mount ## Pour voir la liste des partitions montées
umount /dev/sdXXX ## Si la clé a été montée auparavent à l'insertion
dd if=./live-image-amd64.hybrid.iso of=/dev/sdXXX bs=4m ## Attention l'image détruit tout le disque comme par exemple sdc ou sdd. /dev/sdc ou /dev/sdd
```

_Macos

```bash
diskutil list
diskutil unmountDisk /dev/diskXXX 
dd if=./live-image-amd64.hybrid.iso of=/dev/sdXXX bs=4m ## Et oui c'est aussi un unix
```

_Windows_
Utilisez un des outils permettant de le faire et suivez la doc.
[rufus](https://rufus.ie/fr/)
[etcher](https://www.balena.io/etcher/)

Une fois la clé flashée, vous pouvez rebooter votre machine. Pensez à chercher le paramètre du BIOS pour booter sur la clé et tout devrait bien se passer.  

## Installation de la partition de persistence

Le système démarre avec un gestionnaire de démarrage, vous permettant d'accéder à trois environnements. L'environnement live, l'environnement fallsafe si un composant matériel vous pose des soucis, et un environnement d'inspection du matériel.  
Dans l'environnement live, vous pouvez vérifier les paramètres de démarrage en appuyant sur la touce `tab` avant de faire `entrée` pour sélectionner votre système. Vous verrez dans la ligne de démarrage l'indication du clavier français et de la langue globale. Le paramètre `persistence` est également précisé. Ce dernier permet d'utiliser une autre partition pour rendre persistent les modifications que vous aller faire dans votre espace de travail.  

Lorsque vous avez flashé votre clé seul l'espace du noyau d'environ 3Go a été utilisé. Il vous reste donc sur une clé de 32Go environ 29Go de libre. Nous allons utiliser une petite partie comme partion de persistence.  

1. Ajout d'une nouvelle partition. Si vous avez démarré sur la clé que vous voulez réorganiser, oubliez tout de suite c'est pas possible. Il faut donc redémarre sur l'environnement qui vous a permis de faire la clé ou éventuellement avoir deux clés pour faire la manipulation en faisant deux installation de l'image iso. Donc si vous avez démarré sur une autre machine vous pouvez manipuler les partitions de votre système. Sous unix l'utilitaire s'appelle cfdisk ou fdisk ou gparted ou.... (il y en a beaucoup). Mais globalement à l'installation votre clé a été partition sur deux partitions. Une petite partition qui contient votre gestionnaire de démarragage (grub), et une plus grosse qui contient votre système live et qui doit faire environ 3Go. Pour controler cela, il faut de lancer `cfdisk /dev/sdXXX`. Au lancement il peut y avoir une erreur indiquant que l'image est au format iso9660; vous pouvez ignorer ce warning. Une fenêtre vous indique l'état de votre table de partition de la clé. Vous pouvez ajouter une partition primaire car vous pouvez avoir 4 partitions primaires. Je vous suggère de faire une partition raisonnable de 2Go pour l'instant. Vous pouvez tout réaliser sous `cfdisk`, il suffit de bien regarder les menus `Créer une partition', puis penser à Ècrire la table des partitions avec le menu Write qui demande une confirmation avec 'yes'. A la suite de cette manipulation et si vous ne vous êtes pas trompé de périphérique vous avez écrit une nouvelle table de partition. 

2. Formattez votre partition.  
Votre nouvelle partition primaire doit être formatée et nommée `persistent` pour qu'elle soit repérée au démarrage de votre live. Vous pouvez utiliser le format `f2fs` préconisé pour les clés usb, mais le format `ext2` standard sous linux fonctionne parfaitement. Le format `f2fs` est reconnu par le noyau live fourni, mais les utilitaires ne sont pas installée. Voici les deux solutions possibles pour formatter la partition (f2fs ou ext2).

_ext2

```bash
mkfs.ext2 -l persistence /dev/sdxxx ## Ici on travaille avec le nom/numéro de partition sdc1 ou sdc2 ou sdd4, etc...
```

//Remarque : Je ne suis pas sur du parametre `l` dans les deux cas. Il faut vérifier avec la doc.

_f2fs

```bash
apt-get install f2fs-tools # utilitaires de gestion des partitions f2fs
mkfs.f2fs -l persistence /dev/sdxxxx
```

3. Montez, copiez et parametrez votre partition de persistence.
Votre partion est maintenant formatée avec le label `persistence`. Vous pouvez installer vos fichiers persistant. Le principe est de monter la partition puis de copier votre environnement.

```bash
mount /dev/sdc3 /mnt
cp -ra /home /mnt/
```

La dernière étape consiste à indiquer au système live comment il doit voir le répertoire `/home` que vous venez de copier. A la racine de la partition vous devez créer un fichier `persistence.conf` qui décrit cela.  

```bash
echo /home >> /mnt/peristence.conf
```

Voilà, vous pouvez rebooter.  
Au démarrage, si le système live présente le paramètre 'persistence', il va regarder s'il trouve une partition labellisé `peristence`. Si oui, il regarde à la racine s'il y a un fichier de description du montage de persistence. Dans notre cas, il montera `/home` sur la nouvelle partition de la clé USB. Tout ce qui est ajouté dans ce repertoire sera sauvegardé.

A la fin du démarrage, un appel à `mount` devrait vous indiquer que la partition `/dev/sdxxx` est bien montée dans un repertoire `/live/persistence/sdxxx`, lui même monté sur `/home`. Attention !! a la place de cela elle peut être montée sur `/media/` ce qui veut dire que le système ne l'a pas reconnu comme partition de persistence, mais comme une partition externe que vous pouvez utiliser.... mais qui est moins utile dans notre cas.

## Conclusion

Deux derniers points. Si votre machine est faible en mémoire < 4Go, vous pouvez également créer une partition de swap sur l'espace restant. Vous pouvez également créer une partition d'échange avec d'autres systèmes. Dans ce cas, il faut repartir de cfdisk et tagguer la partition de type `Extended Fat (Win95, type b)`, et formatter cette dernière en vfat. `mkfs.vat /dev/sdyyyy`.  Si vous désirez créer une partition `vfat` et une partition de swap en plus des 3 partitions initiales, il faudra passer par une 4e partition dite étendue dans laquelle vous créerez les deux partitions. La limite de 4 partitions primaires est là pour des questions historiques d'architecture i386.

Pour en savoir plus sur le live-build. [LiveCD-Details](LiveCD-Details.md)
