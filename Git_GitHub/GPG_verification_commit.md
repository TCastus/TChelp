:house: [**Retour au menu principal**](/TChelp)

# GPG

## Qu'est ce que GPG

GPG est la méthode de vérification de GitHub pour les commit, elle permet de s'assurer que vous êtes bien la personne que vous prétendez. Vous trouverez un descriptif et son utilisation sur [l'help de GitHub](https://help.github.com/en/github/authenticating-to-github/managing-commit-signature-verification)

## Comment l'utiliser

On commence par générer une nouvelle clé, la procédure a suivre est [ici](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)

Dans git Bash taper la commande ``gpg --default-new-key-algo rsa4096 --gen-key`` pour générer une nouvelle clé
Puis ajouter vos informations.
Afficher la liste de vos clé pour récupérer l'ID de la clé : ``gpg --list-secret-keys --keyid-format LONG``
qui va donner un résultat comme ceci :

```bash
/Users/<Username>/.gnupg/secring.gpg
------------------------------------
sec   rda4096/<ID> 2020-06-27 [expires: 2022-06-27]
uid                          [Ultimate] Name <email>
````

Et afficher la clé pour l'ajouter dans GitHub ``gpg --armor --export <ID>``
copier le bloc de ``-----BEGIN PGP PUBLIC KEY BLOCK-----`` à ``-----END PGP PUBLIC KEY BLOCK-----``
et aller ensuite sur [GitHub](https://github.com/) dans ``Settings``puis dans ``SSH and GPG keys`` ([lien direct](https://github.com/settings/keys)). Cliquer sur ``New GPG key`` et coller le bloc.(La procédure détaillée est sut [l'help de GitHub](https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account)).

Pour utiliser votre clé il faut ensuite taper les deux commandes suivante :

``git config --global user.signingKey <ID>``

``git config --global commit.gpgSign true``
