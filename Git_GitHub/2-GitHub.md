# Présentation de GitHub
##### Tags : git, GITHHUB
GitHub est un site web de visualisation et de stockage de dépôts git. Vous vous souvenez que pour démarrer un projet git, on clone souvent un projet existant, github vous met à disposition les projets qu'il héberge publiquement. Vous pouvez également héberger vos propre projet sur le site de github.com à condition d'y avoir un compte.

Github offre une première fonction de navigation dans les fichiers d'un projet ainsi que dans tous l'historique des versions associées. Dans l'exemple précédent, nous avons cloné le projet git@github.com:TCastus/TChelp.git. Il s'agit d'un projet TCHelp, initialement créé par l'utilisateur TCastus, et hébergé sur le site github.com.

Lorsque vous clonez ce projet, vous en réalisez une copie qui est stockée dans un répertoire du nom du projet. Sous deux versions : une version cachée qui contient toutes les versions du projet depuis sa création, et un workspace qui contient la dernière version 'poussée' sur le serveur github.
Si vous avez bien suivi les explications précédentes, cloner un projet, consiste à récupérer son dépot local (.git), puis réaliser un checkout sur Origin/master afin de fabriquer le workspace avec la version courante du projet.

# Interagir avec le dépôt distant
Lorsque vous avez cloné le projet, git vas placer un marqueur origin/master sur la version courante du projet. Lorsque vous allez commiter localement des modifications, vos commit vont 'dépasser' le marqueur origin/master.
Vous pouvez revenir sur votre projet précédent et relancer la commande `log`.

```bash
$ git log
commit 01004f326a9eeeb864c97bad33c1a85b3589132f (HEAD -> master)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 20:53:41 2020 +0200

    Modifications du README.md et ajout du fichier TOTO.md

commit 8be820066d158fefc3c96b78b6591b1715511744
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 16:14:18 2020 +0200

    # Ajout du fichier README.md qu'on avait supprimé avant

commit 764d91dff713fd07d13679cbf881683365523522
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 14:17:55 2020 +0200

    Suppression du fichier README.md

commit 9918866df451e1815b87c7a9334d35d780ac96d7 (origin/master, origin/HEAD)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 09:16:13 2020 +0200

    Text fix
```
Lors de nos manipulations, nous avons commité localement des modifications ce qui fait avancer les versions en avant des marqueurs (orgin/master, origin/HEAD)

Cette même information est présentée lors d'un status.
```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 3 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```
Git m'indique que mon projet est en avance de 3 commits par rapport à la version que j'ai initialement récupéré. Il m'indique entre parenthèse la commande à réaliser pour publier mes versions sur le site distant qui s'appelle 'origin'.

Si vous n'êtes pas membre du projet, vous ne pourrez pas faire grand chose de plus.
Si au contraire vous êtes participant à un projet vous allez pouvoir 'pousser' votre dépôt local sur le site distant.

Résumons la situation, vous avez cloné un projet stocké sur github, mais vous n'êtes peut être pas le seul. Vous avez créé localement des nouvelles versions qui suivent les étapes de votre développement, mais vous n'êtes peut être pas le seul. Vous voulez maintenant diffuser au plus grand nombre votre nouvelle version, mais vous n'êtes peut être pas le seul... En résumé tous les utilisateurs qui travaillent sur le projet, le font de manière autonome et localement, puis ils vont vouloir pousser leurs version courante sur le site de référence.

La commande `push` permet de pousser vos modifications.

Trois cas peuvent se produire :

 - Vous êtes le premier à pousser vos modifications.
 - Vous arrivez après les autres et vos modifications sont compatibles
 - Vous arrivez après les autres et vous avez modifié les mêmes fichiers, mais les modifications ne sont pas compatibles.

# Vos modifications sont en avances sur tous les autres dépôts locaux modifiés
Voici les étapes 'classiques' après que le commit a été fait.
```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```
Votre dépot(branche) est en avance de 1 version sur la version orgin/master distante. Ce qui se constate également avec la commande log.

