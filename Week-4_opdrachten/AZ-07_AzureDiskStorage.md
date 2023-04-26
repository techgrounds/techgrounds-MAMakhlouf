# Azure Disk Storage
[Geef een korte beschrijving van het onderwerp]

## Key-terms
- Azure managed disk:  
Een Azure Managed Disk is een geavanceerde opslagoplossing voor virtuele machines (VM's) die wordt aangeboden door Microsoft Azure. Het is een beheerde schijf die is ontworpen voor hoge beschikbaarheid en betrouwbaarheid en die gegevens veilig opslaat in een Azure-datacenter.  
Met Azure Managed Disks hoef je je geen zorgen te maken over het beheren van fysieke schijven of het configureren van opslagoplossingen. In plaats daarvan kun je eenvoudig de benodigde opslagruimte selecteren en Azure het werk laten doen om de Managed Disk te maken en te beheren.  
Je kunt kiezen uit verschillende soorten Managed Disks, zoals Standard en Premium, met verschillende prestatiekenmerken en prijzen. Met Azure Managed Disks kun je eenvoudig schijven toevoegen of verwijderen en de prestaties van de schijven aanpassen aan de behoeften van je toepassing.  

- Cluster manager:  
Een cluster manager is een softwareprogramma dat wordt gebruikt om meerdere computers, servers of nodes als één geheel te beheren en te coördineren, wat een cluster wordt genoemd.  
Een cluster manager verdeelt het werk en de taken over de verschillende nodes in het cluster, zodat de taken efficiënter worden uitgevoerd en de belasting over de nodes wordt verdeeld. Het zorgt ook voor de automatische failover van taken en toepassingen in geval van uitval van een node of hardwareproblemen.  
Cluster managers worden vaak gebruikt in high-performance computing (HPC) en big data-toepassingen, waar grote hoeveelheden gegevens moeten worden verwerkt en analyses moeten worden uitgevoerd. Populaire cluster managers zijn bijvoorbeeld Apache Hadoop, Kubernetes en Apache Mesos.

- Snapshot:  
Een snapshot is een momentopname van de huidige staat van een bestandssysteem, database, virtuele machine (VM) of ander opslagmedium op een bepaald tijdstip. Het is een statische kopie van de gegevens op dat moment en bevat alle gegevens en instellingen die op dat moment aanwezig waren.  
Snapshots kunnen worden gebruikt om gegevens te herstellen in het geval van gegevensverlies, corruptie of andere problemen. Met behulp van een snapshot kan het systeem snel worden teruggezet naar een eerdere staat zonder dat gegevens verloren gaan die zijn verzameld sinds de snapshot werd gemaakt.  
Snapshots kunnen ook worden gebruikt voor testdoeleinden, om te zien hoe een systeem zich zou gedragen als bepaalde wijzigingen werden aangebracht. Dit maakt het mogelijk om wijzigingen te testen en uit te voeren zonder de bestaande gegevens te beschadigen.
## Opdracht
- Start 2 Linux VMs. Zorgt dat je voor beide toegang hebt via SSH.
- Maak een Azure Managed Disk aan en koppel deze aan beide VMs tegelijk.
- Creëer op je eerste machine een bestand en plaats deze op de Shared Disk.
- Kijk op de tweede machine of je het bestand kan lezen.
- Maak een snapshot van de schijf en probeer hier een nieuwe Disk mee te maken
- Mount deze nieuwe Disk en bekijk het bestand.
### Gebruikte bronnen
[Azure Disk types](https://learn.microsoft.com/en-us/azure/virtual-machines/disks-types)  
[Attach a disk to VM (commands)](https://learn.microsoft.com/en-us/azure/virtual-machines/linux/attach-disk-portal?tabs=ubuntu)  
[Why shared drive is not showing content from one VM to another](https://learn.microsoft.com/en-us/answers/questions/874923/why-shared-drive-is-not-showing-content-from-one-a)

### Ervaren uitdagingen
Deze opdracht vond ik erg uitdagend. Naast mijn kennis gebrek was het praktische gedeelte ook erg onoverzichtelijk. De vereiste stappen om deze opdracht succesvol uit te voeren waren goed beschreven maar moeilijker uit te voeren dan ik dacht. Het aanmaken van de VMs ging best makkelijk. De shared managed disk opzetten en koppelen was ingewikkelder dan het leek in de eerste instantie. Vaak werd de aangemaakte disk niet weergeven, in de Azure Portal, bij de optie om te koppelen aan een VM. Ondanks dat deze correct aangemaakt was.  
Na meerdere malen opnieuw te beginnen en verdiepen in de materie heb ik de VMs kunnen koppelen aan 1 shared disk. Zodra de disk gekoppeld was, ging het formatteren en mounten zeer gemakelijk aangezien hier simpele uitleg voor te vinden was in de microsoft omgeving. Het volgende obstakel was het koppelen van de Disk die gemaakt is van de snapshot. Hier kreeg ik weer de zelfde issue als voorheen maar na meerdere malen opnieuw te proberen ging het goed. Zo heb ik uiteindelijk de opdracht succesvol weten af te ronden. Ook heb ik geleerd om de VMs te restarten na eventuele wijzigingen in de disk allocatie. Dit zorgde ervoor dat de VMs en de Azure Portal makkelijk mee werkte. 
### Resultaat
- 2 Linux VMs aangemaakt en betreed via SSH.
- Azure managed disk aangemaakt en gekoppeld aan beide VMs
![2vms](/00_includes/week-4-img/AZ-07_2vms.png)
- Shared disk gemount op beide VMs
![disks](/00_includes/week-4-img/AZ-07_mounted.png)
- Bestand aangemaakt op primaire VM en proberen te bekijken op 2e VM. Dit was niet mogelijk omdat er geen cluster manager is ingesteld.
![Clustermanager](/00_includes/week-4-img/AZ-07_NoFailover.png)
- Snapshot gemaakt van de shared disk en daar een schijf van gemaakt. Deze schijf gekoppeld en gemount aan de 2e VM. Zo kon ik het eerder gemaakte bestand wel inzien.
![Snapdisk](/00_includes/week-4-img/AZ-07_snapdisk!!!!.png)