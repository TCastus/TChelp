#!/bin/sh
echo "Editez ce script pour préciser le nom d'utilisateur 'xxx' et le nom de l'interface réseau 'xxx'"
echo "Le nom de l'interface s'obtient avec la commande ip : ex wlo1"
echo "...et décommentez les lignes"

#nmcli con add type wifi con-name eduroam ssid eduroam ifname xxx -- 802-1x.eap peap 802-1x.identity xxx@insa-lyon.fr 802-1x.ca-cert file:////home/user/ca.pem 802-1x.phase2-auth mschapv2 802-11-wireless-security.key-mgmt wpa-eap 802-1x.password-flags 0x2
#nmcli co up eduroam --ask