```bash
$ git log
commit 07b87bdd591f8e9264c69367dac873a8c1823ce2 (HEAD -> master)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Thu Jul 16 12:11:52 2020 +0200

    Modification de test

commit e3bdbf9d30efaeaff1144e600837aa01027d85af (origin/master, origin/HEAD)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Thu Jul 16 12:10:20 2020 +0200

    Ajout des doc git
```
Votre marqueur de tête pointe sur local/master, qui est en avance d'un commit sur orgin/master. Par contre vous ne savez pas si d'autres utilisateurs ont déjà pris de l'avance sur votre projet.

```bash
$ git push
Enumerating objects: 18, done.
Counting objects: 100% (18/18), done.
Delta compression using up to 4 threads
Compressing objects: 100% (12/12), done.
Writing objects: 100% (12/12), 1.49 KiB | 1.49 MiB/s, done.
Total 12 (delta 9), reused 0 (delta 0)
remote: Resolving deltas: 100% (9/9), completed with 3 local objects.
To github.com:TCastus/TChelp.git
   e7b9272..5eaf925  master -> master
```
Votre commande à validé votre dépôt local sur le site distant. La dernière version publique est maintenant 5eaf925, et les pointeurs master 'local' et 'orgin' sont sur la même version. Vous êtes à jour !!!

# Vous arrivez après les autres et vos modifications sont compatibles
Vous avez travaillé sur votre code, mais quelqu'un d'autre aussi. Il a poussé ses modifications avant les votres. On se place dans le premier cas, ou vos modifications sont compatibles avec les siennes. Vous n'avez pas travaillé sur les mêmes fichiers, ou sur les mêmes lignes, ou encore les modifications sont les mêmes...

```bash
$ git push
To github.com:TCastus/TChelp.git
 ! [rejected]        master -> master (fetch first)
error: failed to push some refs to 'git@github.com:TCastus/TChelp.git'
hint: Updates were rejected because the remote contains work that you do
hint: not have locally. This is usually caused by another repository pushing
hint: to the same ref. You may want to first integrate the remote changes
hint: (e.g., 'git pull ...') before pushing again.
hint: See the 'Note about fast-forwards' in 'git push --help' for details.
```
Votre mise à jour est rejetée, le site distant possède une version que vous ne possédez pas localement. Git vous demande d'intégrer les modifications distantes dans votre projet, puis de refaire votre push. Vous avez deux histoire de versions différentes.
Vous avez l'histoire A -> B, la version B arrive à la suite de la version A. Le site distante à l'histoire A -> C. Il voit instantanément qu'il y a un conflit dans le fil d'histoire. Vous devez faire un pull pour insérer B entre A et C.

```bash
$ git pull
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (1/1), done.
remote: Total 4 (delta 3), reused 4 (delta 3), pack-reused 0
Unpacking objects: 100% (4/4), done.
From github.com:TCastus/TChelp
   5eaf925..cced1b6  master     -> origin/master
Merge made by the 'recursive' strategy.
 Git_GitHub/2-GitHub.md | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)
```
Git vient de réécrire votre histoire ainsi  : A -> B -> D (B + C). La version D est une incorporation(merge) automatique de B venant d'un autre développeur et de C qui sont vos modifications. Cette intégration fabrique une version locale D. Vous êtes donc maintenant en avance de deux étapes par rapport à la version initialement à jour : B et D. Dans ce cas le merge s'est déroulé sans encombre les modifications étant compatibles.
Vous pouvez maintenant pousser la version sur le dépôt distant.

```bash
$ git push
Enumerating objects: 13, done.
Counting objects: 100% (12/12), done.
Delta compression using up to 4 threads
Compressing objects: 100% (7/7), done.
Writing objects: 100% (7/7), 781 bytes | 781.00 KiB/s, done.
Total 7 (delta 4), reused 0 (delta 0)
remote: Resolving deltas: 100% (4/4), completed with 2 local objects.
To github.com:TCastus/TChelp.git
   cced1b6..a25736b  master -> master
```
Tout le monde est maintenant d'accord sur l'histoire A -> B -> C -> D

