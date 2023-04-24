# [Azure Global Infrastructure]
Kennis making met de globale Azure infrastructuur.

## Key-terms
- Redundantie:
  + In de Nederlandse taal staat redundant voor 'overbodig' of 'meer dan strikt noodzakelijk'.  
  In de IT heeft het woord vaak een andere betekenis. Hier wordt redundantie doorgaans als positief gezien, en wordt met redundantie bedoeld dat bepaalde voorzieningen meervoudig zijn uitgevoerd.

- SLA:
  + Een SLA (Service Level Agreement) is een overeenkomst tussen een leverancier en een afnemer van een bepaalde dienst waarin voor beide partijen duidelijk wordt gemaakt wat kan worden verwacht van de diensten, hoe de diensten kunnen worden verbeterd en wat de kosten daarvan zijn.

## Opdracht
Bestudeer:
- Wat is een Azure Region?
- Wat is een Azure Availability Zone?
- Wat is een Azure Region Pair?
- Waarom zou je een regio boven een andere verkiezen?
### Gebruikte bronnen
[ChatGPT](https://chat.openai.com/)

### Ervaren uitdagingen
De uitdaging in deze opdracht vond ik in de juiste bronnen vinden hiervoor aangezien er aanzienlijk veel informatie over valt te vinden, vaak in advertentie vorm. Ik heb daarom besloten om ChatGPT te vragen mij de te bestuderen onderwerpen te leren. De antwoorden heb ik deels in eigen woorden hieronder vermeld. Het verschil is dat Chat GPT mij deze kennis als beginneling op een zeer toegankelijke wijze heeft doen laten absorberen en begrijpen, in tegenstelling tot de wat diepgaandere/commercieële tekst op het internet. 

### Resultaat
- Wat is een Azure Region:

  + Een Azure Region is een geografische locatie waar Microsoft Azure-resources beschikbaar zijn voor implementatie en gebruik. Elke regio is een afzonderlijke geografische locatie die bestaat uit één of meer datacenters die zijn onderling verbonden via een speciaal Azure-netwerk.  

  + Microsoft heeft momenteel tientallen Azure-regio's wereldwijd verspreid, waaronder in Noord-Amerika, Europa, Azië, Afrika en Australië. Klanten kunnen Azure-services in elke regio gebruiken om hun workloads te implementeren en uit te voeren, met behoud van hoge beschikbaarheid en betrouwbaarheid.

  + Het kiezen van een Azure-regio is een belangrijke beslissing voor organisaties, omdat het de prestaties, gegevensbescherming, naleving en kosten van de geïmplementeerde workloads kan beïnvloeden. Het is belangrijk om de verschillende regio's te evalueren en de beste te kiezen op basis van de behoeften van uw organisatie en de locatie van uw eindgebruikers.

- Wat is een Azure Availability Zone:

  + Een Azure Availability Zone is een fysieke locatie binnen een Azure-regio die is ontworpen om redundantie en hoge beschikbaarheid te bieden voor cloud services. Elke Availability Zone bestaat uit een of meer datacenters die zijn geïsoleerd van andere Availability Zones binnen dezelfde regio en zijn verbonden via zeer snelle, private netwerkverbindingen.

  + Door gebruik te maken van Azure Availability Zones, kunnen bedrijven ervoor zorgen dat hun services in de cloud blijven draaien, zelfs als er zich storingen voordoen in een of meer Availability Zones binnen dezelfde regio. Dit biedt een hogere mate van bedrijfscontinuïteit en helpt organisaties te voldoen aan hun service level agreements (SLA's) en compliance-eisen.

  + Azure biedt momenteel drie Availability Zones per ondersteunde regio. Door het implementeren van resources in meerdere Availability Zones, kunnen organisaties de impact minimaliseren van storingen, zoals stroomuitval, netwerkonderbrekingen, natuurrampen, etc.  

- Wat is een Azure Region Pair:

  + Een Azure Region Pair is een set van twee Azure-regio's die fysiek gescheiden zijn door een afstand van honderden kilometers of meer. Deze regio's zijn gekoppeld voor disaster recovery en bedrijfscontinuïteit, zodat services en data kunnen worden hersteld in geval van storingen, zoals natuurrampen, stroomuitval, netwerkonderbrekingen of andere calamiteiten.

  + Wanneer een Azure-regiopaar is geconfigureerd, wordt één regio beschouwd als de primaire regio en de andere als de secundaire regio. De primaire regio is de locatie waar de services actief zijn en waar het merendeel van de gegevens wordt opgeslagen en verwerkt. De secundaire regio fungeert als failover-regio en kan worden geactiveerd wanneer de primaire regio niet beschikbaar is.

  + Azure Region Pairs zijn ontworpen om hoge beschikbaarheid te bieden en ervoor te zorgen dat services en gegevens altijd beschikbaar zijn, zelfs in geval van ernstige storingen. Microsoft garandeert een SLA van 99,99% uptime voor services die zijn geïmplementeerd in een Azure-regiopaar. Momenteel heeft Microsoft 27 Azure-regio's wereldwijd, elk met een gekoppelde regio voor disaster recovery en bedrijfscontinuïteit.

- Waarom zou je een regio boven een andere verkiezen?

  + Er zijn verschillende redenen waarom je de ene Azure-regio boven de andere zou kiezen, afhankelijk van de eisen en doelen van je organisatie.  
  Hieronder staan enkele overwegingen die je zou kunnen maken bij het kiezen van een Azure-regio:  

  1. Geografische locatie:  
  Als je applicaties of services zich bevinden in een bepaald geografisch gebied of als je wilt voldoen aan wettelijke of compliance-eisen voor gegevensopslag en -verwerking, kan het kiezen van een Azure-regio in die regio voordelen bieden.

  2. Beschikbaarheid en prestaties:  
  Als je hoge beschikbaarheid en prestaties nodig hebt voor je services, kan het kiezen van een regio die dicht bij je eindgebruikers of klanten ligt en die voldoende capaciteit heeft om aan je behoeften te voldoen, gunstig zijn.

  3. Kosten:  
  De prijzen voor Azure-services kunnen variëren tussen regio's en het kan voordelig zijn om een regio te kiezen waar de kosten van bepaalde services lager zijn.

  4. Naleving en beveiliging:  
  Als je voldoet aan specifieke nalevingsvereisten of als beveiliging een belangrijk aandachtspunt is, kan het kiezen van een regio met bepaalde certificeringen of beveiligingsmaatregelen gunstig zijn.

  5. Serviceaanbod:  
  Niet alle Azure-regio's bieden dezelfde services aan, en sommige services zijn mogelijk niet beschikbaar in bepaalde regio's. Het kan dus belangrijk zijn om te controleren welke services beschikbaar zijn in de regio's die je overweegt.

  + Het is ook belangrijk om te vermelden dat het kiezen van een regio niet betekent dat je je resources en services niet elders kunt uitvoeren. Azure biedt verschillende mogelijkheden voor het implementeren van services over meerdere regio's en het bouwen van veerkrachtige architecturen.
  ![](/00_includes/week-4-img/AZ-01.png)