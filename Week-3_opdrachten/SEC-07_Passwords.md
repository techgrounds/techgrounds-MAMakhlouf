# Passwords

## Key-terms
- Hashing:  
Hashing is een proces waarbij een algoritme wordt gebruikt om een invoer van willekeurige grootte om te zetten in een vaste lengte uitvoer. Het resultaat van dit proces wordt de "hash" genoemd. Hashing wordt vaak gebruikt om wachtwoorden veilig op te slaan, omdat het moeilijk is om de oorspronkelijke invoer te achterhalen op basis van de hash.  

- Rainbow Table:  
  Een Rainbow Table is een aanvalstechniek die vaak wordt gebruikt om gehashte wachtwoorden te kraken. Het idee achter een Rainbow Table is om vooraf berekende hash-waarden op te slaan, waardoor het proces van het kraken van een gehasht wachtwoord kan worden versneld.  

  Hoewel een Rainbow Table het kraken van gehashte wachtwoorden kan versnellen, zijn er ook enkele beperkingen aan deze aanvalstechniek. Ten eerste moet de aanvaller vooraf berekende hash-waarden opslaan voor elke mogelijke combinatie van wachtwoord en hash-algoritme. Dit kan zeer tijdrovend en kostbaar zijn. Bovendien kunnen moderne beveiligingsmaatregelen zoals het toevoegen van een salt aan het gehashte wachtwoord, de effectiviteit van Rainbow Tables aanzienlijk verminderen.  

- Salting:  
Salting is een techniek die wordt gebruikt om het kraken van wachtwoorden moeilijker te maken. Het houdt in dat er extra willekeurige gegevens worden toegevoegd aan het wachtwoord voordat het wordt gehasht, waardoor het moeilijker wordt om het oorspronkelijke wachtwoord te achterhalen door middel van een Rainbow Table of een andere aanvalsmethode.


## Opdracht
- Find out what hashing is and why it is preferred over symmetric encryption for storing passwords. 

- Find out how a Rainbow Table can be used to crack hashed passwords.  

- Below are two MD5 password hashes. One is a weak password, the other is a string of 16 randomly generated characters. Try to look up both hashes in a Rainbow Table.  
03F6D7D1D9AAE7160C05F71CE485AD31  
03D086C9B98F90D628F2D1BD84CFA6CA  

- Create a new user in Linux with the password 12345. Look up the hash in a Rainbow Table.  

- Despite the bad password, and the fact that Linux uses common hashing algorithms, you won’t get a match in the Rainbow Table. This is because the password is salted.
To understand how salting works, find a peer who has the same password in /etc/shadow, and compare hashes.
### Gebruikte bronnen
[Hashing passwords and adding salt explained](https://crackstation.net/hashing-security.htm)

### Ervaren uitdagingen
Gelukkig was deze opdracht makkelijk uit te voeren. De uitdaging zit in het begrip van deze materie waarvan ik de basis nu bezit. 

### Resultaat
- Hashing wordt verkozen boven symmetrische encryptie voor het opslaan van wachtwoorden omdat het niet omkeerbaar is. Met andere woorden, het is moeilijk om het oorspronkelijke wachtwoord te achterhalen op basis van de hash. Dit maakt het moeilijker voor aanvallers om wachtwoorden te stelen, zelfs als ze toegang hebben tot de database waarin de hashes zijn opgeslagen.  
Aan de andere kant is symmetrische encryptie omkeerbaar en kan het oorspronkelijke wachtwoord worden hersteld als een aanvaller toegang krijgt tot de sleutel die wordt gebruikt om de gegevens te versleutelen. Dit maakt het minder veilig voor het opslaan van wachtwoorden.  

-  Rainbow Table
Hoe het werkt:  
   1. Een aanvaller verzamelt een grote lijst met potentiële wachtwoorden (bijvoorbeeld van een database met veelgebruikte wachtwoorden).  

    2. Voor elk wachtwoord in de lijst wordt een hash-waarde berekend.

    3. De hash-waarden worden opgeslagen in een Rainbow Table, samen met het oorspronkelijke wachtwoord dat werd gebruikt om de hash te maken.

    4. Wanneer een aanvaller een gehasht wachtwoord wil kraken, zoekt hij in de Rainbow Table naar de overeenkomstige hash-waarde. Als de hash-waarde overeenkomt met een hash in de Rainbow Table, kan de aanvaller het bijbehorende wachtwoord vinden en het gehashte wachtwoord kraken.

- Results:
  + 03F6D7D1D9AAE7160C05F71CE485AD31 
    + Type:md5
    + Result: welldone!
  + 03D086C9B98F90D628F2D1BD84CFA6CA
    + Not found  

![newuser](/00_includes/Week-3-img/SEC-08_newuser.png)
![hashed password](/00_includes/Week-3-img/SEC-08_Hashes12345.png)
![hashed in linux](/00_includes/Week-3-img/SEC-08_hashedlinux.png)