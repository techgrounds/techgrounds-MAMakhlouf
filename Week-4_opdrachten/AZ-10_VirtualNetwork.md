# Azure Virtual Network (VNet)
Begrijpen en implementeren van een Azure Virtual Network. 

## Key-terms
- Route table:  
In Azure is een route tabel een configuratie-object dat de set regels (routes genoemd) definieert voor netwerkverkeer binnen een virtueel netwerk.  
Een route tabel bevat een lijst met bestemmings-IP-adres-prefixen en de informatie over hoe het netwerkverkeer dat bestemd is voor die IP-adressen moet worden doorgestuurd. Deze informatie wordt gebruikt door virtuele machines en andere Azure resources binnen hetzelfde virtuele netwerk om te bepalen waar ze netwerkverkeer naartoe moeten sturen.  

- 

## Opdracht
### Gebruikte bronnen
[Virtual network traffic routing](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview)  
[Azure Route tables](https://learn.microsoft.com/en-us/azure/virtual-network/manage-route-table)

### Ervaren uitdagingen
Deze opdracht was wel leuk om te doen. De uitdaging vond ik in het toepassen van de route table. Ik moest er eerst achterkomen dat ik die uberhaupt nodig had. Toen ik eenmaal besefte wat ik miste ging het heel soepel.

### Resultaat
- Virtual Network aangemaakt met gespecificeerde eisen:  
![Vnet](/00_includes/week-4-img/AZ-10_subnets.png)  
- Routetable aangemaakt en gekoppeld aan gespecificeerd subnet voor internet toegang.
- Virtual Machine gemaakt met gespecificeerde eisen:
![VM](/00_includes/week-4-img/AZ-10_VM.png)  
- Corresponderend IP adress in de browser ingevoerd en gewenst resultaat behaald. Hiermee opdracht succesvol afgerond.
![website](/00_includes/week-4-img/AZ-10_site.png)
- lijst van recource group.
![resourcegroup](/00_includes/week-4-img/AZ-10_resourcegrp.png)