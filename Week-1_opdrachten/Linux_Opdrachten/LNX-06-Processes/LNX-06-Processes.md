# [Processes]
[Het indentificeren van processen en hun waardes]

## Key-terms
PID:  
Staat voor Process ID. PID is de unieke identificatie van het besturingssysteem voor actieve programma's die worden uitgevoerd.  

Deamon:  
Een daemon wordt ook wel achtergrondprocessen genoemd. Het is een UNIX- of Linux-programma dat op de achtergrond wordt uitgevoerd. Bijna elke daemon bevat namen die eindigen op de letter "d". Bijvoorbeeld sshd, dit beheert verbindingen van SSH-toegang op afstand, of de httpd-daemon die de Apache-server beheert.

Services:  
Een service is een programma dat op de achtergrond wordt uitgevoerd buiten de interactieve controle van systeemgebruikers omdat ze geen interface hebben. Dit om nog meer veiligheid te bieden, omdat sommige van deze diensten cruciaal zijn voor de werking van het besturingssysteem
    
## Opdracht
### Gebruikte bronnen
[How to use telnet](https://www.atlantic.net/vps-hosting/how-to-install-and-use-telnet-on-debian-11/)

### Ervaren uitdagingen
Deze opdracht was erg uitdagend voor mij. Omdat ik helemaal niet bekend ben met telnet en ik het overzicht vaak verloor waardoor ik steeds opnieuw moest beginnen. Verder schoot ik het doel voorbij voor mijn gevoel.
De verwarring zat in het feit dat de telnet daemon een andere naam heeft dan de telnet applicatie, namelijk inetd. 

### Resultaat
Ik denk dat de opdracht gelukt is omdat ik de vereiste heb voldaan. Zie screenshot.  
Na het succesvol installeren van telnet was het een kwestie van de daemon starten en met de systemcl status command de gegevens in te kunnen zien, om zo vervolgens met de opgegeven PID het kill command uit te kunnen voeren.
![Screenshot](/00_includes/Week-1-img/telnet.png)