# Vous arrivez après les autres et les modifications ne sont pas compatibles
Voici ce qui se passe à l'étape du merge dans ce cas.






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

#### Vous voulez revenir en arrière
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

Vous venez d'ajouter une nouvelle version à la liste des versions de votre projet. Vous pouvez lister toutes les versions de votre projet avec la commande git `log`.

```bash
$ git log
commit 764d91dff713fd07d13679cbf881683365523522 (HEAD -> master)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 14:17:55 2020 +0200

    Suppression du fichier README.md

commit 9918866df451e1815b87c7a9334d35d780ac96d7 (origin/master, origin/HEAD)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 09:16:13 2020 +0200

    Text fix

commit 86baf19700805fc04bfae5698263778caa055282
Merge: d10762f bb4d7a4
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Fri Jul 10 11:35:54 2020 +0200

    Merge branch 'master' of github.com:TCastus/TChelp
```
Le résultat de la commande vous indique que votre version en cours (HEAD->master) est la 764d91d (dernier commit), et que la personne qui a validé ce commit a indiqué la 'Suppression du fichier README.md'.


Votre projet contient un certain nombre de versions. Elles ont toute un numéro de commit qui l'identifie de manière unique. Vous pouvez revenir sur une version particulière avec la commande `checkout` mais en indiquant cette fois-ci non pas un fichier ou un répertoire, mais un numéro de commit de version.

Revenons par exemple sur la version '86baf197'. Comme vous avez cloné le projet initial que je possède, cette version existe également chez vous dans votre dépôt. La commande `checkout`, va juste remettre tous les fichiers dans l'état où ils étaient dans la version '86baf197' du 10 juillet 2020 à partir du dépôt que vous possédez.

```bash
$ git checkout 86baf197
Note: checking out '86baf197'.

You are in 'detached HEAD' state. You can look around, make experimental
changes and commit them, and you can discard any commits you make in this
state without impacting any branches by performing another checkout.

If you want to create a new branch to retain commits you create, you may
do so (now or later) by using -b with the checkout command again. Example:

  git checkout -b <new-branch-name>

HEAD is now at 86baf19 Merge branch 'master' of github.com:TCastus/TChelp
```

git vous indique que la tête de mise à jour des version est détachée et que vous vous êtes placé sur une version spécifique antérieure. Vous pouvez y retrouver une version du fichier README.md.
Comment le remettre dans votre version courante... Comment récupérer votre ancienne version de fichier.

Vous savez maintenant que votre fichier est présent dans la version '86baf197'. Vous allez donc revenir à la version courante, puis checkouter votre fichier provenant de cette version. Pour revenir à votre projet en cours, vous aller vous replacer sur l'identifiant 'master' de votre projet.

```bash
$ git checkout master
Previous HEAD position was 86baf19 Merge branch 'master' of github.com:TCastus/TChelp
Switched to branch 'master'
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)
```
La commande vous répond que vous étiez sur la version 86baf19, que maintenant vous êtes sur la branche master de votre projet.

Vous pouvez maintenent récupérer votre fichier de l'ancienne version du projet.

```bash
$ git checkout 86baf19 README.md
Updated 1 path from 2b7e802
```
Vous venez de recopier le fichier README.md provenant de la version 86baf19 de votre projet dans votre Workspace courant. La commande 'status' vous indique que le fichier a été récupéré et qu'il est déjà prêt a être intégré dans la prochaine version commité. Nous allons valider cette nouvelle version de projet avec la commande commit et pour message : "Ajout du fichier README.md qu'on avait supprimé avant"

```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 1 commit.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	new file:   README.md
$ git commit -m"Ajout du fichier README.md qu'on avait supprimé avant"
[master 8be8200] Ajout du fichier README.md qu\'on avait supprimé avant
 1 file changed, 19 insertions(+)
 create mode 100644 README.md
```

Le système git nous annonce une nouvelle version de projet, la 8be8200 qui est la nouvelle version 'master' de travail.

Un dernier coup d'oeil nous indique la suite des versions du projet.  

