# Network detection
Kennismaking met het analyseren van netwerken.

## Key-terms
-  Nmap   
Nmap allows you to scan your network and discover not only everything connected to it, but also a wide variety of information about what's connected, what services each host is operating, and so on. It allows a large number of scanning techniques, such as UDP, TCP connect (), TCP SYN (half-open), and FTP.  

## Opdracht
### Gebruikte bronnen
[Install and use Nmap on Linux](https://vitux.com/find-devices-connected-to-your-network-with-nmap/)

### Ervaren uitdagingen
Het was even uitvogelen hoe ik in wireshark processen/applicaties kon identificeren. Dit is uitendelijk gelukt door te vragen aan andere waar ik op moet letten.  

### Resultaat
-  Installatie van Nmap met volgende command:  
```
sudo apt install nmap
```
-  Installatie net-tools zodat we netwerk correct kunnen scannen met volgende command:
``` 
sudo apt install net-tools
```
-  Gebruik volgende command om netwerk omgeving te scannen:
```
ifconfig
```
-  Zie hieronder resultaat
![Terminal](/00_includes/Week-3-img/SEC-01_IFCONFIG.png)
-  Zoom aangelaten tijdens wireshark sessie. De gegevens gesorteerd op afkomst en bestemming. Zo heb ik de browser packets kunnen vinden en inzien.
