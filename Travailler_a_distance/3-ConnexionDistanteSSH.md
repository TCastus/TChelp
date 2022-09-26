:house: [**Retour au menu principal**](/TChelp)

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

## Terminal Macos / Linux

Dans un terminal taper la commande ``ssh [Login_INSA]@[machine]`` avec un nom de machine valide. Votre mot de passe est alors demandé. Une fois saisi, vous vous retrouvez avec la même interface de commande qu'un terminal de votre système d'exploitation.

L'image suivante montre un bureau macosx avec une connexion vpn, une connexion ssh et un terminal local.
![terminal avec ssh](https://i.imgur.com/USgO52S.png)

## Windows

### Terminal Windows

Les fonctions de connexion distantes sont maintenant natives dans l'OS.
Exécutez ces fonctions directement dans un terminal windows.

#### Si vous ne les avez pas

Il faut activer les services SSH. Pour cela : Paramètres -> Applications -> Gérer les fonctionnalités facultatives -> Ajouter un fonctionnalité -> OpenSSH client -> Installer -> redémarrer la machine.

- Petit tuto en cas ou <https://www.pcastuces.com/pratique/astuces/5235.htm>)

Ensuite dans un terminal windows (cmd dans la recherche Windows ou win+r et taper cmd ou windows terminal) taper la commande ``ssh [Login_INSA]@[machine]``. Puis votre mdp est demandé.

# scp

Une commande importante à connaître avec ssh, est la copie de fichiers sécurisé (scp) à partir ou vers une machine distante. En supposant qu'on a un fichier `toto.txt` dans la fenêtre de votre terminal, les deux commandes sont :

```bash
scp toto.txt [nomLogin]@[nommachine]:
scp [nomLogin]@[nomMachine]:toto.txt .
```

Notez le '@' après votre nom de login, et le ':', qui indique qu'il s'agit d'une machine distante. Sinon la commande est toujours la même : `scp <source> <destination>`

![scp](https://i.imgur.com/sbssnDV.png)
