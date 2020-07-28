:house: [**Retour au menu principal**](/TChelp)

# Terminal de commandes

###### tags: `Assistance` `Terminal`

Un terminal de commande et une fenêtre qui permet d'intergir en mode texte
avec votre système d'exploitation. Savoir ouvrir un terminal est fondamental
pour interagir avec une machine. Les trois systèmes d'exploitation principaux sont
unix, windows et macos. Unix est un système générique avec plusieurs possibilités
de distributions. La distribution utilisée à l'INSA est une debian. Concernant Windows, il est nécessaire de travailler sous windows 10.
Pour MacosX, on recommande la dernière version en cours Catalina.

Pas d'inquiétude si vous n'avez pas exactement la version adéquate, un système
d'exploitation fait toujours un peu la même chose...

Il faut cependant savoir ouvrir un terminal quelque soit votre système d'exploitation.

A chaque fois qu'un enseignant vous demande d'ouvrir une fenêtre de commande, de taper une commande, d'ouvrir un shell, d'exécuter un programme, de lancer un CLI, de pinguer une machine... cela peut se faire rapidement à partir d'un terminal.

# MacosX
Dans MacOs, le terminal est initialement caché dans 'Autre' application de votre
Launchpad.
![](https://i.imgur.com/I6pxbxj.png)

Nous vous conseillons d'ajouter cette application à votre dock macosx en glissant l'icône dessus.

![](https://i.imgur.com/X5bNsh9.jpg)

Un terminal propose une interface texte de commande avec le système d'exploitation.
Voici un bureau de MacosX avec quatre terminaux ouverts simultanément.
![](https://i.imgur.com/sbssnDV.png)

## Alternatives
Pour macos, il existe des terminaux alternatifs de substitution. Un terminal classique est iterm2, qui offre quelques fonctions avancées d'interaction.

https://medium.com/swlh/4-apps-must-install-on-your-mac-for-development-in-2020-3d8cd81c316c

# Windows 10
Pour lancer un terminal windows, il faut rechercher l'exécutable cmd.
!! Attention, les machines de l'INSA sont sous windows 7, les commandes indiquées sont pour une utilisation de windows 10.

## Terminaux alternatifs
Pendant longtemps, windows ne fournissait pas de terminaux d'accès distant. La fenêtre de commande windows était réservé aux commandes locales. Des terminaux alternatifs ont été développés pour accéder aux machines distantes. Ces solutions alternatives sont maintenant devenues inutiles.

Il existe deux outils classiques de terminaux pour windows. Putty et MobaXterm
https://www.putty.org/
https://mobaxterm.mobatek.net/

Certains utilisateurs par habitude continuent de les utiliser.

## Powershell
Il y a plusieurs choix proposé par Windows. L'utilisation de cmd est suffisante pour les commandes de bases tel que du parcours de fichier, git ... Cependant la similitude avec l'univers UNIX est marquée, le ``ls`` devient ``dir``, ``rm`` -> ``del``et j'en passe.

Une autre solution est PowerShell, ici les commandes connues sous UNIX sont fonctionnelles, et sont un peu à rallonge. Mais nous avons ici une plus grande possibilité avec des commandes plus avancées.

La dernière solution est d'utiliser le terminal open source de Windows, un terminal entièrement personnalisable et la possibilité de l'utiliser pour les WSL (tuto a venir). Ce dernier reprend exactement les invite de commande cmd et PowerShell mais permet en plus d'avoir plusieurs onglets, des raccourcis clavier...
