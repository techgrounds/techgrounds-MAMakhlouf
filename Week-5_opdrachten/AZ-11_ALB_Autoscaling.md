# Azure Load Balancer (ALB) &amp; Auto
Scaling  

Het aanmaken van VM Scale Sets en het testen van de scaling regels.

## Key-terms
[Schrijf hier een lijst met belangrijke termen met eventueel een korte uitleg.]

## Opdracht
### Gebruikte bronnen
[Plaats hier de bronnen die je hebt gebruikt.]

### Ervaren problemen
[Geef een korte beschrijving van de problemen waar je tegenaan bent gelopen met je gevonden oplossing.]

### Resultaat
- VM Scale Set aangemaakt volgend beschreven eisen.
- Load balancer en NIC gekoppeld aan VM Scale Set.
- Toegang tot HTTP server met publieke IP van Load balancer. 
- Stress test via linux CLI ingesteld en geactiveerd op 80% voor 500 seconden lang.
- Scale set maakt na/tijdens stress test meerdere instances/VMs aan om de load te scalen.
![Scaling](/00_includes/Week-5-img/AZ-11_instances3-4.png)
![Scaled](/00_includes/Week-5-img/AZ-11_instances4.png)