# Comment utiliser Linux ?

Dès le début de la 3TC, vous serez introduits à l'utilisation d'un environnement Linux, qui sera indispensable de maîtriser, car c'est le standard utilisé par une écrasante majorité de serveurs et de professionnels. Plusieurs solutions s'offrent à vous, et cette page vise à vous aider à choisir la meilleure pour vous.

Note pour les utilisateurs Mac : OSX est basé sur un noyau BSD, proche du noyau Linux, ce qui vous donne une partie des possibilités offerte par cet OS. Dans la majorité des cas, vous n'aurez pas besoin d'installer de VM ou de dual-boot.

## Dual boot Linux

[Aller vers le tutoriel](DualBoot/HowTo.md)

La solution la plus directe pour utiliser Linux est de l'installer directement sur sa machine à côté de Windows, même si c'est loin d'être la plus évidente ou intuitive. Elle a l'avantage de vous immerger dans l'ecosystème Linux tout en en tirant le maximum de sa puissance.

L'installation n'est pas forcément évidente pour un débutant et peut être plus compliquée pour certaines machines, mais des séances d'installation sont généralement organisées par des associations en début d'année, renseignez-vous auprès de l'ASTUS !

## Machine Virtuelle

[Aller vers le tutoriel](VM/Setup.md)

Solution intermédiaire entre le dual-boot et le WSL, vous pouvez virtualiser Linux en lançant l'OS comme hôte sur Windows ou OSX. Ce n'est pas l'idéal pour développer, car la virtualisation demande de la puissance et peut jouer sur la fluidité de l'utilisation, mais peut être bien pratique dans certains cas en évitant la procédure du dual-boot.

## Windows subsystem for Linux

[Aller vers le tutoriel](WSL/installation_et_configuration.md)

Le WSL est la réponse de Microsoft à la montée de Linux Desktop. Cette technologie intègre un noyau Linux à Windows, sans passer par une machine virtuelle. Sans apporter tout le potentiel d'une vraie machine Linux, le WSL fournit un intermédiaire qui permet d'exécuter des commandes sur une machine Ubuntu et de se familiariser avec Linux.

WSL évolue rapidement et est prometteur. La fonctionnalité WSLx qui permet l'affichage de fenêtres graphiques de Linux a été ajoutée récemment, par exemple. Il peut être une bonne solution pour débuter, ou si vous n'avez pas l'espace disque ou le courage d'installer un dual-boot.

## Docker

[Aller vers le tutoriel](Docker/presentation.md)

Docker est un outil de conteneurisation, plus léger qu'une machine virtuelle, très utilisé pour le développement. C'est un logiciel disponible sur Windows, Linux et MacOS, qui permet de lancer des images d'OS très facilement. Il ne remplace pas un dual-boot ou une VM dans leur utilisation mais peut être un bon complément pour l'environnement de développement.