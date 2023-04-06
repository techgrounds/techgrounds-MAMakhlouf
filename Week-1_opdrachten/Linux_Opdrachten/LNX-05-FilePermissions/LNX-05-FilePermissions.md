# [File permissions]

[Het wijzigen en inzien van permissies]

## Key-terms

[-Permission Indicators:  
De permissies zijn onderverdeeld in groepen van drie, en elke positie in de groep geeft een specifieke machtiging aan, in deze volgorde: lezen (r), schrijven (w), uitvoeren (x) −

De eerste drie tekens (2-4) vertegenwoordigen de machtigingen voor de eigenaar van het bestand. Bijvoorbeeld, -rwxr-xr-- geeft aan dat de eigenaar toestemming heeft voor lezen (r), schrijven (w) en uitvoeren (x).

De tweede groep van drie karakters (5-7) bestaat uit de permissies voor de groep waartoe het bestand behoort. Bijvoorbeeld, -rwxr-xr-- geeft aan dat de groep lees- (r) en uitvoerrechten (x) heeft, maar geen schrijfrechten.

De laatste groep van drie tekens (8-10) vertegenwoordigt de machtigingen voor alle anderen. Bijvoorbeeld, -rwxr-xr-- geeft aan dat er alleen-lezen (r) toestemming is.]

## Opdracht

### Gebruikte bronnen

[[chmod calculator](https://www.omnicalculator.com/other/chmod)  
[Permissie uitleg](https://www.tutorialspoint.com/unix/unix-file-permission.htm#:~:text=The%20Permission%20Indicators&text=The%20first%20three%20characters%20(2,to%20which%20the%20file%20belongs)).]

### Ervaren uitdagingen

[Het was een uitdaging om met de command chmod te werken aangezien deze veel toepassingen kent. Hier heb ik een calculator voor gebruikt(zie bron).
Verder was het uitlezen van de permissies ook iets wat ik even moest opzoeken en heb daar een goede uitleg voor gevonden. ]

### Resultaat

[Alle vereiste zijn voldaan. ls -l gebruikt voor de long listing. Permissies ingezien. Bestand omgezet naar executable. Rechten verwijderd. Eigenaar omgezet. Group ownership omgezet]
![afbeelding1](/00_includes/Week-1-img/FilePerm1.png)
![afbeelding2](/00_includes/Week-1-img/FilePerm2.png)
![afbeelding3](/00_includes/Week-1-img/FilePerm3.png)
![afbeelding4](/00_includes/Week-1-img/FilePerm4.png)
