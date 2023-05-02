# Cost optimization principles:  
Business goals and the return on investment (ROI) drive a cost-effective workload while you keep to a given budget. The principles of cost optimization are important considerations that help you achieve both business objectives and cost justification. 

The following design principles provide:

- Context for questions.
- Why a certain aspect is important.
- How an aspect applies to cost optimization.  

Use these critical design principles as lenses to assess the cost optimization of an application deployed on Azure. These lenses provide a framework for the application assessment questions.

+ ## Choose the correct resources:  
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

+ ## Dynamically allocate and deallocate resources:  

  To match performance needs, dynamically allocate and deallocate recources.  

  Identify idle or underutilized resources through Azure Advisor or other tools, and:  

  + Reconfigure.  
  + Consolidate (or).
  + Shut down.   

+ ## Optimize workloads, aim for scalable costs:  
  
  A key benefit of the cloud is the ability to scale dynamically. The workload cost should scale linearly with demand. You can save cost through automatic scaling.  

  Recommendations:  
    - Consider usage metrics and performance to determine the number of instances.
    - Choose smaller instances for a highly variable workload.
    - Scale out,  rather than up, to get thye required level of performance. This choice enables you to make your cost calculations and estimates granular.  

    The cost managment procces should be:  

    - Rigorous.
    - Iterative.
    - A key principle of responsible cloud optimization.  

+ ## Continously monitor and optimize cost managment:  

  To provision resources dynamically and to scale with demand:  
  - Conduct regular cost reviews.
  - Measure capacity needs.
  - Forecast capacity needs.  

# Cost optimization design model and architecture.

## Cost model  

- ### Capture clear requirements:  

  Gather detailed information about the business workflow, regulatory, security and availability.  

- ### Estimate the initial cost:  

   Use tools sucha as Azure pricing calculator to asses cost of the services you plan to use in the workload. Use Azure Migrate and Microsoft Azure Total Cost of Ownership (TCO) Calculator for migration projects. Accurately teflect the cost associated with the right storage type. Add hidden costs, such as networking cost for large data download.  

- ### Define policies for the cost constraints defined by the organization:  

  Understand the constraints and define aceptable boundaries for quality pillars of scale, availability and security.  

- ### Identify shared assets:  

  Evaluate the business areas where you can use shared resources. Review the billing meters build chargeback reports per consumer to identify metered costs for shared cloud services.  

- ### Plan a governance strategy:  

  Plan fot cost controls through Azure Policy. Use resource tags so that custom cost report can be created. Define budgets and alerts to send notifications when certain thresholds are reached.  

## Architecture  

- ### Check the costs of resources in various Azure geographic regions:  

  Check your egress and ingress cost, within regions and across regions. Only deploy to multiple regions if your service levels require it for either availability or geo-distribution.  

- ## choose a subscription thast is appropriate for the workload.  

  Azure Dev/Test subscription typers are suitable for experimental or non-production workloads and have lower prices on some Azure services such as specific VM sizes. If you can commit to one or three year, consider subscriptions and offer types that support Azure Reservations or saving plans.  

- ## Choose the right resources to handle the performance.  

  Understand the usage meters and the number for meters for each resource in the workload. Consider tradeoffs over time. For example, cheaper virtual machines may initially indicate a lower cost but can be more expensice over time to maintain a certain performance level. Be clear about the billing model of third-party services.  

- ## Compare consumption-based pricing with pre-provisioned cost.  

  Establish baseline cost by considering the peaks and the frequency of peaks when analyzing performance.  

- ## Use proof-of-concept deployments.  

  The Azure Architecture Center has many reference architectures and implementations that can serve as a starting point. The Azure Tech Community has architecture and service forums.  

- ## Choose managed services when possible.  

  With PaaS and SaaS options, the cost of running and maintaining the infrastructure is included in the service price. 