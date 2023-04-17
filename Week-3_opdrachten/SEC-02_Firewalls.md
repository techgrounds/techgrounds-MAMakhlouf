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
[]()

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
- Instaleren van Apache op de VM:
```
sudo apt-get update
sudo apt-get install apache2
```
- Firewall toepassingsprofielen inzien:
```
sudo ufw app list
```
- IP adress van de server was al bekend maar toch voor de lol curl  geinstalleerd en via icanhazip.com IP geidentificeerd. 
```
sudo apt install curl
curl -4 icanhazip.com
```
- IP adressingevoerd met juiste poortnummer om op de apache index pagina terecht te komen.
![curl gebruik voor ip](/00_includes/Week-3-img/SEC-02_curlIP.png)
![apache index page](/00_includes/Week-3-img/SEC-02_Appache.png)