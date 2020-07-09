# Connection SSH
###### tags: `Assistance` `Terminal distant` `SSH`
Une connexion distante permet d'accéder à un terminal de commandes sur une machine de votre réseau. Avoir une connexion distante sur une machine vous permet d'interagir avec, comme si vous étiez physiquement à côté d'elle.
Il existe trois formes de connexions distantes : texte, bureau et X11. Au département, vous utiliserez principalement les connexions texte et bureau pour travailler. Les connexions textes transfèrent des caractères entre les deux machines, les connexions bureau transfèrent des flux vidéos de la machine distante vers votre machine.

Il existe donc une différence de consommation réseau entre les deux. La connexion texte est la plus ancienne et la moins consommatrice de bande passante.

Les connexions ssh sont accessibles sur quasiment tous les équipements que l'on peut configurer à distance. Les machines généralistes comme les ordinateurs en salle informatiques, les serveurs, les routeurs réseau ou encore votre box Fibre à domicile. Il est donc utile de savoir se connecter par ssh à ces équipements.

Depuis quelques années, les outils de connexion sécurisée sont disponibles sur tous les systèmes d'exploitation, selon les mêmes syntaxes.

Pour travailler à distance en mode texte vous devez savoir :
 - utiliser le terminal local à votre machine (cf documentation)
 - démarre le vpn (cf documentation)

## Terminal Macos / linux

Dans un terminal taper la commande ``ssh [Login_INSA]@[machine]`` avec un nom de machine valide. Votre mote de passe est alors demandé. Une fois saisi, vous vous retrouvez avec la même interface de commande qu'un terminal de votre système d'exploitation.

L'image suivante montre un bureau macosx avec une connexion vpn, une connexion ssh et un terminal local.
![](https://i.imgur.com/dPnjiv4.png)
