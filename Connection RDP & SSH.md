# Connection RDP & SSH
###### tags: `Assistance` `RDP` `SSH` `VPN`

## Sur Ubuntu

### Connection au vpn insa

 - `sudo apt update`
 - `sudo apt upgrade`
 - `sudo apt install openconnect network-manager-openconnect network-manager-openconnect-gnome`

 - Ensuite aller dans les Paramètres > Network

![](https://i.imgur.com/IwLZ3bj.png)

 - Cliquer sur le + à côté de VPN pour ajouter une connexion.

![](https://i.imgur.com/jRiAJTg.png)

 - Ensuite cliquer sur l'option openconnect (en haut) et configurer la Gateway sur sslvpn.insa-lyon.fr

![](https://i.imgur.com/MYghTvq.png)

 - Et voila ! Vous pouvez vous connecter au vpn en basculant le slider sur on, entrez vos identifiants et la connexion est établie.

![](https://i.imgur.com/qIfD9Zq.png)

### Connection au SSH

Dans un terminal taper la commande ``ssh [Login_INSA]@[machine]`` avec comme nom de machine ``tc405-109-01.insa-lyon.fr`` par exemple. Puis votre mdp est demandé.


### Connection au RDP

#### Avec rDesktop (plutot utiliser Remmina :arrow_down:)

 - `sudo apt install rdesktop`
 - Etre sur d'etre connecté au Vpn insa
 - `rdesktop -u tsampic@insa-lyon.fr tc405-203-09.insa-lyon.fr` en modifiant le pc ( la liste des pc dispo est actualisée en envoyant !up dans le channel check-etat-pc du discord) et le login.

:warning: Pour la deconnexion de RDP sur windows faites bien : demarrer -> petite fleche a coter de fermer la session -> deconnecter
![](https://i.imgur.com/t47Nlkq.png)

#### Avec Remmina (des fois installé de base)

Connexion avec Remmina pour le RDP
![](https://i.imgur.com/7JjNInj.png)

:warning: Pour la deconnexion de RDP sur windows faites bien : demarrer -> petite fleche a coter de fermer la session -> deconnecter
![](https://i.imgur.com/t47Nlkq.png)

## Sur Windows

### Connection au vpn insa

1) Télécharger et installer soit : 
    - Openconnect : https://www.infradead.org/openconnect/download.html
    - Anyconnect : https://software.cisco.com/download/home/286281283/type/282364313/release/4.8.03036

Ou avec le gestionnaire de paquet Chocolatey (https://chocolatey.org/)
``choco install openconnect-gui -y`` 
dommage anyconnect n'est pas dans le repo :upside_down_face: 

2) Connection au VPN 
    - Avec Openconnect
        * Faire un nouveau nouveau profile (ctrl+n) File->Profile->New Profil
        ![](https://i.imgur.com/uxZ58wW.png)
        * Mettre le nom que vous voulez et dans Gateway mettre : ``sslvpn.insa-lyon.fr`` puis save and connect
        ![](https://i.imgur.com/oReSe4f.png)
        * Mettre Group : ``INSA``
        ![](https://i.imgur.com/BWnEX4y.png)
        * Entrez votre identifiant puis mot de passe
        ![](https://i.imgur.com/5qIDPJW.png)
        * Quand le VPN est connecté il y a le petit cadenat vert 
        ![](https://i.imgur.com/8yEDZSL.png)
        Sinon il est rouge
        ![](https://i.imgur.com/SBGNpuJ.png)
        
    - Avec Anyconnect
        * Mettre l'url ``sslvpn.insa-lyon.fr`` dans le champs et cliquer sur connect
        ![](https://i.imgur.com/VKpmKlU.png)
        * Renseigner le groupe, identifiant et mode de passe et cliquer sur ok
        ![](https://i.imgur.com/NyyZyac.png)
        * Quand le VPN est connecté il y a un check vert sur le cadenat
        ![](https://i.imgur.com/1GJhzTn.png)
         sinon il y a 3 petit point
         ![](https://i.imgur.com/ZUrc1nM.png)



### Connection au SSH

#### Putty : 
- Selectionez SSH
- et indiquez la machine sur laquelle vous voulez vous connecter
![](https://i.imgur.com/XTmcUNt.png)
ensuite comme toutes connexion SSH il vous demande Login et mdp (identifiant INSA)

#### Terminal Windows : 
Il faut activer les services SSH. Pour cela : Parametres -> Applications -> Gerer les fonctionnalites facultatives -> Ajouter un fonctionnalite -> OpenSSH client -> Installer -> redemarer la machine (Petit tuto en cas ou https://www.pcastuces.com/pratique/astuces/5235.htm)
    ensite dans un terminal windows (cmd dans la recher Windows ou win+r et taper cmd ou windows terminal) taper la commande ``ssh [Login_INSA]@[machine]`` avec comme nom de machine ``tc405-109-01.insa-lyon.fr`` par exemple. Puis votre mdp est demandé.

### Connection au RDP

Dans la recherche windows taper ``rdp`` vous allez voir cette app
![](https://i.imgur.com/iUHYuN2.png)
Puis indiquer le nom de la machine sur laquelle vous voulez vous connecter puis connexion
![](https://i.imgur.com/Q85woEu.png)
Ensuite dans les champs nom d'utilisateur : ``ìnsa-lyon.fr\[Login_INSA]``
et mot de passe
![](https://i.imgur.com/cex5XGo.png)
    
:warning: Pour la deconnexion de RDP sur windows faites bien : demarrer -> petite fleche a coter de fermer la session -> deconnecter
![](https://i.imgur.com/t47Nlkq.png)

## Sur MacOs

### Connection au VPN INSA : 

Télécharger et installer Anyconnect : https://software.cisco.com/download/home/286281283/type/282364313/release/4.8.03036

* Mettre l'url ``sslvpn.insa-lyon.fr`` dans le champs et cliquer sur connect

![](https://i.imgur.com/wCvqWCV.png)
* Renseigner le groupe, identifiant et mode de passe et cliquer sur ok

![](https://i.imgur.com/yNsuM5u.png)
* Quand le VPN est connecté il y a un check vert sur le cadenat

![](https://i.imgur.com/3IvgyMK.png)


### Connection en SSH

* Ouvrez un terminal et faites ``ssh [Login_INSA]@[machine]``

### Connection en RDP

* Telecharger RDP : 
https://apps.apple.com/fr/app/microsoft-remote-desktop-10/id1295203466?mt=12

* Ajouter une machine : 

![](https://i.imgur.com/TqhUrsr.png)

* Remplir "pc name" avec l'addresse de la machine

![](https://i.imgur.com/HmKzCwK.png)

* Pour se connecter double cliquer ou clic droit puis connect

![](https://i.imgur.com/Xz2AiLy.png)

![](https://i.imgur.com/YmHkpXV.png)





