# Datum 08/06
Zie [link](/PRO-01Cloud/Ontwerp/Schets.drawio) voor initiële schets van het netwerk.

##  De volgende eisen zijn aangegeven als noodzakelijk:

  
Alle VM disks moeten encrypted zijn.  
De webserver moet dagelijks gebackupt worden. De backups moeten 7 dagen behouden worden.  
De webserver moet op een geautomatiseerde manier geïnstalleerd worden.  
De admin/management server moet bereikbaar zijn met een publiek IP.  
De admin/management server moet alleen bereikbaar zijn van vertrouwde locaties (office/admin’s thuis)  
De volgende IP ranges worden gebruikt: 10.10.10.0/24 & 10.20.20.0/24  
Alle subnets moeten beschermd worden door een firewall op subnet niveau.  
SSH of RDP verbindingen met de webserver mogen alleen tot stand komen vanuit de admin server.  
Wees niet bang om verbeteringen in de architectuur voor te stellen of te implementeren, maar maak wel harde keuzes, zodat je de deadline kan halen.  


## Ontwerp strategie
 1. Aanmaken van 2 vnets en 1 subnet per vnet.
 2. Aanmaken van management server en management NSG implementeren.
 3. Aanmaken van Web server en Application NSG implementeren.
 4. Peering tussen 2 vnets tot stand brengen.
 5. Security regels bekijken en eventueel aanbrengen/aanpassen

## 


## 
