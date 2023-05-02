# Reliability Design Principles  

Building a reliable application in the cloud is different from traditional application development. Historically, you may have purchased levels of redundant higher-end hardware to minimize the chance of an entire application platform failing.  

In the cloud, we acknowledge that failures happen. Instead of trying to prevent failures altogheter, the goal is to minimize the effects of a single failing component.  

To assess your workload using the tenets found in the Azure Well-Architected Framework, reference the Microsoft Azure Well-Architected Review.  

The following desigg principles provide:   

- Context for questions.  
- why a certain aspect is important.  
- How an aspect is applicable to Reliability.  

These critical design principles are used as lenses to ases the Reliability of an application deployed on Azure. these lenses provide a framework for the application assessment questions.  

## Design for businnes requirements  

Reliability is a subjective concept. For an application to be appropriately reliable, it must reflect the business requirements surrounding it.  

For example, a mission-critical application with a 99,999% service level agreement (SLA) requires a higher level of reliability than another application with an SLA of 95%.  

Cost implications are inevitable when introducing greater reliability and high availability. this trade-off should be carfully considerd.  

## Design for failure  

Failure is impossible to avoud in a highly distributed and multi-tentant enviroment like Azure.  

By anticipating failures, from individual components to entire Azure regions, you can develop a solution in a resilient way to increase reliability.  

## Observe application health  

Before mitigating issues that impact application reliability, you must first detect these issues.  

By monitoring the operation of an application relative to a healthy state, you can detect and predict reliability issues.  

Monitoring allows you to take swift and remedial action.  

## Drive automation  

One of the leading causes of application downtime is humen error due to the deployment of insufficiently tested software or through misconfiguration.  

To minimize the possibility and consequence of human errors, it's vital to strive for automation in all aspects of a cloud solution.  

Automation improves:  

- Reliability.  
- Automated testing.
- Deployment.  
- Managment.  

## Design for self-healing  

Self-healing describes the ability of a system to deal with failures automatically. Handling failures happens through pre-defined remediation protocols. these protocols connect to failure modes within the solution.  

## Design for scale-out  

Scale-out is a concept that focuses on the ability of a system to respond to demand through horizontal growth. As traffic grows, more resource units are addes in parallel, instead of increasing the size of the existing resources.  

Through scale units, a system can handle expected and unexpected traffic increases, essential to overall reliability.  

Scale units further reduce the effects of a single resource failure.  


# Design for reliability  

Reliable applications should maintain a pre-defined percentage of uptime (availability). They should also balance between high resiliency, low latency, and cost (High Availability). Just as important, applications should be able to recover from failures (resiliency).

## Checklist  
How have you designed your applications with reliability in mind?   
  
☑️ Define availability and recovery targets to meet business requirements.  
☑️ Build resiliency and availability into your apps by gathering requirements.  
☑️ Ensure that application and data platforms meet your reliability requirements.  
☑️ Configure connection paths to promote availability.  
☑️ Use Availability Zones where applicable to improve reliability and optimize costs.  
☑️ Ensure that your application architecture is resilient to failures.  
☑️Know what happens if the requirements of Service Level Agreements are not met.  
☑️ Identify possible failure points in the system to build resiliency.  
☑️ Ensure that applications can operate in the absence of their dependencies.  
  
## Azure services
- [Azure Front Door](https://learn.microsoft.com/en-us/azure/frontdoor/front-door-overview)
- [Azure Traffic Manager](https://learn.microsoft.com/en-us/azure/traffic-manager/traffic-manager-overview)
- [Azure Load Balancer](https://learn.microsoft.com/en-us/azure/load-balancer/load-balancer-overview)
- [Azure NAT Gateway](https://learn.microsoft.com/en-us/azure/virtual-network/nat-gateway/nat-overview)
- [Service Fabric](https://learn.microsoft.com/en-us/azure/service-fabric/service-fabric-overview)
- [Kubernetes Service (AKS)](https://learn.microsoft.com/en-us/azure/aks/intro-kubernetes)
- [Azure Site Recovery](https://learn.microsoft.com/en-us/azure/site-recovery/site-recovery-overview)