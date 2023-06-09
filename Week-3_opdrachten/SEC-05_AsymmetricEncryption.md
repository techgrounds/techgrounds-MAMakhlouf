# Asymmetric Encryption
Kennismaking met Asymmetrische codering.

## Key-terms
- RSA  
RSA (Rivest-Shamir-Adleman) is een algoritme dat door moderne computers wordt gebruikt om berichten te coderen en te decoderen. Het is een asymmetrisch cryptografisch algoritme. Asymmetrisch betekent dat er twee verschillende toetsen zijn. Dit wordt ook wel public key cryptografie genoemd, omdat een van de sleutels aan iedereen kan worden gegeven. De andere sleutel moet privé worden gehouden. Het algoritme is gebaseerd op het feit dat het vinden van de factoren van een groot samengesteld getal moeilijk is: wanneer de factoren priemgetallen zijn, wordt het probleem priemontbinding genoemd. Het is ook een sleutelpaargenerator (openbare en privésleutel).

## Opdracht
### Gebruikte bronnen
[RSA generator](https://www.devglan.com/online-tools/rsa-encryption-decryption)  
[AES generator](https://www.devglan.com/online-tools/aes-encryption-decryption)

### Ervaren uitdagingen
Het was even goed zoeken naar een juiste implementatie in de publieke slack omgeving. Uitendelijk wel een goede manier gevonden om de boodschap geheim te houden.

### Resultaat
1. De geheime boodschap symmetrisch gecodeerd dmv AES generator:  
- AES Decryption:  
   + Text to Encrypt:  
   Wat een gedoe allemaal voor dit ene zinnetje  

   + Secret Key:  
   Sleuteltje123456  

   + Encrypted text:
   cFyF6j0ALgpTFBbbEI92Bfq3u6Dx1SVRRl7yAbrxNdkcZ3ty4qgJhUVnkoRtxyFs  

2. Publieke RSA key van peer opgevraagd om vervolgens met zijn publieke key mijn AES Secret key te coderen.
- RSA Keys: 1024 bit 
  -  Public key used to encrypt AES Key:  
  MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQCDlsBQGiZJg/yGP0OaV8JnSA/UoJzP2OrLgePjRyBn8XUnNZAcqVkmaHhPYPRGjOkqhyK0HHG4c0KzIwX8pom1QTyITUhJrt1H2nmYBMcIuRLQLKD+nO8BfFphxmW3TVP/KquXwSuYv+hbMr6cQNgFX89CMjXfu4bfTVjHUf5TNwIDAQAB  

3. Zie hier de AES Secret key gecodeerd in publieke RSA key omgeving van peer:

  + Encrypted Output (Base64):
eZOcBQfDYAL09QtkMx7B4D0swuQinB5i2lhgBkHxtbJAdbotvvU/4XdXXyIPBIO2qwkqAL5oY2/LIfnOT0zuLH9R9kzCLtANjA175OWOA3Pvk+8LlncWUBwgQ2JD/sz4TBx8JR35pJBcutTXqGaFO8AW8bggmAsk8ZCN2q5gvok=  

 4. Vervolgens heeft peer bovenstaande key ontcijferd en verkreeg de AES Secret key.

  + Decrypted Output:  
  Sleuteltje123456  

  5. Met de AES Secret Key kon peer het originele AES gecodeerd bericht ontcijferen.  
  Op deze manier kon niemand van de publieke slack meekijken wat er gecommuniceerd werd.

  - Het belangrijkste verschil tussen de methode AES als symmetrische codering en RSA als asymmetrische codering is dat symmetrische encryptie dezelfde sleutel gebruikt voor zowel het versleutelen als het ontsleutelen van het bericht. Dit betekent dat als iemand de sleutel kan krijgen, die persoon het bericht kan lezen en wijzigen.  
  In het geval van de methode die hierboven wordt gebruikt, wordt een symmetrische AES-sleutel gebruikt om het bericht te versleutelen, maar deze sleutel wordt versleuteld met behulp van een publieke RSA-sleutel van de ontvanger voordat deze wordt verzonden. Dit betekent dat alleen de ontvanger met zijn of haar privésleutel de AES-sleutel kan decoderen en het bericht kan lezen. Andere personen die toegang hebben tot het openbare Slack-kanaal kunnen het bericht niet lezen, omdat ze niet over de privésleutel van de ontvanger beschikken om de AES-sleutel te decoderen.  
  Kortom, het belangrijkste verschil tussen deze methode en symmetrische encryptie is dat deze methode een extra laag van beveiliging toevoegt door het gebruik van asymmetrische encryptie om de symmetrische sleutel te versleutelen. Dit zorgt ervoor dat alleen de beoogde ontvanger het bericht kan ontcijferen, terwijl de berichten in het openbare Slack-kanaal veilig blijven.