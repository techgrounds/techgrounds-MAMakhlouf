# Symmetric encryption
Kennismaking met symmetrische codering

## Key-terms

- Cipher:  
  Een Cipher is een algoritme voor het versleutelen en ontsleutelen van gegevens. Symmetrische sleutelcodering, ook wel geheime sleutelcodering genoemd, is afhankelijk van het gebruik van cijfers, die symmetrisch werken.  

- AES  
de Advanced Encryption Standard is een blokcijfer-algoritme met symmetrische sleutels dat in 2001 werd geselecteerd door het National Institute of Standards and Technology (NIST). Het werd geselecteerd voor het coderen van gegevens. Het wordt over de hele wereld veel gebruikt. De Advanced Encryption Standard heeft de Data Encryption Standard (DES) vervangen.


## Opdracht

### Gebruikte bronnen

[AES Generator](https://www.devglan.com/online-tools/aes-encryption-decryption)
[]()

### Ervaren uitdagingen

De uitdaging was een creatieve manier bedenken om mijn geheime bericht en sleutel over te dragen aan teamgenoot zonder dat deze werd onderschept. Ik heb voor een simpele manier gekozen omdat symmetrische codering tekortkomingen heeft die ik niet kan tackelen.

### Resultaat

- Een andere historische cipher naast de Caesar cipher is de Vigenère cipher, ook wel bekend als de polyalfabetische cipher. Deze cipher is in de 16e eeuw uitgevonden door de Franse cryptograaf Blaise de Vigenère en werd gebruikt tot in de 19e eeuw. De Vigenère cipher werkt door gebruik te maken van een reeks van verschillende Caesar ciphers, waarbij elke letter in de oorspronkelijke tekst wordt gecodeerd met behulp van een andere Caesar cipher, afhankelijk van de positie van de letter in de sleutel. Dit maakt het decoderen van de cipher veel moeilijker dan het decoderen van de eenvoudige Caesar cipher.

- Twee voorbeelden van digitale ciphers die vandaag de dag worden gebruikt zijn:

  - AES (Advanced Encryption Standard): AES is een symmetrische encryptie-algoritme en is momenteel een van de meest gebruikte algoritmen voor het versleutelen van digitale gegevens. Het is een block cipher algoritme en kan worden gebruikt met verschillende sleutellengtes, waaronder 128-bits, 192-bits en 256-bits.

  - RSA (Rivest-Shamir-Adleman): RSA is een asymmetrisch encryptie-algoritme en wordt vaak gebruikt voor het beveiligen van digitale communicatie, zoals online transacties. Het maakt gebruik van een openbare sleutel en een privésleutel om de gegevens te versleutelen en te ontcijferen. RSA is gebaseerd op het feit dat het erg moeilijk is om de factoren van een groot getal te vinden, waardoor het veilig is voor digitale communicatie.

![message](/00_includes/Week-3-img/SEC-04_mssg.png)
![Key](/00_includes/Week-3-img/SEC-04_key.png)

- Symmetrische encryptie is een veelgebruikte methode voor het beveiligen van communicatie vanwege de efficiëntie en snelheid. Er zijn echter enkele beperkingen bij het gebruik van symmetrische encryptie voor het verzenden van berichten, waaronder:

  - Sleuteldistributie:  
    Het voornaamste nadeel van symmetrische encryptie is het probleem van sleuteldistributie. Aangezien dezelfde sleutel wordt gebruikt voor zowel encryptie als decryptie, moet de sleutel veilig worden gedeeld tussen de verzender en de ontvanger. Als een aanvaller de sleutel onderschept, kan deze de boodschap decoderen en daarmee de vertrouwelijkheid ervan in gevaar brengen.

  - Sleutelbeheer:  
    Symmetrische encryptie vereist het beheer van veilige opslag en distributie van sleutels om ervoor te zorgen dat alleen geautoriseerde partijen er toegang toe hebben. Dit kan moeilijker te beheren worden naarmate het aantal gebruikers en systemen toeneemt.

  - Beperkte schaalbaarheid:  
    Symmetrische encryptie is niet schaalbaar voor grootschalige communicatienetwerken. Naarmate het aantal gebruikers en systemen toeneemt, neemt ook het aantal te beheren en uit te wisselen sleutels toe, wat het moeilijker maakt om de beveiliging van het systeem te handhaven.

  - Gebrek aan non-repudiatie:  
    Symmetrische encryptie biedt geen non-repudiatie, wat betekent dat er geen manier is om de identiteit van de verzender of ontvanger van een bericht te verifiëren. Dit kan het moeilijk maken om te bewijzen dat een bericht is verzonden of ontvangen door een specifieke partij in geval van een geschil of juridische actie.

  - Kwetsbaarheid voor cryptanalyse:  
    Symmetrische encryptie-algoritmen kunnen kwetsbaar zijn voor cryptanalyse, waarbij een aanvaller wiskundige technieken kan gebruiken om de encryptie te breken en het oorspronkelijke bericht te herstellen.

Over het algemeen is symmetrische encryptie een efficiënte en snelle methode voor het beveiligen van communicatie, maar het heeft zijn beperkingen en is mogelijk niet geschikt voor alle soorten communicatie en beveiligingsvereisten.
