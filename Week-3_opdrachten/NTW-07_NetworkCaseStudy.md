# Networking case study

Het aanmaken van een netwerk.

## Key-terms

- AD (Active directory) Server  
  Active Directory slaat informatie op over objecten op het netwerk en maakt deze informatie gemakkelijk te vinden en te gebruiken voor beheerders en gebruikers. Active Directory gebruikt een gestructureerd gegevensarchief als basis voor een logische, hiërarchische organisatie van directory-informatie.
- Web server  
  Op een webserver staat digitale informatie die opgeroepen kan worden. De client vraagt informatie op bij een host, dit werkt op basis van het HTTP protocol. De opgevraagde data wordt via internet verzonden naar de browser of systeem van de client voor verder gebruik of weergave.

## Opdracht

### Gebruikte bronnen

[Wat is een DMZ](https://www.strato.nl/server/wat-is-een-demilitarized-zone-dmz/)

### Ervaren uitdagingen

Tijdens deze opdracht was het belangrijk even goed te onderzoeken op google welke apparaten voor welk doeleinde fungeren. Daarna was de basis snel gelegd. Het volgende leermoment was de beveiliging van het netwerk instellen. Dit kan op vele manieren. Ik heb voor de simpelere manier gekozen zodat ik de kern beter leer begrijpen.

### Resultaat

- Router voor data overdracht en NAT toepassing. NAT ''verstopt'' interne IP adressen.
- Firewall tussen router en subnetwerken om ongeautoriseerde toegang tegen te gaan.
- 2 aparte subnetwerken om risico's te spreiden.
- Proxy server voor extra laag beveiliging.
  ![NTWCS](/00_includes/Week-3-img/NTW-07_NetworkingCaseStudy.png)
