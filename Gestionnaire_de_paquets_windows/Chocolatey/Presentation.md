# Présentation de Choclatey

## Qu'est ce que chocolatey

Choclatey est un gestionnaire de paquet sous windows, vous pouvez le trouvez [ici](https://chocolatey.org/)

## Comment l'installer ?

Vous retrouvez le guide d'instalation [ici](https://chocolatey.org/install)
Pour résumer il faut lancer un PowerShell en **Administrateur**

Puis taper cette commande ``Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))``

## Comment l'utiliser ? 

Pour l'utilisation vous pouvez vérifier sur le [site de chocolatey](https://chocolatey.org/search?q=) que votre application est présente
Sinon vous pouvez utiliser le ligne de commande suivante ``choco search <package name>``, la liste des applications correspondant à ce paquet s'afficherons. Pour installer le paquet voulu, il faut tapper la commande ``choco install <package name>`` , vous pouvez utiliser l'option ``-y`` pour accepter directmennt.

Pour la mise à jour des paquets, il faut taper la commande ``choco upgrade <package name>`` et pour mettres à jour tous les paquet ```choco upgrade all`` (vous pouvez faire un script avec un lancement regulier à l'aide du planificateur de tâches)

Pour lister les applications installer, utiliser la commande ``choco list --local-only``