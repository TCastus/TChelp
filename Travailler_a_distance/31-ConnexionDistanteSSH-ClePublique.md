:house: [**Retour au menu principal**](/TChelp)

# Connexion par clé ssh

###### tags: `Assistance` `SSH` `Clés asymétriques'

Vous allez rapidement être lassé de taper votre mot de passe ultra sécurisé à la fois pour votre connexion vpn et votre connexion à la machine distante. Vous pouvez éviter la saisie du mot de passe sur la machine distante, et de manière générale à tous les sites d'accès ssh distants, en utilisant des clés asymétriques ssh. Cette suite d'instructions vous explique comment faire sans entrer dans les détails.

Il est inutile de savoir faire cela pour pouvoir travailler à distance. Cela permet juste d'accélerer votre mise en situation de travail.

## Lancez votre vpn
Pensez à bien lancer votre vpn avant de faire ces manipulation. Sinon la machine distante ne sera pas accessible.

## Sur la machine locale
- Utilisez la commande `ssh-keygen` pour générer un couple de clés public / privé.
Les valeurs par défaut proposés sont normalement bonnes. Vous devriez voir passer la génération d'un fichier `.ssh/id_rsa.pub` contenant votre clé d'accès publique à déposer sur les sites distant. Elle va de pair avec les données contenues dans le fichier `.ssh/id_rsa` qui contient votre clé privé, qui ne doit pas bouger ni être transmise à quelqu'un.

## Sur la machine distante
- Connectez-vous par ssh : `ssh toto@unemachine.fr
- Créez un répertoire .ssh : `mkdir .ssh`
- Copiez votre clé publique de votre machine local
  Le plus simple la première fois, est certainement de copier le fichier directement au bon endroit avec la commande `scp`.
  `scp .ssh/id_rsa.pub [login]@[machine]:.ssh/authorized_keys`
- Pour la dernière fois, le système distant vous demandera votre mot de passe.

## Testez votre connexion
- `ssh [login]@[machine]` ne doit plus vous demander votre mot de passe
- En cas de souci, vous pouvez lancer avec l'option -v, qui donnera quelques indications d'erreur.
`ssh -v [login]@[machine]`
- Attention dans tous les cas, votre session login/motdepasse doit continuer à fonctionner.

L'image suivante montre les actions à partir de deux machines vides de clés.

![](https://i.imgur.com/ElWIp5f.png)
