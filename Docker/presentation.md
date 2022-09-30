:house: [**Retour au menu principal**](/TChelp)

# Présentation de Docker

## Terminologie

Docker gère des **conteneurs**, qui contiennent un ou plusieurs processus et se lancent dans une copie d'une **image**.
Les **images** sont définies à l'aide d'un **Dockerfile**.
On peut monter des **volumes** dans des conteneurs pour leur fournir un stockage partagé et persistant.

On peut télécharger des *images* depuis le **Docker Hub**, une sorte d'App Store pour les logiciels serveurs.

## Fonctionnement

### Exécution

Docker est un logiciel utilisant les fonctionnalités d'isolation de processus du noyau Linux, les *namespaces*.
Cela permet à docker de lancer des sortes de mini-ordinateurs (**conteneurs**) sur votre machine, mais en utilisant le noyau de votre machine contrairement à des machines virtuelles.

De ce fait, les conteneurs n'ont pas besoin qu'on leur réserve des ressources (disque, mémoire vive ou processeur) au démarrage,
**ils partagent les ressources de l'hôte**. C'est donc très économe en ressources système par rapport à des machines virtuelles.
Contrairement à des machines virtuelles, **les conteneurs n'ont pas leur propre noyau Linux**, ils utilisent celui de l'hôte.

Docker adopte un modèle *stateless*, ce qui signifie que les conteneurs sont vus comme des unités jetables.
Pour reconfigurer un conteneur, on le recrée.

Au démarrage du conteneur, un seul processus est lancé : l'**entrypoint**, similaire à **init** pour UNIX et Linux.
Ce processus est démarré en tant que **root** et il peut lancer d'autres processus mais ne peut interagir avec votre système et supprimer tous vos fichiers car il
est isolé dans son conteneur.

À l'arrêt du processus *entrypoint*, le conteneur est arrêté !

### Images

Une autre fonctionnalité importante de Docker est sa gestion du système de fichiers des conteneurs.
Les conteneurs partagent le système de fichiers de l'hôte, il est donc possible de partager des dossiers entre conteneurs.

La technologie Linux *OverlayFS* permet de superposer différentes couches pour former le système de fichiers du conteneurs.
On part souvent d'un système d'exploitation de base sur lequel on rajoute des programmes et fichiers de configuration.

Ce système de couches permet d'optimiser énormément la taille des images car chaque image dérivée ne stocke que les
changements par rapport à l'image de base.

Donc si on crée deux image "logiciel1 dans Ubuntu" et "logiciel2 dans Ubuntu", on ne stockera la partie "Ubuntu" qu'une seule fois.
On stockera également une partie "modification apportant logiciel1" et "modification apportant logiciel2"

De même, si on crée deux conteneurs Ubuntu, notre disque ne stocke toujours qu'un seule fois l'image Ubuntu.
Par contre, si les deux conteneurs Ubuntu apportent des modifications à leur système de fichiers, ces modifications ne seront pas partagées
entre les conteneurs Ubuntu. Docker va même supprimer ces modifications dès que le conteneur sera enlevé.

### Volumes

Les volumes permettent de faire perdurer des modifications même si on supprime le conteneur.
Un volume est monté un peu comme un disque : on fournit un dossier (vide) dans le conteneur, et le contenu du volume apparaîtra à cet
endroit. Il est possible de monter plusieurs fois le même volume à différents endroits.

On peut monter un même volume dans plusieurs conteneurs, ce qui permet de partager des fichiers.

### Dockerfile

Ces fichiers définissent les étapes (commandes shell) qui permettent de créer une image.
Les étapes sont elles-mêmes exécutées dans des conteneurs, ce qui permet de garantir que la création d'une image ne
dépend pas de l'ordinateur sur lequel elle est construite. Si vous faites les choses bien, n'importe qui peut récupérer votre Dockerfile et
créer la même image que vous.

Voici un exemple commenté.

```Dockerfile
# structure du répertoire
# dossierConteneur
# ├── Dockerfile
# └── toto.txt 

# on commence avec le système de fichiers d'Ubuntu
FROM ubuntu:18.04

# on copie le fichier toto.txt (il doit se trouver dans le même dossier que Dockerfile)
COPY toto.txt /tata.txt

# on exécute une commande à l'intérieur du conteneur. on remarque le système de fichiers qui contient tata.txt à la racine
RUN ls /

# on peut définir des variables d'environnement qui seront accessibles à tous les processus dans le conteneur. elles sont souvent utilisées pour la configuration des conteneurs
ENV VARIABLE=valeur

# cette étape définit la commande qui sera exécutée au lancement. le conteneur s'arrête lorsque cette commande est finie
CMD ["/bin/sh", "-c", "echo Bonjour $VARIABLE && cat /tata.txt"]
```

On construit l'image avec ``docker build --tag mon-image .``, et on en fait un conteneur avec ``docker run mon-image``.

Cette *image* définit un *conteneur* qui à son lancement affiche "Bonjour valeur" ainsi que le contenu de "toto.txt".
Évidemment ce n'est pas très utile, mais on peut remplacer la commande *sh* par un script qui lance un serveur web par exemple.

### Réseau

Une fonction très bien faite de Docker est sa gestion du réseau : vos conteneurs ont par défaut un accès internet, mais ils
utilisent leur propre réseau interne pour communiquer entre eux.

Un conteneur peut rejoindre un ou plusieurs réseaux, utiliser directement le réseau de l'hôte (déconseillé) et également
disposer de redirections de ports sur l'hôte (pour que votre réseau physique puisse communiquer avec vos conteneurs).

On peut donc organiser les réseaux virtuels docker pour séparer des projets. Exemple: vous voulez que votre PWEB NodeJS puisse communiquer avec sa base de données qui s'exécute dans un autre conteneur, mais pas
avec la base de données du PWEB d'un autre groupe.

### Clusters

Avec des *overlay networks*, des conteneurs Docker qui s'exécutent sur des machines différentes peuvent communiquer entre eux. Ils peuvent aussi partager
des volumes avec des logiciels tels que NFS qui permettent l'accès aux fichiers de manière transparente à travers Internet.

# Avantages de Docker

* la reproductibilité des images :
si quelqu'un récupère le dossier qui contient votre Dockerfile, il peut construire la même image. Vous pouvez donc créer les dockerfiles sur votre machine et les envoyer
sur un serveur de construction d'images (*build server*).
* l'uniformité des images :
quelque soit le conteneur, on dispose des même outils pour le lancer, le configurer, le modifier. Cela a donné naissance à des applications graphiques comme Portainer, Rancher qui permettent
de gérer ses conteneurs.
* l'isolation des ressources :
si quelqu'un pirate un des conteneurs, il n'a pas accès ni à votre système hôte ni aux autres conteneurs.
Vous pouvez aussi installer autant de conteneurs que vous voulez, c'est toujours pareil pour les enlever. Il n'y aucune chance de
mettre le bazar dans son système car tout est géré par docker, il ne laisse pas des fichiers partout.
* la configuration unifiée: pas besoin d'apprendre 50 syntaxes de fichiers de configuration, la personne qui crée l'image
vous fournit une documentation qui indique comment configurer le conteneur à l'aide de simples variables

Docker vous permet effectivement d'empaqueter un logiciel serveur dans un format standard qui est compatible
avec la plupart des grands fournisseurs de *Cloud computing* ainsi que toutes les distributions Linux, macOS et même Windows (avec des restrictions).

Vous pouvez déployer un logiciel sans savoir comment il fonctionne.
