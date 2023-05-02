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

# Checklist - Design for performance efficiency  

## Application design 

- Design for scaling
- Scale as a unit 
- Take advantage of platform autoscaling features
- Partition the workload
- Avoid client affinity
- Offload CPU-intensive and I/O intensive tasks as background tasks
- Distribute the workload for background tasks
- Consider moving toward a shared-nothing architecture  

## Data managment  

- User data partitioning
- Design for eventual consistency
- Reduce chatty interactions between components and services
- Use queues tot level the load for high velocity data writes
- Minimize the load on the data store 
- Minimize the volume of data retrieved
- Aggressively use caching 
- Handle data growth and retention
- Optimize Data Transfer Objects (DTOs)
- Set cache control
- Enable client side caching
- Use Azure blob storage and the Azure Content Delivery Network to reduce the load on the application
- Optimize and tune SQL queries and indexes
- Consider denormalizing data  

## Implementation 

- Review the performance antipatterns
- Use asynchronous calls
- Avoid locking resources, and use an optimistic approach instead
- Compress highly compressible data over high latency, low bandwith networks.
- Minimize the time that connections and resources are in use
- Minimize the number of connections required
- Send requests in batches to optimize network use
- Avoid a requirement to store server-side session state where possible 
- Optimize table storage schemas
- Create resource dependencies during deployment or at application startup
- Use lightweight frameworks
- Consider minimizing the number of service accounts