# Connection RDP
###### tags: `Assistance` `rdp`

Si vous avez réussi à vous connecter en ssh à une machine distante, c'est que vous savez lancer un terminal, vous connecter en vpn et manipuler les commandes ssh de base.

En remplacement du protocole d'accès texte, windows a développé dans les années 1990, un protocole de transfère de flux vidéo pour accéder à leur environnement à distance. Le protocole rdp (remote desktop) permet d'accéder à un espace de type bureau sur une machine distante. Vous accédez alors à votre environnement de travail, plutôt qu'à une simple fenêtre de terminal.

Ce système est maintenant installé sur toutes les machines windows et unix des départements. Vous allez certainement préférer cette usage, même si vous subirez un peu plus de latence qu'en utilisant un simple terminal en connexion ssh.

Que vous accédiez à une machine distante sous windows ou sous linux le protocole est fortement similaire. Vous utilisez donc la même application sur votre machine locale pour tous les systèmes accédés.

Dans tous les cas pensez à deux choses :
- Il faut toujours avoir le vpn actif, puisque vous accédez à des machines distantes
- Il faut penser à quitter votre session distante en fin d'utilisation
:warning: Sur windows faites bien : démarrer -> petite flèche a côté de fermer la session -> déconnecter
![](https://i.imgur.com/t47Nlkq.png)
:warning:Sur debian, Menu -> Fermer la session
![](https://i.imgur.com/Op39150.png)

Enfin, il peut y avoir des fenêtre de warning à la connexion sur le fait que le client n'a pas pu s'authentifier. Vous pouvez les ignorer, c'est des questions de compatibilité de protocoles.

## Accès avec une machine sous linux
### Avec Remmina (des fois installé de base)
Connexion avec Remmina pour le RDP
![](https://i.imgur.com/7JjNInj.png)

### Solution alternative
rDesktop est une autre solution d'accès au bureau distant.

 - `sudo apt install rdesktop`
 - `rdesktop -u [Login_INSA]@insa-lyon.fr [machine].insa-lyon.fr` en modifiant le pc ( la liste des pc dispo est actualisée en envoyant !up dans le channel check-etat-pc du discord) et le login.

## Sur Windows
Dans la recherche windows taper ``connexion bureau à distance`` vous allez voir cette app
![](https://i.imgur.com/iUHYuN2.png)
Puis indiquer le nom de la machine sur laquelle vous voulez vous connecter puis connexion
![](https://i.imgur.com/Q85woEu.png)
Ensuite dans les champs nom d'utilisateur : ``ìnsa-lyon.fr\[Login_INSA]``
et mot de passe
![](https://i.imgur.com/cex5XGo.png)

## Sur MacOs
* Telecharger microsoft remote desktop :
https://apps.apple.com/fr/app/microsoft-remote-desktop-10/id1295203466?mt=12

* Ajouter une machine :
![](https://i.imgur.com/TqhUrsr.png)

* Remplir "pc name" avec l'addresse de la machine
![](https://i.imgur.com/HmKzCwK.png)

* Pour se connecter double-cliquez ou clic droit puis connect
![](https://i.imgur.com/Xz2AiLy.png)
![](https://i.imgur.com/YmHkpXV.png)

:warning: Pour les portables Mac votre clavier sur la machine distante risque d'être en 'qwerty'. Tapez la lettre 'a' dans un terminal distant et regardez si vous obtenez un 'q' ou un 'a'.
![](https://i.imgur.com/zLLVSAA.png)

Il s'agit d'un bug de l'application cliente (microsoft) qui négocie mal le clavier du portable. Il vous faut installer un second clavier sur votre Mac: Français-PC.(Préférences Système -> Clavier -> Méthodes de saisie -> +)
![](https://i.imgur.com/biPlYMu.png)

La solution n'est pas parfaite, car vous allez perdre quelques touches comme l'arobase. '@'

## Résultats obtenus
Si vous vous connectez sur une des machines windows du département, voici ce que vous devriez obtenir.
![](https://i.imgur.com/CdqUqXi.png)

Si vous vous connectez sur une machine debian du département, voici ce que vous devriez obtenir.
![](https://i.imgur.com/bDOFdrJ.png)
