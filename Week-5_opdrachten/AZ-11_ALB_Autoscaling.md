# Azure Load Balancer (ALB) &amp; Auto
Scaling  

Het aanmaken van VM Scale Sets en het testen van de scaling regels.

## Key-terms
- Azure Load Balancer:   

  Azure Load Balancer is een dienst in Microsoft Azure waarmee je binnenkomend netwerkverkeer kunt verdelen over meerdere virtuele machines. Het zorgt ervoor dat het verkeer efficiënt en gelijkmatig wordt verdeeld, waardoor de belasting op de VM's wordt verminderd en de applicatieprestaties worden verbeterd. Door het gebruik van Azure Load Balancer ben je er zeker van dat je applicatie altijd beschikbaar blijft, zelfs als één of meerdere VM's uitvallen.  

- VM Scale Set:  

  Azure Virtual Machine Scale Set is een dienst in Microsoft Azure die het mogelijk maakt om automatisch een groep identieke virtuele machines (VM's) te maken en te beheren. Deze VM's zijn op een schaalbare manier geconfigureerd, wat betekent dat ze automatisch kunnen worden op- of afgeschaald op basis van de veranderende vraag naar resources.  

  Dit betekent dat je een schaalbare infrastructuur kunt opzetten voor jouw applicatie of service, waarbij je kunt reageren op toenemende of afnemende verkeersbelastingen, zonder handmatig VM's toe te voegen of te verwijderen. Je kunt de VM's in de Scale Set ook gebruiken om updates uit te voeren en om te zorgen voor een hogere beschikbaarheid van jouw applicatie of service. 

  Azure Virtual Machine Scale Set ondersteunt een breed scala aan besturingssystemen en is geïntegreerd met andere Azure-diensten, zoals Load Balancer en Autoscale, om automatische schaalbaarheid en hoge beschikbaarheid te bieden voor jouw applicaties.  

- Load Test:  
  
  Een load test is een soort test die wordt gebruikt om de prestaties en de reactie van een systeem of applicatie te meten onder normale of piekbelasting. Het doel van een load test is om te bepalen hoe het systeem zich gedraagt ​​en presteert bij verschillende niveaus van gebruikers- of verkeersbelasting.  
  
  Tijdens een load test wordt het systeem onderworpen aan een bepaalde hoeveelheid verkeer, dat kan worden gegenereerd door een groep gebruikers of door middel van geautomatiseerde tools. Het verkeer kan bestaan uit verschillende soorten activiteiten, zoals het uitvoeren van zoekopdrachten, het uploaden van bestanden, het genereren van rapporten, of het uitvoeren van transacties.  
  
  De load test simuleert een realistisch scenario van gebruikers- of verkeersbelasting om te zien hoe het systeem presteert onder verschillende belastingsniveaus. Hierbij wordt gelet op de responstijden, de doorvoersnelheid en het systeemgedrag onder belasting. Op basis van de resultaten van de test, kunnen er wijzigingen worden aangebracht aan de infrastructuur, software of configuratie om de prestaties te verbeteren en het systeem betrouwbaarder te maken.

## Opdracht
### Gebruikte bronnen
[Linux Stress application Syntax](https://www.tecmint.com/linux-cpu-load-stress-test-with-stress-ng-tool/)  
[Azure Load Balancer Documentation](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)  
[Azure VM Scale Sets Documentation](https://learn.microsoft.com/en-us/azure/virtual-machine-scale-sets/overview)

### Ervaren uitdagingen
De uitdaging van deze opdracht vond ik in het testen en beinvloeden van de scale set. In de eerste instantie probeerd ik een Azure load test te gebruiken maar dat was te ingewikkeld. Na de juiste vragen te stellen ben ik herinnerd aan de linux CLI stress test. Dit zorgde ervoor dat ik op een laagdrempelige manier de CPU van de VM kon beinvloeden. Dit zorgde er op zijn beurt voor dat de scale set meerdere VMs aanmaakte om de workload te schalen tussen de aangemaakte VMs.

### Resultaat
- VM Scale Set aangemaakt volgens beschreven eisen.
- Load balancer en NIC gekoppeld aan VM Scale Set.
- Toegang tot HTTP server met publieke IP van Load balancer. 
- Stress test via linux CLI ingesteld en geactiveerd op 80% voor 500 seconden lang.
- Scale set maakt na/tijdens stress test meerdere instances/VMs aan om de load te scalen.
![Scaling](/00_includes/Week-5-img/AZ-11_instances3-4.png)
![Scaled](/00_includes/Week-5-img/AZ-11_instances4.png)