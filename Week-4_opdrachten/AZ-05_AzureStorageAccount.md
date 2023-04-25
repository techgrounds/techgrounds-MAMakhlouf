# Azure Storage Account
Het maken en beheren van een azure storage account

## Key-terms
- Azure storage account:  
Een Azure Storage-account is een service die wordt aangeboden door Microsoft Azure, de cloud computing-dienst van Microsoft. Het biedt opslagcapaciteit in de cloud voor verschillende soorten gegevens, zoals bestanden, blobs, tabellen, queues en schijven.  
Het is een schaalbare en duurzame opslagoplossing die beschikbaar is via het internet en kan worden gebruikt voor het opslaan en beheren van gegevens voor verschillende toepassingen, zoals webtoepassingen, mobiele apps, back-up en herstel, big data en analyse, en archivering.  
Azure Storage biedt ook geavanceerde functies zoals gegevensencryptie, versiebeheer, automatische back-ups, en redundantie voor het opslaan van gegevens op meerdere locaties, waardoor de beschikbaarheid en betrouwbaarheid van de gegevens wordt vergroot.  

- Blobs:  
Blobs (Binary Large Objects) zijn een type gegevensopslag in Azure Storage en andere cloudgebaseerde systemen. Blobs zijn bedoeld voor het opslaan van ongestructureerde gegevens, zoals afbeeldingen, video's, audiobestanden, documenten, logbestanden en andere grote bestanden.  
Blobs zijn ontworpen om te werken met grote hoeveelheden ongestructureerde gegevens en bieden de mogelijkheid om gegevens op te slaan in een platte container, zonder een vooraf gedefinieerde structuur. Dit betekent dat de grootte van de blobs kan variëren en dat u ze kunt opslaan zonder u zorgen te hoeven maken over de structuur van de gegevens.  
Azure Storage biedt drie soorten blobs: block blobs, page blobs en append blobs. Block blobs worden gebruikt voor het opslaan van grote bestanden, zoals afbeeldingen en video's. Page blobs worden gebruikt voor het opslaan van virtuele harde schijven (VHD's) en andere sequentiële gegevens. Append blobs zijn bedoeld voor het continu toevoegen van gegevens aan een bestand, zoals logbestanden.

## Opdracht
Opdracht 1:
- Maak een Azure Storage Account. Zorg dat alleen jij toegang hebt tot de data.
- Plaats data in een storage service naar keuze via de console (bijvoorbeeld een
kattenfoto in Blob storage).
- Haal de data op naar je eigen computer door middel van de Azure Storage Explorer.  

Opdracht 2:
- Maak een nieuwe container aan.
- Upload de 4 bestanden die samen de AWS Demo Website vormen.
- Zorg dat Static Website Hosting aan staat.
- Deel de URL met een teamgenoot. Zorg ervoor dat zij de website kunnen zien.  

### Gebruikte bronnen
[Blob acces levels](https://learn.microsoft.com/en-us/azure/storage/blobs/anonymous-read-access-configure?tabs=portal)
### Ervaren uitdagingen
Deze opdracht vond ik best moeilijk te begrijpen. Aangezien dit de eerste praktijk opdracht is in de Azure omgeving moest ik mezelf toch aanleren de juiste weg te vinden voor specifieke doeleinden. Het aanmaken van het storage account en het aanmaken van de blob containers was vrij makkelijk. De uitdaging vond ik vooral in de acces control. Ervoor zorgen dat er restricties waren voor mijn containers en het vrijgeven van mijn statische website was best uitdagend. Omdat er zoveel mogelijkheden zijn, is er ook veel documentatie waar ik als beginner makkelijk in verdwaalde. Na het nodige speurwerk en overleg met mijn teamgenoten heb ik een passende manier gevonden en zo de opdracht kunnen voltooien
### Resultaat 

- Opdracht 1.
  - Storage account aangemaakt in mijn Azure omgeving genaamd: akramstorage.
  - Bij de netwerk opties gekozen voor:  
  Enabled from selected virtual networks and IP addresses.  
  - Vervolgens mijn public IP adress toegevoegd aan de 'whitelist'.
  ![IP-ACCES](/00_includes/week-4-img/AZ-05_IPacces.png)
  - Overgegaan naar het aanmaken van een blob container.
  - Willekeurige PNG afbeelding toegevoegd aan de container.
  - Bij de security opties gekozen voor:  
  ![Blob acces](/00_includes/week-4-img/AZ-05_blobAcces.png)
  - Azure Storage Explorer gedownload en geinstalleerd.
  ![AzureExplorer](/00_includes/week-4-img/AZ-05_Explorer.png)

- Opdracht 2.
  - Nieuwe container aangemaakt en statische website hosting optie aangezet.
  - Website bestanden geupload naar blob container.
  - Blob acces ingesteld.
  ![blobacces](/00_includes/week-4-img/AZ-05_blobacceses.png)
  - URL gedeeld met teamgenoten en werkt naar behoren.
