# Datum 08/06

Zie [link](/PRO-01Cloud/Ontwerp/Schets.drawio) voor initiële schets van het netwerk.  
Jij bent verantwoordelijk voor het verhuizen van de huidige servers naar de cloud en voor het automatiseren van de deployment van deze infrastructuur.  
Dit moet gedaan worden in Bicep (voor Azure).  
Voorlopig is het genoeg om simpele placeholder content te gebruiken voor de website (denk aan een simpele index.html in plaats van een hele website).

We zullen werken met sprints van 2 weken waar je aan het eind van de sprint je progressie presenteert aan de stakeholders. Je zal uiteindelijk het project met de deliverables individueel inleveren via GitHub.

## De volgende eisen zijn aangegeven als noodzakelijk:

Alle VM disks moeten encrypted zijn.

De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden.

De webserver moet op een geautomatiseerde manier geïnstalleerd worden.

De admin/management server moet bereikbaar zijn met een publiek IP.

De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis)

De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24

Alle subnets moeten beschermd worden door een firewall op subnet niveau. _(Waarom 2 firewalls op subnet level?)_

SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server.

## Ontwerpdocumentatie - Cloud Project

## 1. Inleiding

Beschrijf het doel van het ontwerpdocument en geef een overzicht van de projectvereisten en doelstellingen.

## 2. Architectuurdiagram

Voeg een architectuurdiagram toe waarin de verschillende componenten van de applicatie worden weergegeven, inclusief de virtuele netwerken, subnets, NSG's, VM's en andere relevante resources.

## 3. IaC-code (Bicep)

De infrastructuur wordt geïmplementeerd met behulp van Bicep. De Bicep-code omvat de volgende resources:

- 1 Azure Subscription
- 2 Virtual Networks (VNETs) met subnetten
- 2 Availability Zones
- Webserver in Availability Zone 2 met NSG
- Managementserver in Availability Zone 1 met NSG
- Key Vault voor geheime opslag
- Storage Account voor postdeployment-scripts

## 4. Netwerkbeveiliging

Om de netwerkbeveiliging te waarborgen, worden de volgende (N)SG-regels toegepast:

Webserver NSG-regels:

- Toestaan van inkomend HTTP-verkeer (poort 80)
- Toestaan van inkomend SSH/RDP-verkeer vanuit de managementserver
- Beperken van al het andere inkomend en uitgaand verkeer

Managementserver NSG-regels:

- Toestaan van inkomend SSH/RDP-verkeer vanuit vertrouwde locaties (office/admin's thuis)
- Beperken van al het andere inkomend en uitgaand verkeer

## 5. Identity and Access Management (IAM)

Voor het beheer van de toegang tot de resources worden de volgende IAM-rollen en machtigingen gebruikt:

- Eigenarenrol: Toegekend aan geautoriseerde gebruikers voor volledige beheertoegang tot de resources.
- Bijdragersrol: Toegekend aan teamleden voor het uitvoeren van bepaalde taken binnen de resources.
- Lezersrol: Toegekend aan stakeholders voor alleen-lezen toegang tot de resources.

## 6. Opslag en versleuteling

De volgende opslagoplossingen worden gebruikt in het project:

- Key Vault: Gebruikt voor het veilig opslaan van geheime informatie, zoals wachtwoorden en API-sleutels.
- Storage Account: Gebruikt voor het opslaan van postdeployment-scripts en andere bestanden. Alle gegevens worden versleuteld opgeslagen.

## 7. Backup-oplossing

Om aan de backupvereisten te voldoen, wordt de volgende backup-oplossing geïmplementeerd:

- Gebruik van Azure Backup: De webserver wordt dagelijks gebackupt en de backups worden 7 dagen bewaard.

## 8. Toegangsbeheer

Het toegangsbeheer wordt als volgt geconfigureerd:

- Webserver: Toegang tot de webserver is beperkt tot inkomend HTTP-verkeer vanuit het internet.
- Managementserver: Toegang tot de managementserver is beperkt tot inkomend SSH/RDP-verkeer vanuit vertrouwde locaties (office/admin's thuis). Een publiek IP-adres wordt geconfigureerd voor externe toegang.

## 9. Conclusie

Dit ontwerpdocument heeft de architectuur en configuratie van het cloudproject beschreven. Het bevat de Bicep-code, netwerkbeveiliging, IAM-rollen, opslag- en versleutelingsoplossingen, backup-oplossing en toegangsbeheer. Het dient als referentie voor de implementatie van het project en kan worden bijgewerkt naarmate de configuratie en vereisten veranderen.

##

##
