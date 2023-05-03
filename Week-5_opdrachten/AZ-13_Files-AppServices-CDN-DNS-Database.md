# Files,AppServices,CDN,DNS, Database  


Onderwerpen die je onder de kop “Bestudeer” vindt verwachten wij dat je alleen op een
theoretisch niveau hoeft te kennen. Van onderwerpen onder de kop “Opdrachten” moet je
ook praktische ervaring opbouwen.
Handige vragen die je in gedachten kan (/moet) houden tijdens je onderzoek naar de
onderwerpen:  
- Waar is X voor?
- Hoe past X / vervangt X in een on-premises setting?
- Hoe kan ik X combineren met andere diensten?
- Wat is het verschil tussen X en andere gelijksoortige diensten?  

Een handige lijst van taken die je praktisch moet kunnen:  
- Waar kan ik deze dienst vinden in de console?
- Hoe zet ik deze dienst aan?
- Hoe kan ik deze dienst koppelen aan andere resources?

## Key-terms  

### App Service:  

Azure App Service enables you to build and host web apps, mobile back ends and RESTful API's in the programming language of your choice without managing infrastructure. It offers auto-scaling and high availability, supports both Windows and Linux, and enables automated deployments from GitHub, Azure DevOps, or any Git repo.
Azure App Services is a fully managed platform as a service (PaaS) for hosting web applications.  

App Service adds the power of Microsoft Azure to your application, such as security, load balancing, autoscaling and automated managment. Additionally you can take advantage of its DevOps capabilities, such as continuous deployment from Azure DevOps, GitHub, Docker Hub, and other sources, package managment, staging enviroments, custom domain and TLS/SSl certificates.  

With App Service, you pay for the Azure compute resources you use. The compute resources you use are determined by the App Service plan that you run your apps on.  

### Content Delivery Network (CDN)  

A content delivery network (CDN) is a distributed network of servers that can efficiently deliver web content to users. A CDN store cached content on edge servers in point-of-presence (POP) locations that are close to end users, to minimize latency.  

Azure CDN offers developers a global solution for rapidly delivering high-bandwith content to users by caching their content at a strategically placed physical nodes across the world. Azure CDN  can also accelerate dynamic content, wich can't get cached, by using various network optimizations using CDN POP's. For example, route optimization to bypass Border Gateway Protocol (BGP).  

The benefits of using Azure CDN to deliver web site assets include:  

- Better performance and improved user experience for end users, especially when using applications where multiple round-trips request required by end users to load contents.  
- Large scaling to better handle instantaneous high loads, such as the start of a product launch event.  
- Distribution of user requests and serving of content directly from edge servers so that less traffic gets sent to the origin server.  

How it works:  
![CDN overvieuw](/00_includes/Week-5-img/AZ-13_cdn-overview.png)  
1. A user (Alice) requests a file (also called an asset) by using a URL with a special domain name, such as <endpoint name>.azureedge.net. This name can be an endpoint hostname or a custom domain. The DNS routes the request to the best performing POP location, which is usually the POP that is geographically closest to the user.

2. If no edge servers in the POP have the file in their cache, the POP requests the file from the origin server. The origin server can be an Azure Web App, Azure Cloud Service, Azure Storage account, or any publicly accessible web server.

3. The origin server returns the file to an edge server in the POP.

4. An edge server in the POP caches the file and returns the file to the original requestor (Alice). The file remains cached on the edge server in the POP until the time-to-live (TTL) specified by its HTTP headers expires. If the origin server didn't specify a TTL, the default TTL is seven days.

5. More users can then request the same file by using the same URL that Alice used, and gets directed to the same POP.

6. If the TTL for the file hasn't expired, the POP edge server returns the file directly from the cache. This process results in a faster, more responsive user experience.  

### Azure DNS  

Azure DNS is a hosting service for DNS domains that provides name resolution by using Microsoft Azure infrastructure. By hosting your domains in Azure, you can manage your DNS records by using the same credentials, API's, tools and billing as your other Azure services.  

You can't use Azure DNS to buy a domain name. For an annual fee you can buy a domain name by using App Service domains or a third-party domain name registrar. Your domains then can be hosted in Azure DNS for record managment.  

The following features are included with Azure DNS.  

- Reliability and performance  
  DNS domains in Azure DNS are hosted on Azure's global network of DNS name servers. Azure DNS uses anycast networking. Each DNS query is answered by the closest available DNS server to provide fast performance and high availability for your domain.  

- Security  
  Azure DNS is based on Azure Resource Manager, which provides features such as:  
   + Azure rol-based access control (Azure RBAC) to control who has access to specific actions for your organization.  
   + Activity logs to monitor how a user in your organization midified a resource. Locking prevents other users in your organization from accidentaly deleting or modifying critical resources.  
   + Resource locking to lock a subscription, resource group, or resource. Locking prevents other users in your organization from accidentally deleting or modifying critical resources.  

- DNSSEC  

Azure DNS does not currently sipport DNSSEC. In most cases, you can reduce the need for DNSSEC by consistently using HRRPS/TLS in your applications. If DNSSEC is a critical requirement for your DNS zones, you can host these zones with third-party DNS hosting providers. 

- Ease of use   

Azure DNS can manage DNS records for your Azure services and provide DNS for your external resources as well. Azure DNS is integrated in the Azure portal and uses the same credentials, support contract, and billing as your other Azure services.  

DNS billing is based on the number of DNS zones hosted in Azure and on the number of DNS queries received.  

Your domains and records can be managed by using the Azure portal, Azure PowerShell cmdlets, and the cross-platform Azure CLI. Applications that require automated DNS management can integrate with the service by using the REST API abd SDK's.  

- Customizable virtual networks with private domains  

Azure DNS also supports private DNS domains. This feature allows you to use your own custom domain names in your private virtual networks rather than the Azure-provided names available today.  

- Alias records  

Azure DNS supports alias record sets. You can use an alias record set to refer to an Azure resource, such as an Azure public IP address, an Azure Traffic Manager profile, or an Azure Content Delivery Network (CDN) endpoint. If the IP address of the underlying resource changes, the alias record set points to the service instance, and the service instance is associated with an IP address.  

Also, you can point your apex or naked domain to a Traffic Manager profile or CDN enpoint using an alias record. An example is contoso.com

## Opdracht  

Bestudeer:
- App Service / Elastic Beanstalk
- Content Delivery Network (CDN) / CloudFront
- Azure DNS / Route53  

Benodigdheden:  
- Je Azure omgeving / AWS omgeving  

Opdracht:  
- Azure Files / EFS
- Azure Database (+ managed instance) / RDS, Aurora
### Gebruikte bronnen
[Azure App Service Documentation](https://learn.microsoft.com/en-us/azure/app-service/)  
[Azure CDN Documentation](https://learn.microsoft.com/en-us/azure/cdn/cdn-overview)  
[Azure DNS Documentation](https://learn.microsoft.com/en-us/azure/dns/dns-overview)


### Ervaren uitdagingen


### Resultaat

