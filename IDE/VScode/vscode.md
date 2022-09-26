:house: [**Retour au menu principal**](/TChelp)

# Introduction à [Visual Studio Code](https://code.visualstudio.com/)

[Visual Studio Code](https://code.visualstudio.com/) est un éditeur de texte qui comporte des fonctionnalités orientées développement. Il est utilisable avec la grande majorité des languages grâce aux extensions qui permettent de le personnaliser.

> Disclaimer
> Ce n'est pas un IDE aussi complet et spécifique que les logiciels de la suite [JetBrains](https://www.jetbrains.com/) par exemple. Il faut peser le pour et le contre en fonction de ses préférences.

## Table des matières

- [Introduction à Visual Studio Code](#introduction-à-visual-studio-code)
  - [Table des matières](#table-des-matières)
  - [Principaux avantages](#principaux-avantages)
  - [Installation](#installation)
    - [Ubuntu](#ubuntu)
    - [Windows avec chocolatey](#windows-avec-chocolatey)
  - [Découverte de l'interface](#découverte-de-linterface)
  - [Découverte des activités](#découverte-des-activités)
  - [Conseils et prise en main (débutant)](#conseils-et-prise-en-main-débutant)
  - [Les extensions](#les-extensions)
  - [Settings](#settings)
  - [Pour aller un peu plus loin](#pour-aller-un-peu-plus-loin)
    - [Automatiser un peu](#automatiser-un-peu)
    - [Debug et breakpoints](#debug-et-breakpoints)
    - [Autodidactisme](#autodidactisme)
      - [Extensions sympas](#extensions-sympas)

## Principaux avantages

| VScode | Suite JetBrain |
| -------- | -------- |
| Léger et rapide (tourne sous n'import quelle machine ) | Particulièrement puissant et adapté |
| 1 seul logiciel pour tout | Très adapté pour un language en particulier |
| Pas forcément que pour du "code" | Beaucoup de raccourcis et fonctionnalités pour simplifier la programmation |
| Ne nécessite pas de license pour l'utiliser dans le monde professionnel | |

## Installation

Page de [téléchargement](https://code.visualstudio.com/download) sur le site de VSCode

### Ubuntu

`sudo snap install --classic code`

### Windows avec chocolatey

`choco install vscode`

## Découverte de l'interface

Lorsqu'on ouvre le logiciel, la fenêtre qui s'affiche comporte plusieurs panneaux.

![vscode_interface](https://i.imgur.com/PJzsghk.png)

- En haut, la classique barre de menus

- Tout à gauche, la barre des activités (avec les icônes)

- Juste à côté le menu des activités qui change de "mode" en fonction de l'onglet choisi à gauche.

   > :keyboard: **Shortcut**: ***Ctrl+B*** pour le cacher ou l'afficher

- En grand le panneau principal qui affiche les fichiers ouverts avec les onglets en haut.

   > :bulb: **Tips**: En glisser-déposer on peut afficher plusieurs onglets côte à côte ou les uns au-dessus des autres...

- Il reste un panneau qui va servir a afficher les ~~nombreuses~~ erreurs dans ton code, les logs etc. Il est visible en allant dans le menu view et en cliquant sur Output, Debug Consol, Terminal ou Problems. Ce sont d'ailleurs ses fonctionnalités.

   > :keyboard: **Shortcut**: ***Ctrl+Maj+M*** pour les problèmes, ***Ctrl+ù*** pour le terminal, etc. (Tout est marqué dans le menu view)

## Découverte des activités

La barre des activités permet de naviguer dans les différents modes de l'éditeur, de base plusieurs modes sont présents (de haut en bas):

- **Explorer**: L'explorateur de fichiers du logiciel, il affiche les fichiers du dossier (aka projet) ouvert
- **Search**: :Explicit content:
- **Source Control**: L'onglet pour gérer git depuis le logiciel

> Si tu ne sais pas ce que c'est git, va jeter un coup d'œil au[tutoriel dédié](https://github.com/TCastus/TChelp/blob/master/Git_GitHub/1-Git.md)

- **Run**: Pour exécuter/déboguer des commandes, des tests ou tout simplement tes programmes directement dans le logiciel
- **Extensions**: Le marché des extensions :shopping_bags: :grinning_face_with_star_eyes:
- **Tests**: Un peu spécifique :) (en fait je sais pas trop a quoi il sert...) *(Note : Tests est pas présent de base chez moi, on le laisse ?, GW)*

## Conseils et prise en main (débutant)

Dans VSCode il est assez rare de n'ouvrir qu'un fichier. L'explorateur intégré et les fonctions de l'onglet source control font qu'il est souvent bien plus pratique d'ouvrir le projet directement.

> ​ :keyboard: **Shortcut**: Pour ouvrir un dossier ***Ctrl+K*** suivi de ***Ctrl+O***

Le logiciel est bourré de fonctionnalités très pratique (formatage automatique du code avec les bonnes indentations, etc. ) et **tout** est accessible par

:star: :star: **la palette de commandes** :star: :star: aka ***Ctrl+Maj+P***

Il suffit alors de taper le nom de ceux qu'on veut faire, par exemple *Format Document*.

## Les extensions

Rapidement les extensions deviennent indispensables, elle permettent des fonctionnalités supplémentaires en fonction du language etc.
Pour le début de l'année (PIT) vous allez faire du python donc il est conseillé d'installer l'extension python officielle de Microsoft :slightly_smiling_face:

Pour faire cela rien de plus simple, il suffit d'aller dans l'activité (tout en bas sur la barre de gauche) et de taper dans le champ de recherche : "python".
La première ligne devrait être l'extension Python officielle de Microsoft. Elle est aussi normalement marqué d'une étoile blanche en haut à gauche ce qui indique que c'est une extension recommandé.

![vscode_plugin](https://i.imgur.com/VfD53cX.png)

Il vous suffit de cliquer sur installer le bouton vert 'Install' et le tour est joué !

Si vous voulez plus d'information sur ce que fait l'extension et a ses utilisations possible vous pouvez cliquer sur le nom et vous aurez accès a [la page de l'extension](https://marketplace.visualstudio.com/items?itemName=ms-python.python), aussi accessible sur internet ainsi que ses paramètres.

## Settings

Pour stocker les préférences le logiciel utilise un fichier ``settings.json``. Vous pouvez le modifier directement ou utiliser le menu File>Preferences>Settings

## Pour aller un peu plus loin

### Automatiser un peu

Pour automatiser un peu les actions récurrentes (comme lancer son programme ) VScode utilise le fichier launch.json

Il faut aller dans l'activité Run/Debug (4ème icône).

![vscode_debug](https://i.imgur.com/howg76n.png)

Par exemple dans ce cas le fichier à créer correspond au template Python File.

![vscode_select_config_file](https://i.imgur.com/8pFHB2k.png)

VSCode ajoute alors un dossier .vscode avec la config
le fichier launch.json ressemble à ça

```js
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python : Fichier actuel",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal"
    }
  ]
}
```

Cette action nommée "Python : Fichier actuel" lance le fichier que l'on est en train de modifier: `${file}`.

On ajoute une action qui lancera toujours le même fichier (test.py) dans un terminal extérieur. Et voilà le nouveau fichier:

```js
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Python : Fichier actuel",
      "type": "python",
      "request": "launch",
      "program": "${file}",
      "console": "integratedTerminal"
    },
    {
      "name": "Python : test.py",
      "type": "python",
      "request": "launch",
      "program": "${workspaceFolder}/test.py",
      "console": "externalTerminal"
    }
  ]
}
```

> ​ :bulb: **Tips**: `${file}`, `${workspaceFolder}` sont des variables qui permettent de faire fonctionner le script de n'importe quel dossier, ordi, etc.
La liste complète des variables supportées est ici <https://code.visualstudio.com/docs/editor/variables-reference>.

Et voilà ça marche :tada:, plus qu'à cliquer sur le triangle vert !

![vscode_debugger](https://i.imgur.com/7BlKFVg.png)

![cmd_windows](https://i.imgur.com/nZ2XaIo.png)

### Debug et breakpoints

Une fonctionnalité très *très* **très** ***très*** importantes d'un éditeur de code est sa capacité à permettre de debugger le code écrit. Pour cela on utilise les breakpoints qui permettent de mettre en pause l’exécution d'un programme à un endroit précis.

Dans un VSCode placer un breakpoint est simple, il suffit de cliquer à gauche du numéro de ligne pour voir apparaître un point rouge.

Il est alors possible d'inspecter les variables à une ligne précise par exemple lorsque l'on lance le programme en mode debug. Pour cela il suffit d'appuyer sur ***F5*** ou alors Run>Start Debugging.

![step_by_step_debug](https://i.imgur.com/PsE4TBv.png)

### Autodidactisme

Bon forcément y'a encore plein de fonctionnalités très pratiques qu'on n'a pas expliqué, ou tout simplement qu'on ne connaît pas... Ca vaut le coup de trainer sur une video avec les meilleures extensions VScode, la doc officielle du logiciel ou même demander à un 4A. Voila quelques liens en vrac :

#### Extensions sympas

- [better comments](https://marketplace.visualstudio.com/items?itemName=aaron-bond.better-comments)
- [bracket pair colorizer 2](https://marketplace.visualstudio.com/items?itemName=CoenraadS.bracket-pair-colorizer-2)

[Doc officielle VScode](https://code.visualstudio.com/docs)

Help > Keyboard Shortcut Reference ouvre une page avec les principaux raccourcis clavier du logiciel

**Bonne année en TC :smile:**
