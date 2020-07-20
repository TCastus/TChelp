# Introduction a Visual Studio Code

Visual studio code est un éditeur de texte qui comporte des fonctionnalités orientées développement. Il est utilisable avec la grande majorité des languages grâce aux extensions qui permettent de le personaliser.

**Disclaimer**

Ce n'est pas un IDE aussi complet et spécifique que les logiciels de la suite [JetBrain](https://www.jetbrains.com/) par exemple. Il faut peser le pour et le contre en fonction de ses préférences.

**Principaux avantages**

| VScode | Suite JetBrain |
| -------- | -------- |
| Léger et rapide (tourne sous n'import quelle machine ) | Particulièrement puissant et adapté |
| 1 seul logiciel pour tout | Très adapté pour un language en particulier |
| Pas forcément que pour du "code" | |

## Installation - TODO

Page de [téléchargement](https://code.visualstudio.com/download) sur le site de vscode

### Ubuntu

`sudo snap install --classic code`

### Windows avec chocolate

`choco install vscode`

## Découverte de l'interface

Lorsqu'on ouvre le logiciel, la fenêtre qui s'affiche comporte plusieurs panneaux.

![](https://i.imgur.com/PJzsghk.png)

 - En haut, la classique barre de menus
 - Tout à gauche, la barre des activités (avec les icones)
 - Juste à côté le menu des activités qui change de "mode" en fonction de l'onglet choisi à droite.
:::info
:keyboard: **Shortcut**: ctrl+b pour le cacher ou l'afficher
:::
 - En grand le panneau principal qui affiche les fichiers ouverts avec les onglets en haut.
:::success
:bulb: **Tips**: En glisser-déposer on peut afficher plusieurs onglets côte à côte ou les uns au-dessus des autres...
:::
 - Il reste un panneau qui va servir a afficher les ~~nombreuses~~ erreurs dans ton code, les logs etc. Il est visible en allant dans le menu view et en cliquant sur Output, Debug Consol, Terminal ou Problems. Ce sont d'ailleurs ses fonctionnalitées.
:::info
:keyboard: **Shortcut**: ctrl+maj+M pour les problèmes, ctrl+ù pour le terminal, etc. (tout est marqué dans le menu view)
:::

## Découverte des activités

La barre des activités permet de naviguer dans les différents modes de l'éditeur, de base plusieurs modes sont présents (de haut en bas):
 - **Explorer**: L'explorateur de fichiers du logiciel, il affiche les fichiers du dossier (aka projet) ouvert
 - **Search**: :Explicit content:
 - **Source Control**: L'onglet pour gérer git depuis le logiciel
:::info
Si tu ne sais pas ce que c'est git, va jeter un coup d'oeil au tutoriel dédié
:::
 - **Run**: Pour éxécuter/débogger des commandes, des tests ou tout simplement tes programmes directement dans le logiciel
 - **Extensions**: Le marché des extensions :shopping_bags: :grinning_face_with_star_eyes: 
 - **Tests**: Un peu spécifique :) (en fait je sais pas trop a quoi il sert...)

## Conseils et prise en main (débutant)

Dans VScode il est assez rare de n'ouvrir qu'un fichier. L'explorateur intégré et les fonctions de l'onglet source control font qu'il est souvent bien plus pratique d'ouvrir le projet directement.
:::info
:keyboard: **Shortcut**: Pour ouvrir un dossier ctrl+K suivi de ctrl+O
:::

Le logiciel est bourré de fonctionnalitées très pratique (formatage automatique du code avec les bonnes indentations etc... ) et **tout** est accessible par 

:star: :star: **la palette de commandes** :star: :star: aka ctrl+maj+P

Il suffit alors de taper le nom de ceux qu'on veut faire, par exemple *Format Document*.

## Les extensions

Rapidement les extensions deviennent indispensables, elle permettent des fonctionnalitées supplémentaires en fonction du language etc...
Pour le début de l'année (PIT) vous allez faire du python donc il est conseillé d'installer l'extension python officielle de microsoft :slightly_smiling_face: 

## Settings

Pour stocker les préférences le logiciel utilise un fichier settings.json. Vous pouvez le modifier directement ou utiliser le menu File>Preferences>Settings

## Pour aller un peu plus loin...

### Automatiser un peu

Pour automatiser un peu les actions récurrentes (comme lancer son programme ) VScode utilise le fichier launch.json

Il faut aller dans l'activité Run/Debug 

![](https://i.imgur.com/howg76n.png)

Par exemple dans ce cas le fichier à créer correspond au template Python File 

![](https://i.imgur.com/8pFHB2k.png)

VScode ajoute alors un dossier .vscode avec la config
le fichier launch.json ressemble à ça

```json
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

Cette action nommée "Python : Fichier actuel" lance le fichier que l'on est en train de modifier: `${file}`

On rajoute une action qui lancera toujours le meme fichier (test.py) dans un terminal extérieur. Et voila le nouveau fichier:

```json
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

:::success
:bulb: **Tips**: `${file}`, `${workspaceFolder}` sont des variables qui permettent de faire fonctionner le script de n'importe quel dossier, ordi, etc.
La liste complète des variables supportées est ici https://code.visualstudio.com/docs/editor/variables-reference
:::

Et voila ça marche :tada:, plus qu'à cliquer sur le triangle vert

![](https://i.imgur.com/7BlKFVg.png)

![](https://i.imgur.com/nZ2XaIo.png)

### Debug et breakpoints

Une fonctionnalité très très très très importantes d'un éditeur de code est ca capacité à permettre de débugger le code écrit. Pour cela on utilise les breakpoints qui permettent de mettre en pause l'éxecution d'un programme à un endroit précis.

Dans un vscode placer un breakpoint est simple il suffit de cliquer à gauche du numéro de ligne pour voir apparaitre un point rouge.

Il est alors possible d'inspecter les variables à une ligne précise par exemple

![](https://i.imgur.com/PsE4TBv.png)

**Bonne année en TC :smile:**
