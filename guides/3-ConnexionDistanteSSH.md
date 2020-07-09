# Connection SSH
###### tags: `Assistance` `Terminal distant` `SSH`
Une connection distante permet d'accéder un terminal de commandes sur une machine accédé par un réseau. Réaliser une connexion distante sur une machine vous permet d'interagir avec, comme si vous étiez physiquement à côté d'elle.
Il existe trois formes de connexions distantes : texte, bureau et X11. Au département, vous utiliserez principalement les connexions texte et bureau pour travailler. Les connexions textes transfèrent des caractères entre les deux machines, les connexions bureau transfèrent des flux vidéos de la machine distante vers votre machine.

Il existe donc une différence de consommation réseau entre les deux. La connexion texte étant bien évidemment la plus ancienne et la moins consommatrice de bande passante.

Les connexion ssh/telnet(version non cryptée) sont accessibles sur quasiment tous les équipement que l'on peut configurer à distance. Les machines générales comme les PC en salle informatiques, les serveurs, les routeurs réseau ou encore votre box Fibre. Il donc très utile de savoir se connecter par ssh sur un équipement.

Pour travailler à distance en mode texte vous devez savoir :
 - utiliser le terminal local à votre machine (cf documentation)
 - démarre le vpn (cf documentation)

## Terminal Macos / linux

Dans un terminal taper la commande ``ssh [Login_INSA]@[machine]`` avec un nom de machine valide. Puis votre mdp est demandé. Une fois saisi, vous vous retrouvez avec la même interface de commande qu'un terminal de votre système d'exploitation.

L'image suivante montre un bureau macosx avec une connexion vpn, une connexion ssh et un terminal local.
![](https://i.imgur.com/dPnjiv4.png)
