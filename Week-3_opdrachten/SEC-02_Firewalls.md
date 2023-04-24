# Firewalls
Kennismaking met firewalls

## Key-terms
- Firewall  
Een firewall is software dat netwerkverkeer filtert. Een firewall kan dit verkeer filteren op
protocol, poortnummer, bron en bestemming van een pakket. Meer geavanceerdere firewalls
kunnen ook de inhoud inspecteren om eventuele gevaren te blokkeren.
- Statefull/Stateless  
Stateful firewalls onthouden de verschillende
states van vertrouwde actieve sessies. Hierbij hoeft een stateful firewall niet elke pakketje te
scannen voor deze verbindingen.
## Opdracht
### Gebruikte bronnen
[How to install/use Apache web server on Debian 11](https://www.digitalocean.com/community/tutorials/how-to-install-the-apache-web-server-on-debian-11)  
[Ubuntu Firewall use](https://ubuntu.com/server/docs/security-firewall)

### Ervaren uitdagingen
De opdracht begon niet heel erg uitdagend en was een kewestie van de juiste commands erbij pakken om de webserver aan de praat te krijgen. De verwarring begon te ontstaan toen ik het unieke poortnummer vergat toe te voegen om de standaardpagina te weergeven. Vandaar ging het bergafwaarts en had ik beter even een korte pauze kunnen nemen. Maar omdat ik de opdracht graag af wou maken ging ik toch verder naar het volgende onderdeel. Zo heb ik mezelf uit de VM weten te locken door de ssh verbindingen perongeluk niet meer toe te laten. 

### Resultaat
- Instaleren van Apache op de VM:
```
sudo apt-get update
sudo apt-get install apache2
```
- Firewall toepassingsprofielen inzien:
```
sudo ufw app list
sudo ufw status verbose
sudo ufw allow 'Apache'
sudi ufw allow 'Apache Full'
```
- IP adress van de server was al bekend maar toch voor de lol curl  geinstalleerd en via icanhazip.com IP geidentificeerd. 
```
sudo apt install curl
curl -4 icanhazip.com
```
- IP adressingevoerd met juiste poortnummer om op de apache index pagina terecht te komen.
![curl gebruik voor ip](/00_includes/Week-3-img/SEC-02_curlIP.png)
![apache index page](/00_includes/Week-3-img/SEC-02_Appache.png)
- Apache en Apache Full service denied in de ufw instellingen.
```
sudo ufw deny 'Apache'
sudo ufw deny 'Apache Full'
```
Firewall werkt correct want de pagina is niet meer bereikbaar.