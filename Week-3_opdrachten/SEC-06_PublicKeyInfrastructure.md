# Public Key Infrastructure
[Geef een korte beschrijving van het onderwerp]

## Key-terms
- PKI  
Een PKI (Public Key Infrastructure) is een set van rollen, beleidsregels, hardware, software en procedures die nodig zijn om digitale certificaten te creëren, beheren, distribueren, gebruiken, opslaan en intrekken, en om public-key encryptie te beheren. Het bestaat uit drie entiteiten die ervoor zorgen dat u veilig kunt communiceren over een onveilig netwerk zoals het openbare internet.  
  + X.509 is de standaard die het proces definieert waarin een PKI zou moeten functioneren. Er zijn vele manieren om een PKI te implementeren, niet allemaal voldoen ze aan de X.509 standaard.  

- OpenSSL:  
OpenSSL is een open source tool die wordt gebruikt om beveiligde verbindingen te maken en certificaten te beheren.

- SSL:   
Secure Sockets Layer.  
Beveiliging die bestaat uit het versleutelen van de gegevens die worden verzonden tussen een website en een browser, of tussen twee servers. Deze versleuteling voorkomt dat hackers de verzonden informatie, waaronder mogelijk persoonlijke of financiële gegevens, kunnen bekijken of stelen.  

- CSR:  
Een Certificate Signing Request (CSR) is een van de eerste stappen om je eigen SSL-certificaat te verkrijgen. De CSR wordt gegenereerd op de server waarop je het certificaat wil installeren. Een CSR bevat informatie (bv. common name, organisatie, land) die de certificeringsinstantie (CA) dan gaat gebruiken om jouw certificaat te creëren. De CSR bevat ook de public key die deel uitmaakt van jouw certificaat en wordt ondertekend met de overeenkomstige private key.  

- TLS:  
In cryptografie en computerbeveiliging zijn zelfondertekende certificaten certificaten met een openbare sleutel die niet zijn uitgegeven door een certificeringsinstantie (CA). Deze zelfondertekende certificaten zijn eenvoudig te maken en kosten geen geld. Ze bieden echter geen vertrouwenswaarde.  
Transport Layer Security (TLS) is een cryptografisch protocol dat is ontworpen om communicatiebeveiliging via een computernetwerk te bieden. Het protocol wordt veel gebruikt in toepassingen zoals e-mail, instant messaging en voice over IP, maar het gebruik ervan bij het beveiligen van HTTPS blijft het meest publiekelijk zichtbaar.  
Het TLS-protocol is primair gericht op het bieden van beveiliging, inclusief privacy (vertrouwelijkheid), integriteit en authenticiteit door het gebruik van cryptografie, zoals het gebruik van certificaten, tussen twee of meer communicerende computertoepassingen. Het draait in de presentatielaag en is zelf samengesteld uit twee lagen: het TLS-record en de TLS-handshake-protocollen.  


## Opdracht
### Gebruikte bronnen
[Wikipedia](https://nl.wikipedia.org/wiki/Hoofdpagina)  
[openSSL command Cheatsheet](https://www.freecodecamp.org/news/openssl-command-cheatsheet-b441be1e8c4a/#b723)

### Ervaren uitdagingen
Deze opdracht was niet moeilijk uit te voeren en de uitdaging ligt ook niet in het uitvoeren van de opdracht denk ik. Wel gaat er veel leerstof gepaard met deze oefening waar ik meer tijd voor zal moeten nemen om mij dit echt eigen te maken.
### Resultaat
1. OpenSSL geinstalleerd om om beveiligde verbindingen te maken en certificaten te beheren.
```
sudo apt-get update
sudo apt-get install openssl
```
2. Genereer een private key die nodig is om het certificaat te maken. Gebruik het RSA-algoritme om de private key te genereren en slaan het op in het bestand "akramkey.pem".
```
openssl genpkey -algorithm RSA -out akramkey.pem
```
3. Een certificaatondertekeningsaanvraag (CSR) wordt aangemaakt om informatie over het certificaat te verzamelen, zoals de naam van de organisatie, het land en andere relevante informatie. De CSR wordt aangemaakt met behulp van de private key die we in stap 2 hebben gegenereerd.
```
openssl req -new -key akramkey.pem -out csr.pem
```
4. Met deze stap wordt het self-signed certificaat gemaakt met behulp van de CSR en de private key. Ik gebruik de "-days" optie om de geldigheidsduur van het certificaat te specificeren en sla het certificaat op in het bestand "cert.pem"
```
openssl x509 -req -days 365 -in csr.pem -signkey akramkey.pem -out cert.pem
```
5. Deze stap toont de inhoud van het certificaat, zodat ik kan controleren of het correct is aangemaakt en alle benodigde informatie bevat.
```
openssl x509 -text -noout -in cert.pem
```
![resultaat](/00_includes/Week-3-img/SEC-06_Certi.png)
![Techgrounds](/00_includes/Week-3-img/SEC-06_TechgrondCerti.png)  

- Door mmc.exe (Microsoft Managment Console) kon ik mijn certificaten kiezen en inzien/beheren.
  + Door in powershell het volgende command te gebruiken krijg je ook inzage in de vertrouwde root certificaten en hun vervaldatum:
  ```
  Get-Childitem cert:\LocalMachine\root |format-list
  ```
  + In de Linux omgeving toon je de namen en elk vertrouwd root certificaat dmv het volgende command:
  ```
  sudo openssl x509 -noout -subject -in /etc/ssl/certs/ca-certificates.crt
  ```
