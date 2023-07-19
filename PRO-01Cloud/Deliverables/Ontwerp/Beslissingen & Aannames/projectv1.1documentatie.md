# Ontwerp- en Beslissingsdocumentatie - Project v1.1

In dit document beschrijven we de aangepaste architectuur en de gebruikte cloudservices voor versie 1.1 van de applicatie. Ik heb gekozen voor een combinatie van een VM Scale Set en een Application Gateway voor de webserver:

Architectuurtekening:
De bijgewerkte architectuurtekening geeft een overzicht van de nieuwe functionaliteiten en beveiligingslagen die aan de applicatie worden toegevoegd. De belangrijkste onderdelen die hierin moeten worden opgenomen zijn:

1. VM Scale Set:

De VM Scale Set wordt gebruikt om een groep identieke virtuele machines te beheren die de webserver hosten.
Het schalen van het aantal virtuele machines gebeurt automatisch op basis van de belasting.

2. Health Checks:

De VM Scale Set voert periodieke health checks uit op de webserver om te controleren of deze correct functioneert.
Als een virtuele machine niet reageert op de health check, wordt deze automatisch hersteld of verwijderd uit de pool.

3. Application Gateway:

De Application Gateway fungeert als een applicatieniveau gateway voor inkomende verbindingen.
Het accepteert HTTP-verzoeken van gebruikers en stuurt deze door naar de VM Scale Set.

4. HTTPS-verbinding:

De Application Gateway stelt ons in staat om SSL-terminatie te implementeren en HTTPS te gebruiken voor beveiligde communicatie.
Hoewel we een self-signed certificate gebruiken, zal de verbinding versleuteld zijn voor de gebruikers.

5. Beveiligingsgroepen:

Beveiligingsgroepen worden geconfigureerd om de juiste netwerktoegang tot de servers toe te staan.
Inkomend verkeer op poort 80 (HTTP) wordt alleen toegestaan vanaf de Application Gateway.
Inkomend verkeer op poort 443 (HTTPS) wordt alleen toegestaan vanaf de Application Gateway.
Uitgaand verkeer wordt toegestaan voor het uitvoeren van noodzakelijke taken.

## Onderbouwing van de gebruikte diensten voor de webserver:  
In het ontwerpdocument leg ik uit waarom gekozen word voor de combinatie van VM Scale Set en Application Gateway om aan de eisen van de klant te voldoen. Dit omvat:

- VM Scale Set:

De VM Scale Set biedt flexibiliteit en schaalbaarheid, wat essentieel is voor het beheer van de webserver onder wisselende belasting.

- Application Gateway:

De Application Gateway stelt ons in staat om HTTP-verzoeken te ontvangen en te routeren naar de VM Scale Set.
Het biedt SSL-terminatie voor het mogelijk maken van HTTPS en het gebruik van het self-signed certificate.

- Self-signed Certificate:

Hoewel we geen domeinnaam aanschaffen, biedt het self-signed certificate nog steeds een versleutelde verbinding voor de gebruikers.
Hierdoor kunnen we de beveiliging van de applicatie verbeteren, zelfs zonder officiële certificaten van certificaatautoriteiten.


# Beslissing Database:
Voor het opslaan van de gegevens van de webserver hebben we gekozen voor een Single Server SQL Database. We hebben deze keuze gemaakt vanwege de volgende overwegingen:

Schaalbaarheid: Aangezien dit project zich momenteel nog in de beginfase bevindt en de klant momenteel geen specifieke vereisten voor schaalbaarheid heeft, biedt een Single Server SQL Database voldoende capaciteit om aan de huidige behoeften te voldoen. Naarmate het project zich ontwikkelt en de vraag naar de applicatie toeneemt, kunnen we overwegen over te stappen naar een schaalbare optie, zoals een Managed SQL Database.

Beheerbaarheid: Een Single Server SQL Database is eenvoudig te beheren, aangezien er slechts één server is om te monitoren, onderhouden en back-ups van te maken. Dit maakt het eenvoudiger om de database te beheren en mogelijke problemen op te lossen.

Kosten: In vergelijking met schaalbare opties kan een Single Server SQL Database kosteneffectiever zijn, vooral in de beginfase van het project wanneer er minder vraag is naar resources.

Ontwerp:
Voor de implementatie van de Single Server SQL Database hebben we het volgende ontwerp uitgewerkt:

SQL Server: We zullen gebruikmaken van een SQL Server-database-engine om de gegevens van de webserver op te slaan.

Virtuele Machine (VM): De SQL Server wordt geïnstalleerd op een aparte virtuele machine die de database host. Deze VM zal worden geconfigureerd met de nodige resources, zoals CPU, geheugen en opslag, om optimale prestaties te garanderen.

Opslag: Voor de opslag van gegevens zal de VM beschikken over voldoende opslagruimte om aan de behoeften van de applicatie te voldoen. We zullen ervoor zorgen dat deze opslag versleuteld is om de veiligheid van de gegevens te waarborgen.

Back-ups: We zullen een geautomatiseerd back-upmechanisme implementeren om dagelijkse back-ups van de SQL Database te maken. Deze back-ups worden behouden gedurende een periode van 7 dagen, zoals vereist door de klant.

Beveiliging: De SQL Server zal worden geconfigureerd om alleen verbindingen van vertrouwde bronnen toe te staan, zoals de admin/management server. Hierdoor wordt de database beveiligd tegen ongeautoriseerde toegang van buitenaf.

Met deze keuze en het bijbehorende ontwerp kunnen we voldoen aan de eisen van de klant en een veilige en betrouwbare omgeving bieden voor de webserver in versie 1.0 van het proje