```bash
commit 8be820066d158fefc3c96b78b6591b1715511744 (HEAD -> master)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 16:14:18 2020 +0200

    Ajout du fichier README.md qu\'on avait supprimé avant

commit 764d91dff713fd07d13679cbf881683365523522
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 14:17:55 2020 +0200

    Suppression du fichier README.md

commit 9918866df451e1815b87c7a9334d35d780ac96d7 (origin/master, origin/HEAD)
Author: Stephane Frenot <stephane.frenot@insa-lyon.fr>
Date:   Wed Jul 15 09:16:13 2020 +0200

    Text fix
```

Nous avons initialement 'cloné' le projet, en copiant la version stockée sur un site web distant. Cette version (99188) est marquée (taggée). origin/master, origin/HEAD, ces deux marqueurs indique la version courante de travail distante.

Puis nous avons créé la version 764d91 qui contient le projet sans le fichier README.md

Enfin nous avons créé la version 8be82 qui contient une version contenant le fichier README.md provenant d'une version précédente du projet. Cette version 8be82, est également taggée comme étant la tête HEAD du projet : c'est là où les commit iront et master qui représente la version la plus avancée de votre projet local. (On devrait lire local/master par rapport à la version 9918 qui elle est origin/master).

Pour rappel, git est fait pour que vous puissiez, en tant que développeur suivre les modifications que vous faites sur un projet initialement créé ou récupéré. Les commandes présentées jusque maintenant ne font pas appel au réseau (à part pour le clone initial). Cele vous permet de suivre toutes les modifications que vous réalisez sur votre projet.

Dans un cas extrême de travail, pouvez avoir un commit par ligne de code ajouté ou modifié de votre programme. Git fournit un mécanisme de sauvegarde rapide de vos modifications, et il est impossible de perdre des données dans git, tant que vous ne modifiez pas à la main le repértoire '.git'.

C'est un outil de protection des développeurs contre les erreurs de manipulation. L'outil enregistre toutes les modifications validées depuis le lancement du projet. Pour récupérer une très très vielle version d'un projet il suffit de checkouter une très très vieille version du projet. Tout ceci localement à votre machine.

Il existe de très nombreuses autres fonctions permettant de manipuler les différentes informations entre le workspace et le dépôt local. Il existe de nombreuses autres fonctions pour gérer plus finement vos versions comme par exemple les branches. Il existe de nombreuses commandes pour comprendre et manipuler la base de stockage du dépôt. Vous apprendrez ces commandes au besoin ou en lisant un cours plus complet sur git. Mais les quelques instructions de base nécessaires sont :

git clone <dépot distant>
git rm <fichier du workspace>
git checkout <fichier du workspace> | <version de commit> <fichier du commit> | <version de commit>
git commit -m'<message de version>'
git status
git log

Une toute dernière commande à connaitre est la commande diff, qui permet d'afficher la différence entre un fichier de votre workspace avec la version enregistré dans votre dépôt qui correspond à la dernière version connue. Avant de faire un commit de version, on lance donc les deux commandes de contrôle pour vérifier ce qui va se passer :
$ git status -> liste les modification que git va prendre en compte et celle qu'il ignore.
$ git diff -> liste les différence d'un fichier du workspace par rapport à la version du dépôt local
$ git commit -m'Message'

#### Comment ajouter un fichier à un projet ?
On a vu jusqu'à présent comment récupérer des fichiers existants, comment supprimer des fichiers, mais on ne sais pas comment ajouter un fichier dans un projet, ou comment se comporte le système quand on modifie le contenu d'un fichier.

Vous allez commencer par vérifier que votre projet est à jour. C'est à dire que la version du Workspace et la version du dépôt sont les mêmes. La commande est :
```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)

nothing to commit, working tree clean
```
Rien à commit, espace de travail propre. Sont des messages optimistes pour commencer un travail.

Vous décider de modifier le fichier README.md en mettant l'unique phrase 'bonjour', et vous crééz un fichier TOTO.md contenant la phrase 'au revoir'. Vous pouvez utiliser n'importe quel éditeur pour modifier ces fichiers ou bien exécuter rapidement ces deux commandes sous unix ou mac.

