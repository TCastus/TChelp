#!/bin/sh
echo "Editez ce script pour indiquer le chemin d'accès et le nom d'utilisateur"
echo "...et décommentez les lignes"

#nmcli con add type wifi con-name eduroam ssid eduroam ifname wlo1 -- 802-1x.eap peap 802-1x.identity xxx@insa-lyon.fr 802-1x.ca-cert file:////home/user/ca.pem 802-1x.phase2-auth mschapv2 802-11-wireless-security.key-mgmt wpa-eap 802-1x.password-flags 0x2
#nmcli co up eduroam --ask
