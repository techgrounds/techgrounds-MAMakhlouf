# Datum 08/06

## Beslissingen
De infrastructuur wordt geïmplementeerd met behulp van Bicep. De Bicep-code omvat de volgende resources:

- 1 Azure Subscription
- 2 Virtual Networks (VNETs) met subnetten
- 2 Availability Zones
- Webserver in Availability Zone 2 met NSG
- Managementserver in Availability Zone 1 met NSG
- Key Vault voor geheime opslag
- Storage Account voor postdeployment-scripts


## Aannames
Aangenomen word dat voor de cloud infrastructuur de volgende resources nodig zullen zijn:
1. 2 vnets met een subnet in elk vnet. 
   + Elk subnet moeten worden beveiligd met een firewall
2. Vnet Peering zal gebruikt worden om de 2 vnets the connecten.
    + De webserver kan alleen vanuit de management server worden betreed via SSH/RDP.
    Hier zal de NSG van de webserver op moeten worden ingesteld. IP adress van managment server toestaan hiervoor.
3. Nadat de Vnets en subnets met de aangegeven IP ranges zijn aangemaakt beginnen we met het maken van de managment server.

## Planning

Om de transitie naar de cloud te realiseren, zal ik de volgende stappen ondernemen:  

Exploratie:  

- Ik zal de verstrekte eisen grondig bestuderen en eventuele onduidelijkheden identificeren.
- Ik zal aannames documenteren op basis van beschikbare informatie en communicatie met de stakeholders.
- Ik zal de benodigde cloudinfrastructuurdiensten identificeren en een overzicht maken.  

Netwerkdeployments:  

- Ik zal de IaC-code schrijven om de bestaande netwerkinfrastructuur te implementeren, inclusief de twee vnets die aan elkaar zijn gekoppeld via peering.
- Elk vnet zal één subnet hebben en gebruikmaken van twee beschikbaarheidszones.
- Ik zal subnet-level firewalls implementeren om de subnets te beschermen.
- Ik zal de encryptie van VM-disks configureren.  

Webserver deployment:  

- Ik zal de IaC-code schrijven om de webserver te implementeren, rekening houdend met de vereisten voor dagelijkse back-ups en het behouden van de backups gedurende 7 dagen.
- Ik zal de automatische installatie van de webserver configureren.  

Management server deployment:  

- Ik zal de IaC-code schrijven om de management server te implementeren, inclusief de configuratie van een publiek IP en beperkte toegang vanaf vertrouwde locaties.
- Ik zal de SSH- of RDP-verbindingen met de webserver alleen toestaan vanaf de management server.  

Opslagoplossing voor scripts:

- Ik zal de IaC-code schrijven om een opslagaccount te implementeren voor het opslaan van post-deployment scripts.
- Ik zal ervoor zorgen dat de scripts niet publiekelijk toegankelijk zijn.  

Versleuteling en back-upvoorzieningen:

- Ik zal de IaC-code schrijven om de vereiste versleuteling voor gegevens te configureren.
- Ik zal de IaC-code schrijven om de back-upvoorzieningen te implementeren en te testen.  

Documentatie en MVP-configuratie:

- Ik zal documentatie voorzien over het gebruik van de applicatie, inclusief configuratievereisten en benodigde argumenten.
- Ik zal een configuratie voor een MVP-deployment maken, zodat de klant intern de architectuur kan testen voordat deze in productie wordt genomen.
- Tijdens het proces zal ik beslissingen documenteren en de nodige diagrammen opnemen om de praktische en technische informatie te visualiseren. Ik zal ook een tijdlog bijhouden om mijn voortgang en obstakels met bijbehorende oplossingen vast te leggen.  
- Ik zal ervoor zorgen dat ik binnen het toegewezen budget van €30-40 blijf om het project te voltooien en te voldoen aan de gestelde vereisten.

## Opties
Wees niet bang om verbeteringen in de architectuur voor te stellen of te implementeren, maar maak wel harde keuzes, zodat je de deadline kan halen.

---
