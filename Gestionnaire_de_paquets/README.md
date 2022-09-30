:house: [**Retour au menu principal**](/TChelp)

# Qu'est ce qu'un gestionnaire de paquets ?

Les systèmes d'exploitation, ou OS, comme Windows, Linux, ou MacOS fournissent des outils de base mis à disposition des utilisateurs. Ces outils sont automatiquement installés dans la structure de fichiers du système d'exploitation concerné.

Initialement, lorsque vous installez un logiciel externe, un outil d'installation décide de la localisation des fichiers installés. La plupart du temps l'installation se fait dans un répertoire unique que vous pouvez choisir. Dans d'autre cas, le système d'exploitation vous impose d'installer des fichiers à certains emplacements spécifiques. Les dll partagées pour Windows, les ressources pour MacOS... En fonction des versions de systèmes d'exploitation ces emplacements peuvent changer, mais les installateurs ne sont pas corrigés.

Quand on supprime un logiciel, ou quand on met à jour un logiciel, il peut laisser derrière lui d'anciens fichiers qui ne sont pas supprimés. Petit à petit votre système d'exploitation est inondé de ces fichiers rémanents. Certains de ces fichiers peuvent en plus générer des bugs de comportement de l'OS.

D'autre part, les systèmes d'exploitation issus d'Unix, possèdent un code générique commun en mode source. Les programmes sont initialement distribués avec leur code source, et les installation de code binaires peuvent fortement varier d'un système d'exploitation à un autre. C'est la différence majeure qu'il peut y avoir entre une Debian, une slack, une Gentoo... Le cœur de ces systèmes est organisé autour d'un gestionnaire de package. Pendant quelques années, chaque distribution Linux arrivait avec son propre gestionnaire de package.

Cette philosophie s'est étendue aux autres systèmes d'exploitations.

Les gestionnaires de packages garantissent les fonctions suivantes :

- fournir des package standard pour les logiciels opensource
- garantir que les installations sont unifiées par rapport à l'OS et la version utilisée
- garantir que tous les fichiers installés sont supprimés à la suppression du logiciel

Certains gestionnaires offrent des fonctions supplémentaires :

- Recherche de programmes floue : retrouver jdk, java, openjdk...
- Vérification des dépendances : si j'installe X, alors le gestionnaire m'installe A, B, C avant.
- Installation facile de package annexes, etc...

Il existe des gestionnaires de packages pour tous les OS.
Pour windows, vous avez à disposition une document sur chocolatey,  
Pour macosx, vous avez à disposition brew,
Pour les distributions Linux, vous avez un gestionnaire spécifique, yum, portage, apt...

# Quand faut-il utiliser un gestionnaire de packages ?

Il est absolument nécessaire de connaître son gestionnaire de package quel que soit votre système d'exploitation. Vous êtes quasiment toujours sur que les logiciels standard que nous utilisons au département seront disponible sur votre gestionnaire de package.

Cependant, un gestionnaire de package peut poser des soucis de version. Les packages doivent être préparés à partir des logiciels extérieurs. Certains logiciels évoluent bien plus vite que ce que les gestionnaires de package peuvent fabriquer. Il faut donc réserver les gestionnaires de packages pour des logiciels simples, légers et plutôt ayant une origine open-source. Dans les autres cas, vous pouvez toujours basculer sur les installateurs fournis par les développeurs des applications externes.
