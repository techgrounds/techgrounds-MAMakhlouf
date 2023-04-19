# Asymmetric Encryption
Kennismaking met Asymmetrische codering.

## Key-terms


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