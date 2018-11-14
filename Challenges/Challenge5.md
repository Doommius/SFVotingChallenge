# Challenge 5 - Scale the application

Moving on, let's use our ability to deploy an upgrade, to upgrade the application to support scaling across all the nodes in the cluster. 

We challenge you to add the ability for the application to use all nodes in the cluster for writing poll data in the back-end service.

## Documentation References

- [Scaling in Service Fabric](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-concepts-scalability)
- [Partition Service Fabric reliable services](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-concepts-partitioning)

## Success Criteria

To successfully complete this challenge, you will need to 
1) Explain your scalability design that allows the application to use all cluster nodes to write poll data in the back-end service
2) Show the code required to support your scaling strategy 

## Tips

- Data shards (partitioning) is one way of scaling application data across multiple writable instances.