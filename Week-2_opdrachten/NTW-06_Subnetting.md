# [Subnetting]
[Leren en begrijpen van een netwerkarchitectuur]

## Key-terms
- LAN  
Een Local Area Network (LAN) wordt vaak uitgedrukt als een range
aan IP addresses. Elk device (host) krijgt een eigen adres binnen die range.  
- Subnet mask (prefix)  
Om een netwerk te ondersteunen word er gebruik gemaakt van een subnet mask (prefix). Deze definieert hoeveel bits van het IP adres onderdeel uitmaken van het netwerkadres, en hoeveel bits gereserveerd zijn voor de host.
- Subnet   
Een subnet is een kleiner netwerk dat onderdeel is van een groter netwerk. Subnets kunnen worden gebruikt om een deel van het netwerk logisch te isoleren. Een subnet heeft per definitie een grotere prefix dan het netwerk waar het subnet in zit.

## Opdracht
● Maak een netwerkarchitectuur die voldoet aan de volgende eisen:  
○ 1 private subnet dat alleen van binnen het LAN bereikbaar is. Dit subnet moet minimaal 15 hosts kunnen plaatsen.  
○ 1 private subnet dat internet toegang heeft via een NAT gateway. Dit subnet moet minimaal 30 hosts kunnen plaatsen (de 30 hosts is exclusief de NAT
gateway).  
○ 1 public subnet met een internet gateway. Dit subnet moet minimaal 5 hosts
kunnen plaatsen (de 5 hosts is exclusief de internet gateway).

● Plaats de architectuur die je hebt gemaakt inclusief een korte uitleg in de Github
repository die je met de learning coach hebt gedeeld.
### Gebruikte bronnen
[Understanding IP Addresses, Subnets, and CIDR Notation for Networking](https://www.digitalocean.com/community/tutorials/understanding-ip-addresses-subnets-and-cidr-notation-for-networking)  
[An Introduction to Networking Terminology, Interfaces, and Protocols](https://www.digitalocean.com/community/tutorials/an-introduction-to-networking-terminology-interfaces-and-protocols)
### Ervaren uitdagingen
Deze opdracht vereiste wel het nodige reken werk om efficiënt om te gaan me het aantal te creëren IP adressen. Ik ben niet heel goed met cijfers maar gelukkig zijn hier tools voor. Ook ben ik niet bekend met een doorsnee netwerkarchitectuur en heb ik alleen complexe voorbeelden kunnen vinden, gelukkig ben ik hierin ook ondersteund door mijn team. Ik ervoor gekozen om het zo simpel mogelijk te houden.

### Resultaat
![Drawing](/00_includes/Week-2-img/NTW-06_Subnetting.drawio.png)