# Azure Disk Storage
[Geef een korte beschrijving van het onderwerp]

## Key-terms


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