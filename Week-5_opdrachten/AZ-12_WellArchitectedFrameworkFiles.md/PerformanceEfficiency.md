# Performance efficiency principles  

Performance efficiency is the ability of your workload to adjust to changes in demands placed on it by users in an efficient manner. These principles are intended to guide you in your overall strategy for improving performance efficiency.  

## Design for horizontal scaling  

Horizontal scaling allows for elasticity. Instances are added (scale-out) or removed (scale-in) in response to change in load. Scaling out can improve resilliency by building redundancy. Scaling in can help reduce costs by shutting down excess capacity.  

| Approach  |  Benefit |
|---|---|
| Define a capacity model according to the business requirements  | Test the limits for predicted and random spikes and fluctuations in load to make sure the application can scale. Factor in the SKU service limits and regional limits so that application scales as expected if there is a regional failure   |
| Use PaaS offerings  | Take advantage of the built-in capabilities that automatically trigger scaling operations instead of investing in manual scaling efforts that often require custom implementations and can be error prone.  |
| Choose the right resources and right-size | Determine if the resources can support the anticipated load. Also, justify the cost implications of the choices.  |
| Apply strategies in your design early  | Accelerate adoption without significant changes. for example, strive for stateless application and store state externally in a database or distributed cache. Use caching where possible, to minimize the processing load.  |  

An alternate approach is vertical scaling (scale-up). However, you eventually may reach a limit where there isn't a larger system, and you can't scale up anymore. At that point, any further scaling must be horizontal. So it's good practice to employ a scale-out architecture early on. 