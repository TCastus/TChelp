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

La commande git `clone` télécharge la version initiale du projet TCHelp à partir d'une machine distante 'github.com'. La commande va stocker votre projet dans deux répertoires distincts.

Le répertoire `TCHelp`, contient une première copie de la version courante du projet. Vous allez apporter toutes les modifications voulue dans cette copie de travail. Git appelle cet espace le `Workspace`.

Le répertoire caché `TCHelp/.git` contient une seconde copie compacté de l'intégralité du projet. (Unix considère que les répertoires qui commencent par `.` sont cachés). Cette seconde copie caché, contient toutes les versions existantes depuis la création du projet. Une fois copié, le Workspace est créé et les fichiers de travail sont fabriqués dans le premier répertoire. Vous possédez une copie totale et locale de l'ensemble de l'évolution du projet. Git appelle ce répertoire le `dépôt local (local repository)`. Pour l'instant nous ne travaillons que sur la dernière version du projet. A chaque modification que vous allez effectuer dans votre 'Workspace', git pourra réaliser une commande diff pour identifier les différences que vous aurez apporté par rapport à la version en cours stockée dans le dépôt local.

Workspace(ori) == Dépôt(ori)

Git possède donc les deux versions des fichiers toto.txt et titi.txt expliqués précédemment. Votre Workspace contient les fichiers que vous êtes en train de modifier, votre dépôt local contient la dernière version courante du projet.

#### Faisons une expérience simple

Supprimez l'ensemble des fichiers de votre workspace. Faites attention à ne pas vous tromper de répertoire en supprimant les fichiers...
```bash
$ cd /tmp/TChelp
$ rm -r *
```

Votre workspace est donc vide. Vous pouvez le vérifier avec la commande `ls`.

Workspace(Ø) != Dépôt(ori)

A partir d'ici vous avez deux possibilités. Vous pensez que vous avez fait une erreur en supprimant ces fichiers ou vous pensez en effet qu'il s'agit de la version suivante de votre projet.

#### Vous avez fait une fausse manipulation
La première commande git que vous allez apprendre, consiste à rétablir les fichiers enregistrés dans votre dépôt et qui correspondent à la version en cours.
```bash
$ git checkout .
Updated 15 paths from the index
```

La commande `checkout` s'applique sur un répertoire ou sur une version des fichiers. Dans notre cas, on indique que le répertoire courant '.' doit revenir à l'état enregistré dans le dépôt. Notez bien que cette commande est excutée localement à votre machine. Vous n'avez pas à être connecté à Internet, pour récupérer la version courante de votre projet. A la suite de votre commande votre répertoire de travail est de nouveau à jour avec votre dépôt.

Vous pouvez `checkouter` un répertoire ou un fichier que vous avez manipulé, si vous voulez revenir sur la version initiale de travail.

#### Vous considérez qu'il s'agit bien d'une nouvelle version
Votre repertoire TCHelp est donc vide, et vous voulez considérer cette version comme la version en cours de votre projet.

Vous allez maintenant créer une nouvelle version de votre projet.

La premieère commande à connaitre est la commande git 'status'. Elle vous donne l'état de votre Worspace par rapport au dépôt.
```bash
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	deleted:    GNS3/Presentation.md
	deleted:    Gestionnaire_de_paquets_windows/Chocolatey/Presentation.md
	deleted:    Git_GitHub/GPG_verification_commit.md
	deleted:    Git_GitHub/Presentation.md
	deleted:    Git_GitHub/TODO.md
	deleted:    Jet_brains/Utilisation_generale.md
	deleted:    README.md
	deleted:    TODO.md
	deleted:    guides/1-Terminal.md
	deleted:    guides/2-VPN.md
	deleted:    guides/3-ConnexionDistanteSSH.md
	deleted:    guides/31-ConnexionDistanteSSH-ClePublique.md
	deleted:    guides/4-ConnexionDistanceBureauVirtuel.md
	deleted:    guides/5-ConnexionDistanceX11.md
	deleted:    guides/Logiciels.md

no changes added to commit (use "git add" and/or "git commit -a")
```

Les deux premières lignes de la réponse indiquent que vous êtes à jour avec la version distante à partir de laquelle vous êtes parti. Nous verrons cela plus tard.

Puis git vous annonce qu'il voit des changements, mais qu'ils ne sont pas prévus pour être intégrés à la version suivante : 'Changes NOT stagged for commit'.

La dernière ligne vous indique que pour l'instant il n'y a aucune demande d'enregistré pour une version suivante.

Supposons maintenant que vous voulez acter la suppression du fichier README.md dans votre version courante. (Vous supposez que README.md ne sert plus dans votre projet). On utilise la commande git `rm` pour enregistrer la suppression d'un fichier.

```bash
$ git rm README.md
rm 'README.md'
$ git status
On branch master
Your branch is up to date with 'origin/master'.

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	deleted:    README.md

Changes not staged for commit:
  (use "git add/rm <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	deleted:    GNS3/Presentation.md
	deleted:    Gestionnaire_de_paquets_windows/Chocolatey/Presentation.md
	deleted:    Git_GitHub/GPG_verification_commit.md
	deleted:    Git_GitHub/Presentation.md
	deleted:    Git_GitHub/TODO.md
	deleted:    Jet_brains/Utilisation_generale.md
	deleted:    TODO.md
	deleted:    guides/1-Terminal.md
	deleted:    guides/2-VPN.md
	deleted:    guides/3-ConnexionDistanteSSH.md
	deleted:    guides/31-ConnexionDistanteSSH-ClePublique.md
	deleted:    guides/4-ConnexionDistanceBureauVirtuel.md
	deleted:    guides/5-ConnexionDistanceX11.md
	deleted:    guides/Logiciels.md
```

git vous indique maintenant que vous planifiez (commit) de valider la suppression du fichier README.md dans la prochaine version.
Pour les autres fichiers supprimés, git continue à vous dire qu'il ne sait pas quoi en faire, mais qu'ils ne sont pas plannifiés (not stagged) pour la version suivante. (`commit` est un engagement pour une version suivante).

Pour valider cette première modification vous pouvez exécuter la commande git 'commit' :
```bash
$ git commit -m'Suppression du fichier README.md pour test'
[master 764d91d] Suppression du fichier README.md
 1 file changed, 19 deletions(-)
 delete mode 100644 README.md
```

La commande commit, valide un plan d'engagement pour la version suivante. Ce plan doit indiquer ce que vous avez fait, ou pourquoi vous l'avez fait. Ici on utilise l'option `-m` avec un message qui indique la raison de cette nouvelle version.

git vous annonce l'existence d'une nouvelle version de votre projet : 764d91d. Et que globalement cette version a supprimé un fichier qui s'appellait README.md.

Pour résumer :
La nouvelle version, est donc la première version sans le fichier README.md.  
Votre Workspace est vide, mais seule la suppression de README.md a été acté.

Vous pouvez vérifier cela, en récupérant l'état courant de votre projet à partir du Dépôt. Si le `checkout` du répertoire courant fonctionne, vous devriez retrouver tous vos fichiers sans le README.md.

```bash
$ git checkout
Updated 14 paths from the index
$ ls
GNS3                            Git_GitHub                      TODO.md
Gestionnaire_de_paquets_windows Jet_brains                      guides
```
Tous les fichiers sont présents sauf le README.md













# Ressources
https://openclassrooms.com/fr/courses/2342361-gerez-votre-code-avec-git-et-github

## Qu'est ce que git ?

## A quoi sert Git ?

##
