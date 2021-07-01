# Installation de logiciels sur Linux (Debian-based)

À la différence d'OS comme Windows ou OSX, l'installation de logiciels et de librairies sur Linux se fait principalement grâce à des gestionnaires de paquets. Quelques interfaces existent pour éviter d'utiliser la ligne de commande, mais il est déconseillé passé un certain stade d'apprentissage de les utiliser, car ils ne couvrent pas l'ensemble des cas d'utilisation auxquels vous pourrez être confrontés. Nous allons apprendre ici les différentes manières d'installer de manière générale un logiciel sur une distribution de Linux basée sur Debian, comme Ubuntu (et ses variantes), Linux Mint, PopOS, ElementaryOS...

Nous vous présentons ici 4 manières d'installer un logiciel. Vous pourrez être confrontés à toutes pendant votre scolarité, et elles ont toutes leurs avantages et leurs inconvénients.



## Sommaire 

- [apt](#apt), l'installateur par défaut
- [snap](#snap), le concurrent
- [Téléchargement direct](#Téléchargement direct), quand y'a pas le choix
- [Compilation depuis la source](#Compilation depuis la source), quand c'est vraiment la galère



## apt

`apt`, pour Advanced Packaging Tool, est le gestionnaire de paquets présent par défaut sur les distributions Linux basées sur Debian. Il est indispensable de le maîtriser pour pouvoir se servir de Linux.

Pour la culture, il encapsule un système de packaging appelé `dpkg` et lui donne un front-end plus simple pour aller chercher des paquets distants.

Attention : Toutes les commandes présentées ici dont l'objectif est d'installer, mettre à jour ou supprimer un paquet doivent être précédées de `sudo`, pour obtenir les droits suffisants. Dans le cas où vous l'oublieriez, vous serez confrontés à une erreur du type : 

```
tc@tc:~$ apt install gimp
E: Could not open lock file /var/lib/dpkg/lock-frontend - open (13: Permission denied)
E: Unable to acquire the dpkg frontend lock (/var/lib/dpkg/lock-frontend), are you root?
```

### Base de données de paquets

apt fonctionne sur un système de base de données locale de paquets, qui peut être mise à jour par rapport aux versions en ligne grâce à la commande :

```
sudo apt update
```

Cette commande compare votre base locale aux versions en ligne, et met à jour votre base locale. En revanche, elle ne met pas à jour directement vos paquets.

Vous aurez parfois besoin d'ajouter des sources en plus de celles par défaut avec le [principe des PPA](https://doc.ubuntu-fr.org/ppa), mais généralement les commandes sont données.

### Installation

Après la mise à jour de votre base locale, vous pouvez installer un ou plusieurs paquet(s) :

```
sudo apt install <nom_du_paquet1> <nom_du_paquet_2>
```

Vous ne connaissez pas le nom du paquet ? Google vous donnera probablement la réponse. Vous pouvez aussi rechercher sur la base de paquets locale avec la commande :

```
apt search <terme_a_rechercher>
```

Et pour avoir des informations plus précises sur un paquet particulier : 

```
apt info <nom_du_paquet>
```

### Mise à jour

Pour mettre à jour l'ensemble de vos paquets, lancez après la mise à jour de la base locale de vos paquets avec `update`:

```
sudo apt upgrade
```

### Suppression

Pour supprimer un package, utilisez la commande

```
sudo apt remove <nom_du_paquet>
```

Vous pouvez ajouter l'argument `--purge` pour supprimer également les fichiers de configuration du paquets. Conseillé si vous voulez remettre à zéro une configuration que vous avez cassé (par exemple).

Après une désinstallation, vous pouvez lancer `sudo apt autoremove` pour enlever les dépendances installées par le paquet que vous venez de supprimer et dont vous n'avez plus besoin.



## snap

snap est un gestionnaire de paquets très utilisé, qui vise à corriger et à uniformiser le monde complexe des gestionnaires de paquets Linux. Il peut fonctionner avec apt, et fournit parfois des versions plus à jour de certains logiciels.

Remarque personnelle : j'essaye d'utiliser `snap` le moins possible, parce qu'il pose aujourd'hui pas mal de problèmes. Il est tout de même incontournable pour certains logiciels comme le moteur chromium, [qui n'est plus disponible que sur snap](https://linuxize.com/post/how-to-install-chromium-web-browser-on-ubuntu-20-04/)

Pour installer snap, utilisez apt : 

```
sudo apt install snapd
```

Pour installer un paquet snap :

```
sudo snap install <logiciel>
```

Pour supprimer un paquet snap : 

```
sudo snap remove <logiciel>
```

Pour lister les snap installés : 

```
sudo snap list
```



## Téléchargement direct

Parfois il n'y a pas le choix, certains éditeurs ne diffusent pas leur logiciel sur les gestionnaires de paquets, et vous proposent un téléchargement sur leur site. Vous vous retrouver avec un zip, plein de fichiers aux noms bizarres, que faire ??

Les utilisateurs linux ne sont pas choyés, et doivent souvent se débrouiller pour trouver comment lancer ce logiciel. Vous avez plusieurs cas de figure : 

### Application en `.AppImage` 

C'est le plus simple. Donnez les droits d'exécution sur le fichier puis lancez-le :

```
sudo chmod +x <fichier>.AppImage
./<fichier>.AppImage
```

### Application en .deb

Les `.deb` peuvent être gérés par le gestionnaire de paquet interne dpkg simplement : 

```
sudo dpkg -i <fichier>.dev
```

Si un message d'erreur s'affiche disant qu'il manque des dépendances, vous pouvez les installer grâce à `apt`

### Plein de fichiers qui n'ont aucun sens

Pas de panique. Un fichier binaire se trouve quelque part dans le tas, il suffit de l'identifier. Chercher un fichier exécutable sans extension, souvent du même nom que l'application, à la racine ou dans un dossier `./bin`

Ensuite, donnez les droits d'exécution sur ce fichier avec `sudo chmod +x <fichier>` et exécutez-le.



## Compilation depuis la source

Tout arrive. Le binaire n'est pas fourni ou ne marche pas, vous voulez une version nightly plus récente... Peu importe. Vous avez trouvé le dépôt Github, et vous voulez lancer l'app.

Première astuce : dans l'onglet github releases, des versions compilées sont déjà très souvent fournies. Dans certains cas aussi dans l'onglet actions, qui peut faire des builds automatiques. Ouf. Du travail épargné.

Sinon ? Il est difficile de généraliser, mais les instructions de build sont souvent données dans le readme ou le wiki. Clonez le dépôt, suivez-les, et prier. Des listes de dépendances sont parfois fournies pour vous aidez. Mais maintenant que vous maîtrisez apt, plus rien ne vous fait peur :)