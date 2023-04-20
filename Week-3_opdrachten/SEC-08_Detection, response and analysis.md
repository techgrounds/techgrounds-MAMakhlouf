# [Detection, response and analysis]

Routine bij aanvallen

## Key-terms

- IDS:  
  Een IDS (Intrusion Detection System) is een passieve beveiligingsoplossing die inkomende netwerkverkeer analyseert en probeert te detecteren of er zich verdachte activiteiten voordoen. Het doel van een IDS is om bedreigingen te detecteren en te waarschuwen, zodat de beveiligingsbeheerder kan reageren en maatregelen kan nemen om de aanval af te weren. Een IDS kan bijvoorbeeld kijken naar patronen in het netwerkverkeer, zoals pogingen om ongeautoriseerde toegang te krijgen tot bepaalde delen van het netwerk of het versturen van grote hoeveelheden gegevens vanuit een onverwachte locatie.

- IPS:  
  Een IPS (Intrusion Prevention System) is een actieve beveiligingsoplossing die niet alleen bedreigingen detecteert, maar ook actief ingrijpt om deze af te weren. Een IPS kan bijvoorbeeld het netwerkverkeer blokkeren vanaf een bepaalde locatie of naar een bepaald IP-adres, als het als verdacht wordt beschouwd. Hierdoor kan een IPS een aanval afwenden voordat deze schade kan aanrichten.  
  Er zijn twee soorten IPS:
  - Network-based IPS (NIPS)  
    NIPS is een systeem dat zich tussen de router en het netwerk bevindt en het verkeer analyseert terwijl het door het netwerk stroomt.
  - Host-based IPS (HIPS).  
    HIPS is een softwareoplossing die op een specifieke host draait en het verkeer op die host analyseert.

In tegenstelling tot een IDS is een IPS actiever en kan het meer risico's verminderen, maar kan het ook legitiem verkeer blokkeren als het ten onrechte als bedreigend wordt beschouwd. Daarom is het belangrijk om een IPS zorgvuldig te configureren en te testen voordat het in een productieomgeving wordt ingezet.

- Hack response strategies:  
   Hack response strategies zijn methoden en procedures die organisaties gebruiken om te reageren op een hack of een cyberaanval. Deze strategieën zijn ontworpen om de omvang van de aanval te minimaliseren, de schade te beperken en de getroffen systemen te herstellen.  
  Hier zijn enkele van de belangrijkste hack response strategies:

1. Incident Response Plan (IRP): Het opstellen van een IRP helpt organisaties om snel en effectief te reageren op cyberaanvallen. Het omvat processen en procedures voor het detecteren, analyseren, rapporteren en herstellen van de aanval.

2. Beveiligingsteams: Organisaties moeten beveiligingsteams hebben die 24/7 beschikbaar zijn om cyberaanvallen te detecteren en te reageren. Het team moet bestaan uit ervaren professionals die gespecialiseerd zijn in het identificeren en aanpakken van beveiligingsrisico's.

3. Backup en recovery: Organisaties moeten regelmatig back-ups maken van hun gegevens en systemen om snel te kunnen herstellen in geval van een hack. Er moet ook een herstelplan zijn om de systemen snel weer online te krijgen.

4. Communicatie: Het is belangrijk om tijdig en transparant te communiceren met alle belanghebbenden, zoals medewerkers, klanten en de media, om hen op de hoogte te houden van de situatie en de maatregelen die worden genomen.

5. Preventie: Hoewel het onmogelijk is om 100% beveiligd te zijn tegen cyberaanvallen, is het belangrijk om preventieve maatregelen te nemen om het risico op een aanval te minimaliseren. Dit omvat onder meer het up-to-date houden van software, het implementeren van sterke wachtwoorden en het regelmatig trainen van medewerkers over beveiligingsrisico's.