```bash
$ echo "bonjour" > README.md
$ echo "au revoir" > TOTO.md
```

Vous allez maintenant taper la commande `status` pour que git analyse la différence entre votre workspace et le dépôt.
```bash
$ git status
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)

Changes not staged for commit:
  (use "git add <file>..." to update what will be committed)
  (use "git checkout -- <file>..." to discard changes in working directory)

	modified:   README.md

Untracked files:
  (use "git add <file>..." to include in what will be committed)

	TOTO.md

no changes added to commit (use "git add" and/or "git commit -a")
```

Le status vous indique que le fichier README.md a été modifié mais qu'il n'est pas prévu dans
le commmit et que TOTO.md n'est pas suivi par git. Les deux commentaires indiquent que vous pouvez utiliser la commande 'add' pour ajouter le suivi de ces fichiers et les intégrer dans le prochain commit.

```bash
$ git add README.md TOTO.md
$ git status
On branch master
Your branch is ahead of 'origin/master' by 2 commits.
  (use "git push" to publish your local commits)

Changes to be committed:
  (use "git reset HEAD <file>..." to unstage)

	modified:   README.md
	new file:   TOTO.md
```
Les deux fichiers sont prévus pour être intégrés au prochain commit. Notez la parenthèse sur la commande 'reset HEAD <file>' qui permet d'annuler l'intégration d'une des modifications dans le commit. Si vous vous appercevez par exemple que le fichier 'TOTO.md' ne doit pas faire partie du prochain commit, c'est le seul moyen pour le retirer du prochain commit.

Si vous êtes d'accord avec les modification du projet et du prochain commit, vous pouvez alors lancer la commande de validation de vos modifications.
```bash
$ git commit -m"Modification du README.md et Ajout du fichier TOTO.md"
$ git commit -m'Modifications du README.md et ajout du fichier TOTO.md'
[master 01004f3] Modifications du README.md et ajout du fichier TOTO.md
 2 files changed, 2 insertions(+), 19 deletions(-)
 rewrite README.md (100%)
 create mode 100644 TOTO.md
```

En résumé git gère les version de l'intégralité des fichiers d'un projet. De plus il conserve localement dans un répertoire de copie, l'intégralité de toutes les versions d'un projet.

Le cycle classique de codage en utilisant git est le suivant :

git clone <localisation distante> // Cette commande ne se fait qu'une fois dans la vie du projet

// A chaque fois que vous voulez valider une version. On répète les commandes suivantes
git status                      // Pour vérifier ce qui a été modifié
git diff <fichier>              // Pour vérifier une modification spécifique sur un fichier quand on a un doute
git add                         // Pour ajouter les éléments dans la liste des modifications
git commit -m"<Message clair>"  // Pour enregistrer votre nouvelle version

A noter qu'il n'y a pas de règles sur la taille d'un commit, le nombre de fichiers à intégrer, etc
C'est le développeur du projet qui décide du rythme des commits. Les commits étant fait localement,
il n'est pas nécessaire d'avoir une connexion réseau pour enregistrer les évolutions de son projet. Certains projets font des commits à la granularité de la ligne de code, d'autre font des commits à la journée ou à la semaine.

Beaucoup d'utilisateurs considèrent git comme un outils de travail et de dévéloppement collaboratif. Ce n'est pas exclusivement fait pour cela, si vous avez compris cette présentation. C'est un outil très pratique pour suivre son propre code, sans qu'il ne soit partagé avec d'autres utilisateurs. Cependant git permet également de travailler à plusieurs sur un code commun.

La synchronisation entre les utilisateurs est une fonctionnalité prévue par git. L'environnement le plus classique qui propose cela est github, que nous présentons chapitre suivant.


# Ressources
https://openclassrooms.com/fr/courses/2342361-gerez-votre-code-avec-git-et-github

## Qu'est ce que git ?

## A quoi sert Git ?


##
