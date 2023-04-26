# Firewalls
Begrijpen en toepassen van firewalls in Azure

## Key-terms
- Verschil tussen Basic en Premium Firewall:  

  + Een firewall is een beveiligingsfunctie die wordt gebruikt om het netwerk te beschermen tegen ongeautoriseerde toegang en aanvallen.  

  + Een Basic Firewall is een eenvoudige vorm van firewall die basisfunctionaliteiten biedt zoals het filteren van inkomend en uitgaand verkeer op basis van IP-adressen, poortnummers en protocoltypen. Deze firewall biedt doorgaans basisbeveiliging en is geschikt voor kleinere bedrijven of thuisgebruikers.  

  + Een Premium Firewall biedt geavanceerde beveiligingsfuncties, zoals Intrusion Prevention System (IPS), Content Filtering, Application Control en Advanced Threat Protection. Deze firewall biedt meer geavanceerde bescherming tegen complexe bedreigingen en is meer geschikt voor grotere bedrijven die meer gevoelige gegevens hebben en een hoger beveiligingsniveau nodig hebben.  

  + Kortom, een Basic Firewall is een eenvoudige firewall die basisbeveiliging biedt, terwijl een Premium Firewall meer geavanceerde beveiligingsfuncties biedt voor hogere beveiligingsniveaus en geavanceerde bedreigingen.                                   
                          
- Het verschil tussen een Firewall en een Firewall beleid (Firewall Policy):  

  + Een firewall is een beveiligingsfunctie die wordt gebruikt om netwerken te beschermen tegen ongeautoriseerde toegang en aanvallen. Het controleert het verkeer dat binnenkomt en het verkeer dat het netwerk verlaat. Het implementeren van een firewall op een netwerk is slechts een eerste stap in het beveiligen van het netwerk.  

  + Een Firewall beleid (Firewall Policy) is een verzameling regels en procedures die zijn ontworpen om de werking van de firewall te bepalen. Het Firewall beleid bepaalt welke verkeersstromen zijn toegestaan of geweigerd, en hoe de firewall moet reageren op verschillende soorten verkeer. Dit beleid omvat vaak beperkingen op het type verkeer dat door de firewall wordt toegestaan, de bron en bestemming van het verkeer en de tijden waarop het verkeer wordt toegestaan. Het beleid kan ook regels bevatten voor toegang tot specifieke toepassingen en services.  

  + Met andere woorden, een Firewall bepaalt welk verkeer wel of niet mag worden doorgelaten, terwijl een Firewall beleid de regels en procedures bepaalt voor het gebruik van de Firewall. Het Firewall beleid is dus van cruciaal belang voor het effectief beveiligen van het netwerk met behulp van de firewall.  
  
