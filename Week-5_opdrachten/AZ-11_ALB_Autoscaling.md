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

## Opdracht
### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

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