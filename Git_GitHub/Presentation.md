# Présentation de Git
##### Tags : git, github
Git est un outil de gestion de version de fichier. Il permet de conserver sur votre machine local l'ensemble des modifications que vous effectuez sur un ensemble de fichier.

L'usage principal provient de la gestion de code informatique, car une modification d'une ligne de programme peut entrainer des bugs, et se souvenir des lignes de programme rédigées la veille, la semaine passée ou l'année précédente peut être complexe. Les bugs n'apparaissent pas toujours le jour de la correction...
Git est aujourd'hui le produit de gestion de version de code le plus avancé. Des outils similaires existent depuis les années 1970, pour maintenir les codes source de gros projets. Git est aujourd'hui utilisé de manière plus général que pour de la maintenance de code source, comme par exemple pour discuter de textes de loi dans certains pays européens.

Git est un outil que vous utilisez pour gérer vos mises à jours de code source ou du texte. Actuellement, pour lire ce document texte, vous accédez à un site web `github` qui stocke une copie des documents que vous êtes en train de lire. `Github.com` n'est donc pas un outil, mais un site de stockage, de récupération et d'indexation de projets reposant sur des documents au format caractères. C'est le cas du code source informatique, ou du document au format `markdown` que vous êtes en train de consulter.

On doit donc présenter `git` et `github` de manière séparée.

# Git
## Installation
Git est un logiciel que vous devez installer sur votre machine.
- MacosX : par défaut il est disponible
- Linux : installez le à partir de votre gestionnaire de package favoris
- Windows : vous pouvez l'installer avec chocolatey

Vous devez tester votre installation en tapant la commande
```bash
$ git --version
git version 2.21.0 (Apple Git-122)
$
```
La version n'est pas importante, mais si vous obtenez un autre message commande comme par exemple `zsh: command not found: git`

## Principes initiaux
Git cherche à gérer les différences existantes entre deux évolutions d'un fichier. Les répertoires (dossiers) sont des fichiers particuliers qui référencent d'autres fichiers. Git doit initialement pouvoir identifier les différences entre deux fichiers.

Voici un exemple : vous avez deux fichiers consécutifs toto.txt et titi.txt.
```bash
toto.txt :
----------
Bonjour, je s\'appelle
Stéphane
```
```bash titi.txt
titi.txt :
----------
Bonjour, je s\'appelle
Groot
```
On peut supposer que toto a servi de base pour titi.
toto.txt -> titi.txt

Et que ces deux fichiers ne sont qu'une version 0 et une version 1 d'un même document. Il aurait évolué d'un contenu `Stéphane` vers un contenu `Groot`.
La commande `diff` permet d'exprimer la différence entre deux fichiers textes.
Git va utiliser cette commande pour identifier tous les changements présents dans les fichiers que vous manipuler. Il va vous permettre de commenter tous ces changements. Vous pourrez alors suivre les évolutions que vous avez apporté à votre texte, en relisant les informations associées à chaque changement ou à chaque groupe de changement. A vous de choisir la granularité des enregistrements de changements.

```bash
$ diff toto.txt titi.txt
2c2
< Stéphane
---
> Groot
```
Le résultat de la commande `diff` indique que la ligne 2 du fichier toto est différente de la ligne 2 du fichier titi. Pour appliquer la différence, il faut retirer le texte 'Stéphane' pour le remplacer par le texte 'Groot'.

Git est un outil qui permet de gérer le suivi d'un projet, en utilisant diff pour repérer les modifications apportées à un ensemble de fichiers.

## Utilisation de git
git peut s'utiliser en partant d'un répertoire vide sur votre poste de travail. La plupart du temps on part d'un projet existant qu'on va modifier pour le faire évoluer. Par exemple si vous devez faire un texte, on part d'une version initiale du texte pour le faire évoluer. Pour un logiciel, on peut partir d'un ensemble de fichiers initiaux pour les faire évoluer.

Pour comprendre les commandes de base de git, nous l'utiliserons de manière simple à partir d'un projet existant. Par exemple le projet que vous êtes en train de consulter.

Travailler sur un projet consiste à exécuter les commandes suivantes :
 - Récupérer sur votre poste de travail la version initiale du projet
 - Faire vos modifications
 - Enregistrer vos modifications localement sur votre machine

Pour l'instant, il n'est pas question de travail de groupe collaboratif. La première fonction de git est de conserver pour vous un historique des modifications que vous réalisez dans votre projet.

### Manipulation minimale de mon projet
Dans une fenêtre de commande déplacez vous dans le répertoire `/tmp` de votre machine. Lancez la commande :
```bash
$ git clone git@github.com:TCastus/TChelp.git
Cloning into 'TChelp'...
remote: Enumerating objects: 142, done.
remote: Counting objects: 100% (142/142), done.
remote: Compressing objects: 100% (99/99), done.
remote: Total 142 (delta 73), reused 100 (delta 35), pack-reused 0
Receiving objects: 100% (142/142), 34.03 KiB | 313.00 KiB/s, done.
Resolving deltas: 100% (73/73), done.
```

Cette commande télécharge la version initiale du projet TCHelp sur lequel vous voulez travailler, et va stocker cette version dans deux répertoires distincts.

Le répertoire `TCHelp`, contient une première copie de la version initiale du projet. Vous allez apporter toutes les modifications voulue dans cette copie de travail. Git appelle cet espace le `Workspace`.

Le répertoire caché `TCHelp/.git` contient une seconde copie compacté de la version initiale. (Unix considère que les répertoires qui commencent par . sont cachés). Cette seconde copie caché, contient la référence initiale de vos projets, ainsi que toutes les versions existantes depuis la création du projet. Vous possédez une copie totale de l'ensemble de l'évolution du projet. Mais pour l'instant nous sommes sur la dernière version du projet. A chaque modification que vous allez effectuer dans votre 'Workspace', git pourra réaliser une commande diff pour identifier les différences que vous avez apporté par rapport à la version en cours dans le répertoire `.git`.




Cette seconde version stocke les verinitiale des fichiers sous un format compact. Elle stocke également l'intégralité de toutes les versions depuis la création de votre projet.






# Ressources
https://openclassrooms.com/fr/courses/2342361-gerez-votre-code-avec-git-et-github

## Qu'est ce que git ?

## A quoi sert Git ?

##
