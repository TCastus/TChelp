:house: [**Retour au menu principal**](/TChelp)

# Présentation de WSL

WSL (Windows Subsystem for Linux) est une fonctionnalité disponible sous Windows 10, permettant de faire tourner un environnement GNU/Linux sous Windows sans passer par une machine virtuelle traditionnelle ou un dual boot. Cela vous permettra d'accéder à un terminal Linux et, dans sa deuxième version intégrant un Kernel Linux entier, de faire tourner des modules incompatibles sous windows comme sysv_ipc.

WSL prend donc la forme d'un terminal de la distribution Linux choisi par l'utilisateur.



# Installation de WSL

L'Installation se fait en deux temps :
- Activer la fonctionnalité Windows Subsystem for Linux
- Installation de la distribution Linux

## Installation de WSL1 (rapide mais limité)

Pour activer la fonctionnalité WSL sous Windows 10, il suffit de rechercher
"Activer ou désactiver des fonctionnalités Windows" et de cocher la case Sous-système Windows pour Linux.
Vous pouvez aussi réaliser cette action en passant par le Powershell ouvert en tant qu'administrateur.
`dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`

Si vous voulez utiliser WSL1 et ne pas passer à WSL2, redémarrez votre PC pour appliquer les modifications et passez directement à l'installation de la distribution Linux. Sinon, continuez simplement ce tutoriel.

## Mise à jour vers WSL2

Tout d'abord, vérifiez dans Windows Update que vous possédez bien la dernière version de Windows et que votre machine tourne sur un système x64. Quand cela est fait, on peut passer aux choses sérieuses.
Lancez le Powershell en tant qu'administrateur et activez la fonctionnalité "Plateforme de machine virtuelle" via la commande suivante:
`dism.exe /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux /all /norestart`
Vous pouvez aussi réaliser cette action en allant dans "Activer ou désactiver des fonctionnalités Windows" comme auparavant et en activant la fonctionnalité en cochant sa case. Un redémarrage de l'ordinateur est nécessaire pour appliquer les modifications.

Ensuite, il vous faudra télécharger et installer le package de mise à jour Linux Kernel disponible [ici](https://wslstorestorage.blob.core.windows.net/wslblob/wsl_update_x64.msi).

Maintenant, vous possédez WSL1 et WSL2. Pour passer WSL2 en tant que version par défaut, executez cette commande dans le Powershell:
`wsl --set-default-version 2`

Ca y est, WSL2 est correctement installé sur votre machine et est prêt à l'emploi, il ne suffit plus que d'installer une distribution Linux.


# Installation de la distribution Linux sous WSL (1 et 2)

Après avoir activé WSL, il vous faut installer une distribution Linux. Pour cela, recherchez votre distribution sur le Windows Store (Ubuntu, Kali, SUSE, Debian, ...) et installez la. Vous la retrouverez dans vos programmes. Il vous suffira de la lancez pour accéder au terminal de celle-ci et de configurer votre username et mot de passe.
Félicitations, vous avez une distribution Linux sous Windows !

Notez que WSL est supporté nativement par le nouveau terminal développé en Open Source par Microsoft et vous permettra de lancer plusieurs distributions dans une seule application aux côtés de vos amis le cmd et le Powershell.

# Ressources
[https://docs.microsoft.com/en-us/windows/wsl/](https://docs.microsoft.com/en-us/windows/wsl/)
