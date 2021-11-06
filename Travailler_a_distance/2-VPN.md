# Connection VPN

:house: [**Retour au menu principal**](/TChelp)

**tags**: ``Assistance`` ``VPN``

Une connexion à un réseau virtuel privé ou vpn est obligatoire pour travailler à distance sur le site INSA. Lorsque vous démarrez le vpn, tout se passe comme si vous étiez connecté physiquement sur une machine du site.
Pour utiliser une connexion vpn, il faut installer un client sur votre système d'exploitation, puis vous authentifier sur une machine qui joue le rôle de passerelle entre votre réseau et celui de l'INSA. Dans la suite du document, elle s'appelle [NomGateway].
Les valeurs entre crochets [], sont à remplacer par la vraie valeur indiquée dans le document d'accueil.

:warning: Il faut utiliser :

- **Gateway** : ``sslvpn.cisr.fr``
- **Username** : ``[username INSA]@insa-lyon.fr`` | exemple: ``tjrevol@insa-lyon.fr``
- **Group** : ``Etudiant_INSA``

Et non les **Gateway**, **Username** et **Group** indiquer dans les images

## Sur Ubuntu

### Installation du client vpn (Unix)

Utilisez un des deux clients

- Openconnect : ``sudo apt install network-manager-openconnect-gnome``
- Anyconnect : <http://dsi-pgdm-web01.insa-lyon.fr/files/cisco/4.8/anyconnect-linux64-4.8.03052-predeploy-k9.tar.gz>

### Lancement de la connexion (Unix)

- Ensuite aller dans les Paramètres > Network

![network settings](https://i.imgur.com/IwLZ3bj.png)

- Cliquer sur le + à côté de VPN pour ajouter une connexion.

![go to network settings](https://i.imgur.com/jRiAJTg.png)

- Ensuite cliquer sur l'option openconnect (en haut) et configurer la Gateway (``sslvpn.cisr.fr``)

![add vpn connection](https://i.imgur.com/MYghTvq.png)

- Et voila ! Vous pouvez vous connecter au vpn en basculant le slider sur on, entrez vos identifiants (avec le username ``[username INSA]@insa-lyon.fr``) et la connexion est établie.

![configure vpn](https://i.imgur.com/qIfD9Zq.png)

## Sur Windows

### Installation du client vpn (Windows)

Choisir un des deux outils :

    - Openconnect : https://github.com/openconnect/openconnect-gui/releases
    - Anyconnect : https://software.cisco.com/download/home/286281283/type/282364313/release/4.8.03036
    - choco install openconnect-gui -y

### Lancement de la connexion (Windows)

#### Avec Openconnect

- Faire un nouveau nouveau profile (ctrl+n) File->Profile->New Profil
    ![add profile](https://i.imgur.com/uxZ58wW.png)
- Mettre le nom que vous voulez et dans Gateway mettre : ``sslvpn.cisr.fr`` puis save and connect
    ![name and gateway](https://i.imgur.com/oReSe4f.png)
- Mettre Group : ``Etudiant_INSA``
    ![select group](https://i.imgur.com/BWnEX4y.png)
- Entrez votre identifiant puis mot de passe (avec le username : ``[username INSA]@insa-lyon.fr``)
    ![username](https://i.imgur.com/5qIDPJW.png)
- Quand le VPN est connecté il y a le petit cadenat vert
    ![green cadenas](https://i.imgur.com/8yEDZSL.png)
    Sinon il est rouge
    ![red cadenas](https://i.imgur.com/SBGNpuJ.png)

#### Avec Anyconnect

- Mettre l'url ``[NomGateway]`` dans le champs et cliquer sur connect
    ![gateway](https://i.imgur.com/VKpmKlU.png)
- Renseigner le groupe, identifiant et mode de passe et cliquer sur ok
    ![username and password](https://i.imgur.com/NyyZyac.png)
- Quand le VPN est connecté il y a un check vert sur le cadenat
    ![connection ok](https://i.imgur.com/1GJhzTn.png)
      sinon il y a 3 petit point
      ![connection nok](https://i.imgur.com/ZUrc1nM.png)

## Sur MacOS

### Installation du client vpn (MacOS)

Choisir un des deux clients :

- OpenConnect : ``brew install openconnect``
- Cisco anyconnect : <http://dsi-pgdm-web01.insa-lyon.fr/files/cisco/4.8/anyconnect-macos-4.8.03052-predeploy-k9.dmg>. Décochez toutes les options sauf l'accès vpn

### Lancement de la connexion

Avec openconnect, directement en ligne de commande dans un terminal :  
``sudo openconnect [NomGateway] --authgroup=Etudaint_INSA -u [LoginInsa]``

Exemple :

```bash
sudo openconnect sslvpn.cisr.fr --authgroup=Etudaint_INSA -u tjrevol@insa-lyon.fr
```

La passerelle vous demandera votre mot de passe.

### Ajout d'un alias

Cette commande peut être ajoutée comme alias dans votre shell (cf cours shell).  
``alias vpn='sudo openconnect [NomGateway] -u [LoginInsa] --authgroup=INSA'``

Cet alias vous permet par la suite de ne taper que la commande ``vpn`` pour le lancer.

L'image suivante vous donne un exemple de terminal avec une connexion vpn active sous Macos.

![mac active vpn connection](https://i.imgur.com/5axtNbT.png)

## Tester ma connexion vpn

Pour tester ma connexion, le plus simple est d'ouvrir un terminal de commande et faire un ping sur une machine du réseau pour voir si elle répond.

Vpn valide

```shell
$ ping intranet.insa-lyon.fr
PING dsi-vm18.insa-lyon.fr (134.214.182.106): 56 data bytes
64 bytes from 134.214.182.106: icmp_seq=0 ttl=63 time=16.386 ms
64 bytes from 134.214.182.106: icmp_seq=1 ttl=63 time=16.047 ms
```

Vpn invalide

```shell
$ ping intranet.insa-lyon.fr
PING dsi-vm18.insa-lyon.fr (134.214.182.106): 56 data bytes
Request timeout for icmp_seq 0
Request timeout for icmp_seq 1
```
