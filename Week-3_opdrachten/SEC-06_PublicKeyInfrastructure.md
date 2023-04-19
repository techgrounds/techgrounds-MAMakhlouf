# Public Key Infrastructure
[Geef een korte beschrijving van het onderwerp]

## Key-terms
- PKI  
Een PKI (Public Key Infrastructure) is een set van rollen, beleidsregels, hardware, software en procedures die nodig zijn om digitale certificaten te creëren, beheren, distribueren, gebruiken, opslaan en intrekken, en om public-key encryptie te beheren. Het bestaat uit drie entiteiten die ervoor zorgen dat u veilig kunt communiceren over een onveilig netwerk zoals het openbare internet.  
X.509 is de standaard die het proces definieert waarin een PKI zou moeten functioneren. Er zijn vele manieren om een PKI te implementeren, niet allemaal voldoen ze aan de X.509 standaard.  

- OpenSSL:  
OpenSSL is een open source tool die wordt gebruikt om beveiligde verbindingen te maken en certificaten te beheren.

- CSR:  
Een Certificate Signing Request (CSR) is een van de eerste stappen om je eigen SSL-certificaat te verkrijgen. De CSR wordt gegenereerd op de server waarop je het certificaat wil installeren. Een CSR bevat informatie (bv. common name, organisatie, land) die de certificeringsinstantie (CA) dan gaat gebruiken om jouw certificaat te creëren. De CSR bevat ook de public key die deel uitmaakt van jouw certificaat en wordt ondertekend met de overeenkomstige private key.  

- 
## Opdracht
### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

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
