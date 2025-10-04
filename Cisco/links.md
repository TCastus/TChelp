# Quelques liens utiles pour Cisco IOS


## DHCP

- https://www.it-connect.fr/configurer-le-service-dhcp-sur-un-routeur-cisco/ 

## NAT

- https://wax-trax.medium.com/understanding-and-configuring-network-address-translation-nat-for-cisco-ccna-ccnp-and-ccie-7fef92fa654c 
- https://www.firewall.cx/cisco/cisco-routers/cisco-router-nat-overload.html 
- https://www.networkstraining.com/cisco-router-port-forwarding-configuration/ 
- https://www.cisco.com/c/en/us/support/docs/ip/network-address-translation-nat/8605-13.html 


## IPsec

- https://medium.com/@jawad846/vpn-configuration-aws-c60d9eb0059d 


## OSPF

- https://www.networklab.fr/ospf-configuration-basique/ 

Redistribution de route static unique - https://serverfault.com/questions/411445/static-to-ospf-route-redistribution 

```shell
router ospf 123 
redistribute static subnets route-map RM-OSPF-REDIST 

ip prefix-list PF-STATIC-AS-E1 seq 10 permit 192.168.0.0/24

ip route 192.168.0.0 0.0.0.255 1.1.1.1
route-map RM-OSPF-REDIST permit 10 
match ip address prefix-list PF-STATIC-AS-E1
```

## DMVPN

- https://www.firewall.cx/cisco/cisco-routers/cisco-router-dmvpn-configuration.html 

avec OSPF
- https://networklessons.com/cisco/ccie-routing-switching/dmvpn-phase-3-ospf-routing 
https://journey2theccie.wordpress.com/2020/04/21/dmvpn-phase-3-ospf/ 

## Static route 
- https://www.it-connect.fr/ajouter-une-route-statique-sur-un-routeur-cisco%EF%BB%BF/ 


## Backup automatique

- https://www.it-connect.fr/sauvegarde-automatique-des-equipements-cisco-part-i/ 
- https://imtiazrahman.com/2017/10/29/cisco-archive-command-backup-router-configuration-automatically-stores-them-remotely/ 
