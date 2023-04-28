# Azure Virtual Network (VNet)
Begrijpen en implementeren van een Azure Virtual Network. 

## Key-terms
- Route table:  
In Azure is een route tabel een configuratie-object dat de set regels (routes genoemd) definieert voor netwerkverkeer binnen een virtueel netwerk.  
Een route tabel bevat een lijst met bestemmings-IP-adres-prefixen en de informatie over hoe het netwerkverkeer dat bestemd is voor die IP-adressen moet worden doorgestuurd. Deze informatie wordt gebruikt door virtuele machines en andere Azure resources binnen hetzelfde virtuele netwerk om te bepalen waar ze netwerkverkeer naartoe moeten sturen.  

- Gateway:  
Een gateway is een netwerkapparaat dat wordt gebruikt om verschillende netwerken of netwerksegmenten met elkaar te verbinden en communicatie tussen deze netwerken mogelijk te maken. In Azure kan een gateway bijvoorbeeld worden gebruikt om een virtueel netwerk te verbinden met een on-premises netwerk, of om verschillende virtuele netwerken met elkaar te verbinden.  
Er zijn verschillende soorten gateways beschikbaar in Azure, afhankelijk van het type netwerkverbinding dat u wilt maken. Zo kunt u bijvoorbeeld een VPN-gateway gebruiken om een veilige verbinding tot stand te brengen tussen uw Azure virtuele netwerk en uw on-premises netwerk, of kunt u een ExpressRoute-gateway gebruiken om een privéverbinding te maken tussen Azure en uw on-premises datacenter. Gateways in Azure kunnen ook worden gebruikt voor het implementeren van beveiligingsfuncties, zoals firewalls en netwerkbeveiligingsgroepen.

- Virtual network peering:  
Virtual Network Peering is een functie in Azure waarmee u twee virtuele netwerken in dezelfde Azure-regio met elkaar kunt verbinden, zodat deze netwerken kunnen communiceren alsof ze zich in hetzelfde netwerk bevinden.  
Met Virtual Network Peering kunnen virtuele machines, services en resources binnen de gepeerde netwerken direct met elkaar communiceren zonder dat er verkeer via het openbare internet hoeft te worden gerouteerd. Dit maakt het mogelijk om eenvoudig hybride architecturen te bouwen, waarbij Azure-resources worden gecombineerd met on-premises resources.  
Virtual Network Peering is eenvoudig in te stellen en kan worden beheerd via de Azure Portal, Azure CLI of PowerShell. Er zijn enkele beperkingen bij het gebruik van Virtual Network Peering, zoals het feit dat het alleen werkt tussen virtuele netwerken binnen dezelfde regio en dat het niet kan worden gebruikt om verkeer tussen virtuele netwerken over verschillende abonnementen te routeren.

## Opdracht
1. Maak een Virtual Network met de volgende vereisten:  
   Region: West Europe  
   Name: Lab-VNet  
   IP range: 10.0.0.0/16  
   + Vereisten voor subnet 1:  
     Name: Subnet-1  
     IP Range: 10.0.0.0/24  
     Dit subnet mag geen route naar het internet hebben.  

   + Vereisten voor subnet 2:  
     Name: Subnet-2  
     IP Range: 10.0.1.0/24  
 
2. Maak een VM met de volgende vereisten:  
  Een apache server moet met de volgende custom data geïnstalleerd worden:  

   + #!/bin/bash  
     sudo su  
     apt update  
     apt install apache2 -y  
     ufw allow 'Apache'  
     systemctl enable apache2  
    systemctl restart apache2  

   + Er is geen SSH access nodig, wel HTTP  
     Subnet: Subnet-2  
     Public IP: Enabled  
   + Controleer of je website bereikbaar is  

### Gebruikte bronnen
[Virtual network traffic routing](https://learn.microsoft.com/en-us/azure/virtual-network/virtual-networks-udr-overview)  
[Azure Route tables](https://learn.microsoft.com/en-us/azure/virtual-network/manage-route-table)

### Ervaren uitdagingen
Deze opdracht was wel leuk om te doen. De uitdaging vond ik in het toepassen van de route table. Ik moest er eerst achterkomen dat ik die uberhaupt nodig had. Toen ik eenmaal besefte wat ik miste ging het heel soepel.

### Resultaat
- VNet aangemaakt met gespecificeerde eisen.
- VM aangemaakt en gekoppeld aan subnet met internet route.
- Subnet waar geen internet route is toegestaan geassocieerd aan route table en route ingesteld naar none.
- Subnet met internet route is bereikbaar via HTTP en subnet zonder internet route is niet bereikbaar via HTTP.
![](/00_includes/week-4-img/AZ-10_Resources.png)
![](/00_includes/week-4-img/AZ-10_VMNTWRK.png)
![](/00_includes/week-4-img/AZ-10_RoutesNIC.png)