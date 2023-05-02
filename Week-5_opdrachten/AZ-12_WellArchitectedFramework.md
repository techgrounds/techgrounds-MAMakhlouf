# Well-Architected Framework
[Geef een korte beschrijving van het onderwerp]

## Key-terms
- CROPS:
  + Cost optimization:  
  When you design a cloud solution, focus on generating incremental value early. Apply the principles of Build-Measure-Learn to accelerate your time to market while avoiding capital-intensive solutions. See What is the build-measure-learn feedback loop.

  + Reliability:  
    A reliable workload is both resilient and available. Resiliency is the ability of the system to recover from failures and continue to function. The goal of resiliency is to return the application to a fully functioning state after a failure occurs. Availability is whether your users can access your workload when they need to.  

  + Operational excellence:  
  Operational excellence covers the operations and processes that keep an application running in production. Deployments must be reliable and predictable. Automate deployments to reduce the chance of human error. Fast and routine deployment processes don't slow down the release of new features or bug fixes. Equally important, you must be able to quickly roll back or roll forward if an update has problems.  

  + Performance efficiency:  
  Performance efficiency is the ability of your workload to scale to meet the demands placed on it by users in an efficient manner. The main ways to achieve performance efficiency include using scaling appropriately and implementing PaaS offerings that have scaling built in. 

  + Security:  
  Think about security throughout the entire lifecycle of an application, from design and implementation to deployment and operations. The Azure platform provides protections against various threats, such as network intrusion and DDoS attacks. You still need to build security into your application and into your DevOps processes.

## Opdracht
 
De Cloud Providers hebben er baat bij dat hun klanten goede, veilige applicaties op de
infrastructuur van de provider draaien. Om klanten een leidraad te geven hoe een goede,
veilige applicatie eruit ziet is het Well-Architected Framework in het leven geroepen.
Het Well-Architected Framework van Azure en AWS lijken veel op elkaar. Ze zijn gebaseerd
op bijna dezelfde ‘pilaren’, namelijk:
- Reliability
- Security
- Cost Optimization
- Operational Excellence
- Performance Efficiency  

Een ezelsbruggetje om deze pilaren te kunnen onthouden is ook wel CROPS.
Elke pilaar gaat in op een aspect van je applicatie, en hoe de Cloud kan helpen deze te
optimaliseren.  
Jij, als cloud engineer, moet met deze Well-Architected Framework een applicatie kunnen
bouwen die optimaal gebruik maakt van de mogelijkheden in de Cloud.  

Bestudeer:
- Well-Architected Framework van Azure
- Hoe je elke pilaar kan implementeren met cloud-diensten
### Gebruikte bronnen
[Microsoft Azure Well-Architected Framework](https://learn.microsoft.com/en-us/azure/well-architected/)  
[Architecting for Application Requirements](https://www.youtube.com/watch?v=lQlHWacM1N0)

### Ervaren uitdagingen

### Resultaat
### Cost optimization principles:  
Business goals and the return on investment (ROI) drive a cost-effective workload while you keep to a given budget. The principles of cost optimization are important considerations that help you achieve both business objectives and cost justification. 

The following design principles provide:

- Context for questions.
- Why a certain aspect is important.
- How an aspect applies to cost optimization.  

Use these critical design principles as lenses to assess the cost optimization of an application deployed on Azure. These lenses provide a framework for the application assessment questions.

+ Choose the correct resources:  
Choose rerources that align with businnes goals and can handle your workload performance.  
When onboarding new workloads, explore the possibility of modernizaton and cloud native offerings where possible. Its typically more cost-effective to use platform as a service (PaaS) or software as a service (SaaS), as supposed to infrastructure as a service (IaaS).  
An inapproptiate or misconfigured service can affect cost. For example, building a multi-region service when the service levels don't require high-availability or geo-redundancy increases  cost without any reasonable business justification.  

+ Set up budgets and maintain cost constrains: 

  Every design choice hast cost implications. Consider the budget constraints set by the company before choosing:  

    - An architectural pattern.
    - The Azure service.
    - A price model for the servive.   
    
    As a part of design, identify acceptable boundaries on:  

    - Scale.
    - Redundancy.
    - Performance against cost.  

    After estimating the initial cost, set budgets and alerts at different scopes to measure the cost. One cost driver can be unrestricted resources. These resources typically need to scale and consume more cost to meet demand. 

+ Dynamically allocate and deallocate resources:  

  To match performance needs, dynamically allocate and deallocate recources.  

  Identify idle or underutilized resources through Azure Advisor or other tools, and:  

  + Reconfigure.  
  + Consolidate (or).
  + Shut down.   

+ Optimize workloads, aim for scalable costs:  
  
  A key benefit of the cloud is the ability to scale dynamically. The workload cost should scale linearly with demand. You can save cost through automatic scaling.  

  Recommendations:  
    - Consider usage metrics and performance to determine the number of instances.
    - Choose smaller instances for a highly variable workload.
    - Scale out,  rather than up, to get thye required level of performance. This choice enables you to make your cost calculations and estimates granular.  

    The cost managment procces should be:  

    - Rigorous.
    - Iterative.
    - A key principle of responsible cloud optimization.  

+ Continously monitor and optimize cost managment:  

  To provision resources dynamically and to scale with demand:  
  - Conduct regular cost reviews.
  - Measure capacity needs.
  - Forecast capacity needs.