# Présentation de GitHub
##### Tags : git
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
```bash
$ git pull
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 4 (delta 2), reused 4 (delta 2), pack-reused 0
Unpacking objects: 100% (4/4), done.
From github.com:TCastus/TChelp
   a929a6f..21afdda  master     -> origin/master
Auto-merging Git_GitHub/1-Git.md
CONFLICT (content): Merge conflict in Git_GitHub/1-Git.md
Automatic merge failed; fix conflicts and then commit the result.
```

La version D qui groupe les modification de A et de B n'a pas pu être créée. Il y a un conflit (CONFLICT) entre les deux version. Git a injecté dans le fichier que vous possédez le point de vu du dépôt distant en désaccord avec le votre. A vous de modifier le fichier concerner pour résoudre ce conflit, puis de faire le commit spécifique à cette version d'intégration.
Si vous ouvrez un fichier en conflit, voici ce que vous aurez.
```bash
# Présentation de Git
##### Tags : git
<<<<<<< HEAD
Je pense oui
=======
Je pense non
>>>>>>> 21afdda20852cc8e4715412fb4fd980abe608edf
Git est un outil de gestion de version de fichier. Il permet de conserver sur votre machine local l\'ensemble des modifications que vous effectuez sur un ensembl
```

La version de tête du serveur distant considère que la valeur est 'Je pense oui', alors votre version courante (21afdda) qu'il s'agit de 'Je pense non'. Vous devez résoudre ce conflit, en supprimant ou modifiant ce que vous voulez. Comme il s'agit d'un commit de merge, vous pouvez décider de mettre 'Je pense que peut-être', et valider cette version des faits. Pour l'instant localement vous avez A -> B -> ? et vous êtes en train de fabriquer D.

Quand votre conflit est résolu, vous pouvez pousser votre nouvelle version qui sera compatible avec le dépôt distant. A condition évidemment qu'aucun autre utilisateur n'ai poussé une nouvelle version entre temps. Mais ce n'est pas grave, il faut juste refaire l'étape de merge...

!!! Attention : si vous avez un conflit sur un merge, un mauvais réflexe et de ne pas essayer de comprendre et valider votre version d'intégration sans corriger le conflit. Pour un document texte ce n'est pas forcément génant, mais très moche... Par contre s'il s'agit de code machine, ça plantera, et c'est peut être votre meilleur amis qui devra débugger cela.

Un dernier cas existe...

# Vous arrivez après les autres et vos modifications ne sont pas compatibles, mais vous le savez
Vous êtes en train de faire des modifications de vos fichiers, et vous souhaitez vous mettre à jour. Le souci est que vous ne voulez pas commiter ou merger vos modifications. Ceci arrive pour les raisons suivantes :
 - Vous codez depuis longtemps sans avoir commité, et vous savez que le code externe a beaucup évolué. Vous voulez vous mettre à jour avant de pousser le code, mais vous savez que ce que vous avez écrit est en conflit avec le reste, et vous ne pouvez pas ou ne souhaitez pas merger.
 - Le code que vous êtes en train d'écrire dépend de code que vous n'avez pas encore, mais qui existe dans les nouvelles versions du dépôt distant.

!!! Attention : vous pouvez toujours faire la manip précédent de merge intermédiaire, mais vous allez devoir commiter une version partielle. Il y a donc des commits qui ne fonctionnent pas dans la suite des versions.

Vous êtes donc en train d'écrire du code, mais vous devez vous synchroniser avec le dépôt distant pour récupérer la dernière version. Git vous empêchera de le faire si vos modifications sont en conflit avec le site distant. Git vous laisse deux options : soit vous réalisez un commit de merge pour résoudre le conflit, soit vous cachez (to stash) votre code. Vous le glissez sous le tapis, le temps de récupérer la nouvelle version.
Attention, si vous avez des conflits, ça ne les corrigera pas, mais vous n'avez pas à créeer de version officielle intermédiaire. C'est donc plus propre...

```bash
$ git pull
remote: Enumerating objects: 7, done.
remote: Counting objects: 100% (7/7), done.
remote: Compressing objects: 100% (2/2), done.
remote: Total 4 (delta 2), reused 4 (delta 2), pack-reused 0
Unpacking objects: 100% (4/4), done.
From github.com:TCastus/TChelp
   1e7b47f..13fd743  master     -> origin/master
Updating 1e7b47f..13fd743
error: Your local changes to the following files would be overwritten by merge:
	Git_GitHub/1-Git.md
Please commit your changes or stash them before you merge.
Aborting
```

L'erreur indique un conflit au pull, qui ne peut pas être mergé de manière transparente. Vous avez le choix de committer ou de stasher vos fichiers.

```bash
$ git stash
Saved working directory and index state WIP on master: 1e7b47f Lancement stash
```
Vous pouvez maintenant puller le dépôt distant, car votre code est caché...

```bash
$ git pull
Updating 1e7b47f..13fd743
Fast-forward
 Git_GitHub/1-Git.md | 1 +
 1 file changed, 1 insertion(+)
```
Vous pouvez maintenant sortir votre code la cachette avec la commande `stash pop`.

```bash
$ git stash pop
Auto-merging Git_GitHub/1-Git.md
CONFLICT (content): Merge conflict in Git_GitHub/1-Git.md
```
Vous devez maintenant résoudre votre code localement. Le message est un peu différent dans le code source.

```bash
##### Tags : git
<<<<<<< Updated upstream
Je pense oui
=======
Je pense non
>>>>>>> Stashed changes
```
Une fois le conflit résolu, vous pouvez commiter votre nouvelle version... Ou continuer à récupérer les nouvelles versions.

Pour comprendre la différence entre un commit de merge et utiliser la cachette, voici un schéma présentant les différentes versions ajoutées au dépôt distant.

Merge conflict sur la machine 2
Machine 1 : A -> B
Machine 2 :
A -> C push conflit
A -> B -> B + C merge resolve / push

Stashed conflict sur la machine 2
Machine 1 : A -> B
Machine 2 :
pull conflit
Stash de code
A -> B -> D stash pop / push

# En résumé
Si vous travaillez en groupe sur du code partagé, voici votre cycle de travail.
- clone : quand vous intégrez le projet initialement
- pull : à chaque début de session de codage
- status : avant chaque commit
- pull : avant chaque push
- commit : régulièrement pendant que vous codez
- push : pour finir votre session de codage.

Quand vous prenez le rythme, vous pouvez pull/pusher tous les 5 min, le fait de le faire régulièrement vous évite d'avoir trop de conflits à gérer. De plus commiter / pusher régulièrement vous oblige à faire de très petites modifications de code pour avancer par petits pas (small steps coding). Vous mettez également vos collaborateurs au courant de vos modifications.

Vous ne pouvez pas faire d'erreur sur le code partagé en utilisant git. Ce qui est comité est quasiment impossible à perdre ou effacer. Git n'écrasera jamais votre code sans vous créer une version de conflit intermédaire.

# Pour finir
Git et github forment un couple d'outils permettant de gérer des projets complexes.
Github peut être remplacé par quelques alternatives comme gitlab, ou vous pouvez monter votre propre ferme à projets (https://git.insa-lyon.fr/). Github offre un espace d'échange et de collaboration sans équivalent dans le monde.