- System hardening concept:  
  Het concept van systems hardening, ook wel systeemverharding genoemd, verwijst naar het proces van het verharden of beveiligen van computersystemen om ze minder kwetsbaar te maken voor aanvallen. Het omvat het implementeren van beveiligingsmaatregelen en -procedures om de kans op inbreuken en kwetsbaarheden te verminderen.  
  Systeemverharding kan worden bereikt door het volgen van best practices voor beveiliging, zoals het up-to-date houden van software en patches, het instellen van sterke wachtwoorden, het implementeren van firewalls en het beperken van de toegang tot gevoelige gegevens. Door deze maatregelen te implementeren, wordt de aanvalsvector van potentiële aanvallers verkleind en wordt het moeilijker om kwetsbaarheden te vinden en uit te buiten.  
  Het doel van systeemverharding is om de beschikbaarheid, integriteit en vertrouwelijkheid van gegevens te waarborgen en de kans op gegevensdiefstal, verlies en schade te verminderen. Het is een belangrijk onderdeel van een algehele beveiligingsstrategie en kan helpen om de risico's van cyberaanvallen te verminderen.

- Disaster recovery options:  
  Het is belangrijk dat organisaties zorgvuldig hun behoeften op het gebied van rampenherstel overwegen en een oplossing selecteren die het juiste niveau van bescherming biedt voor hun systemen en gegevens.
  Er zijn verschillende soorten opties voor disaster recovery (rampenherstel) die organisaties kunnen gebruiken om hun systemen en gegevens te beschermen in geval van een ramp. Hier zijn enkele van de meest voorkomende soorten:

1. Backup en Restore: Dit houdt in dat regelmatig back-ups van gegevens en applicaties worden gemaakt en deze worden hersteld naar hun oorspronkelijke staat in geval van een ramp. Deze aanpak kan tijdrovend zijn, maar is over het algemeen kosteneffectief en betrouwbaar.

2. Cloud-based Disaster Recovery: Cloud-gebaseerd disaster recovery omvat het repliceren van gegevens en applicaties naar een cloud-gebaseerd platform, dat kan worden gebruikt om services te herstellen in geval van een ramp. Deze aanpak is vaak sneller en flexibeler dan traditionele backup- en restore-methoden, maar kan duurder zijn.

3. Hot Site: Een hot site is een volledig operationele duplicaat van de primaire site van een organisatie, compleet met hardware, software en gegevens. Deze aanpak kan duur zijn, maar biedt snelle recovery en minimale dataverlies.

4. Cold Site: Een cold site is een back-up locatie die de nodige infrastructuur heeft om gegevens en applicaties te herstellen, maar niet dezelfde operationele gereedheid heeft als een hot site. Deze aanpak is minder duur, maar het kan langer duren om services te herstellen.

5. Hybride: Een hybride disaster recovery aanpak combineert meerdere soorten disaster recovery oplossingen om een op maat gemaakte oplossing te creëren die voldoet aan de specifieke behoeften van een organisatie. Deze aanpak kan een balans bieden tussen kosteneffectiviteit en operationele gereedheid.

## Opdracht

### Gebruikte bronnen

[IDS/IPS Wat en hoe](https://www.juniper.net/nl/nl/research-topics/what-is-ids-ips.html)

### Ervaren problemen

[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat

- De RPO (Recovery Point Objective) van een systeem wordt gedefinieerd als de maximale hoeveelheid gegevensverlies die een organisatie kan tolereren na een verstoring. Met andere woorden, het vertegenwoordigt het tijdstip waarnaar gegevens kunnen worden hersteld na een storing.  
  In dit geval maakt het bedrijf dagelijkse back-ups van hun database, wat betekent dat de maximale hoeveelheid gegevensverlies die ze kunnen tolereren 1 dag aan gegevens is.  
  Als er een storing optreedt, wordt de meest recente beschikbare back-up gebruikt om de database te herstellen, wat betekent dat de database wordt hersteld naar de staat waarin deze zich bevond op het moment van de laatste back-up.  
  Aangezien de back-ups dagelijks worden gemaakt, is de RPO van de database 24 uur, wat de maximale hoeveelheid gegevensverlies is die het bedrijf kan tolereren.

- De RTO (Recovery Time Objective) van een systeem is de maximale hoeveelheid tijd die is toegestaan om het systeem te herstellen na een storing.  
  Met andere woorden, het vertegenwoordigt de tijd die nodig is om het systeem weer operationeel te maken na een storing.  
  In dit geval is een automatische failover naar een backup webserver geconfigureerd voor een website. Het proces om de backup webserver op te starten en de nieuwste versie van de website van GitHub op te halen duurt ongeveer 8 minuten.  
  Daarom is de RTO van de website gelijk aan 8 minuten, omdat dit de maximale hoeveelheid tijd is die is toegestaan om de website te herstellen na een storing.
