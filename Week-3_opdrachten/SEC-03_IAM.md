# Identity and Access Managment
[Geef een korte beschrijving van het onderwerp]

## Key-terms 
- Authentication vs Authorization  
authenticatie verifieert identiteit, terwijl autorisatie de toegang tot resources controleert. Het is belangrijk om beide in te stellen om de beveiliging van systemen te waarborgen en gevoelige gegevens te beschermen.  
- MFA  
Multi-factor authentication is a common way to improve security.
It is best practice to follow the principle of least privilege for authorization.  

 
## Opdracht
### Gebruikte bronnen
[ChatGPT: Teach me about MFA/Auth vs Auth ](https://chat.openai.com/)
### Ervaren uitdagingen

### Resultaat
- Auth vs Auth  
  - Authenticatie is het proces van het verifiëren van de identiteit van een gebruiker of systeem. Het is een manier om te bevestigen dat de gebruiker of het systeem is wie ze beweren te zijn. De meest voorkomende vorm van authenticatie is het gebruik van een gebruikersnaam en wachtwoord. Andere vormen van authenticatie zijn biometrische authenticatie (zoals vingerafdruk- of gezichtsherkenning), smartcards en tokens.  
  
  - Autorisatie daarentegen is het proces van het verlenen of weigeren van toegang tot een resource. Nadat een gebruiker of systeem is geauthenticeerd, bepaalt autorisatie welke acties ze mogen uitvoeren. Bijvoorbeeld, een gebruiker die is geauthenticeerd, kan worden geautoriseerd om bepaalde bestanden te bekijken of wijzigingen aan te brengen in een database, terwijl een andere gebruiker alleen gemachtigd is om de bestanden te bekijken maar geen wijzigingen kan aanbrengen.    


- De drie factoren van authenticatie zijn iets wat de gebruiker kent, iets wat de gebruiker bezit en iets wat de gebruiker is.
   
   - Iets wat de gebruiker weet:  
     Dit kan een wachtwoord, een pincode of een antwoord op een geheime vraag zijn.
   
   - Iets wat de gebruiker bezit:  
     Dit kan een mobiele telefoon, een smartcard of een fysieke sleutel zijn.

  - Iets wat de gebruiker is:  
    Dit omvat biometrische gegevens zoals vingerafdrukken, gezichtsherkenning of irisscans.

- Multifactor-authenticatie   
(MFA) is een methode voor authenticatie waarbij de gebruiker twee of meer van de bovengenoemde factoren moet verifiëren om toegang te krijgen tot een systeem of applicatie. Door het gebruik van MFA wordt de beveiliging versterkt, omdat het moeilijker wordt voor een aanvaller om de benodigde factoren te verkrijgen.

  Bijvoorbeeld, als een hacker het wachtwoord van een gebruiker kent, zou deze nog steeds een fysieke sleutel of toegang tot de mobiele telefoon van de gebruiker nodig hebben om toegang te krijgen tot het systeem. Dit maakt het voor een aanvaller veel moeilijker om toegang te krijgen tot een systeem of applicatie, zelfs als ze één factor van authenticatie weten.

- Het principe van minste privilege, ook wel bekend als het principe van minimale autorisatie, is een beveiligingsprincipe dat stelt dat een gebruiker alleen toegang mag hebben tot de middelen en informatie die strikt noodzakelijk zijn om zijn of haar werk uit te voeren. Met andere woorden, gebruikers krijgen alleen toegang tot de middelen en informatie die ze nodig hebben en niet meer dan dat.