- Waarom is de Azure Firewall meer dan alleen een Firewall:  
  + De Azure Firewall is veel meer dan alleen een firewall. Het is een uitgebreide netwerkbeveiligingsoplossing die geavanceerde beveiligingsfuncties biedt, waaronder:

    1. Firewall-functionaliteit: de Azure Firewall beschermt het netwerk tegen ongeautoriseerde toegang en aanvallen door het verkeer dat binnenkomt en vertrekt te controleren en te filteren.

    2. Netwerkbeveiligingsgroepen (NSG's): De Azure Firewall werkt samen met NSG's om het verkeer binnen het netwerk te beveiligen. Hiermee kan je specifieke regels instellen voor verschillende beveiligingsniveaus en toepassingen.

    3. Application Gateway integratie: de Azure Firewall werkt samen met Application Gateway om verkeer op toepassingsniveau te inspecteren en te filteren.

    4. Geavanceerde Threat Protection: de Azure Firewall biedt bescherming tegen geavanceerde bedreigingen zoals malware, spyware en virussen door het gebruik van geavanceerde beveiligingsfuncties zoals IPS (Intrusion Prevention System) en URL-filtering.

    5. Integratie met Azure Sentinel: Azure Firewall werkt samen met Azure Sentinel om beveiligingsincidenten te detecteren, te onderzoeken en te reageren op basis van gebeurtenissen die worden gegenereerd door de firewall.

    + Kortom, de Azure Firewall biedt meer dan alleen basis firewall-functionaliteit. Het biedt geavanceerde beveiligingsfuncties, integratie met andere Azure-oplossingen en een breed scala aan aanpasbare beveiligingsfuncties om het netwerk effectief te beschermen tegen geavanceerde bedreigingen en aanvallen.

- Het verschil tussen Azure Firewall en NSG:  

  + Azure Firewall en Network Security Group (NSG) zijn beide beveiligingsoplossingen van Microsoft Azure, maar hebben verschillende functionaliteiten.

  + Azure Firewall is een centrale netwerkbeveiligingsoplossing die geavanceerde firewall-functionaliteit biedt voor het inspecteren en filteren van verkeer dat binnenkomt en vertrekt uit het netwerk. Het biedt ook geavanceerde beveiligingsfuncties, zoals Intrusion Prevention System (IPS), URL-filtering, Application Rules en DNS-proxy. Azure Firewall werkt op de applicatielaag en kan dus verkeer filteren op basis van specifieke applicaties, poorten en protocollen.

  + Aan de andere kant biedt NSG's netwerksegmentatie op basis van IP-adressen, poorten en protocollen. Het werkt op de netwerklagen 3 en 4 en kan specifieke regels instellen om verkeer binnen een bepaald subnet te controleren en te filteren. Het kan ook worden geconfigureerd om specifieke verkeersstromen toe te staan of te blokkeren op basis van de bron- en bestemmings-IP-adressen en poorten.

  + Kortom, Azure Firewall en NSG hebben verschillende functionaliteiten. Azure Firewall biedt geavanceerde firewall-functionaliteit voor het inspecteren en filteren van verkeer op de applicatielaag, terwijl NSG's netwerksegmentatie biedt op de netwerklagen 3 en 4 om het verkeer binnen een bepaald subnet te controleren en te filteren. In feite kunnen Azure Firewall en NSG's samen worden gebruikt voor een complete netwerkbeveiligingsoplossing.
## Opdracht
Bestudeer:
- Het verschil tussen Basic en Premium Firewall.
- Het verschil tussen een Firewall en een Firewall beleid (Firewall Policy).
- Dat Azure Firewall veel meer is dan alleen een firewall.
- Het verschil tussen Azure Firewall en NSG.

Opdracht:
- Zet een webserver aan. Zorg dat de poorten voor zowel SSH als HTTP geopend zijn.
- Maak een NSG in je VNET. Zorg ervoor dat je webserver nog steeds bereikbaar is via HTTP, maar dat SSH geblokkeerd wordt.

### Gebruikte bronnen
[Alles over basic/standard/premium Azure firewal](https://learn.microsoft.com/en-us/azure/firewall/basic-features)  
[Azure Firewall Manager-beleid](https://learn.microsoft.com/nl-nl/azure/firewall-manager/policy-overview)  
[Azure Firewall vs Network Security Group](https://k21academy.com/microsoft-azure/az-500/azure-firewall-vs-nsg/#:~:text=Azure%20Firewall%20and%20NSG%20in%20Conjunction&text=An%20NSG%20is%20more%20targeted,with%20both%20firewalls%20and%20NSG.)
### Ervaren uitdagingen
Deze opdracht vond ik vrij makkelijk uit te voeren. Ook vond ik genoeg informatie over de te bestuderen punten. Deze punten zijn makkelijk te begrijpen voor mij en heb goed overzicht verkregen over het algeheel.

### Resultaat
- VM aangemaakt en HTTP en SSH ingesteld als toegangspunt.
- Network Security Group aangemaakt in dezelfde resourcegroup als de VM.
- NSG inbound regels aangepast/toegepast als vereist.
![](/00_includes/week-4-img/AZ-08_inboundrules.png)
- Gewenst resultaalt behaald en opdracht voltooid. Toegang via HTTP mogelijk en via SSH geblokkeerd.
![HTTP allowed](/00_includes/week-4-img/AZ-08_HTTPconnection.png)
![SSH denied](/00_includes/week-4-img/AZ-08_SSHconnection.png)