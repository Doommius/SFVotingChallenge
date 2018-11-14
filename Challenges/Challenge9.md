# Challenge 8 - Prove service availability during failures

Ability to survive the (inevitable) hardware failures is becoming a mandatory requirement for all modern applications, especially the ones that deal with Voting stuff.

Your final challenge from us today is to harden the design of your application and cluster to make it resilient to hardware failures.

## Documentation References

- [Availability of Service Fabric services] (https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-availability-services)
- [Disaster recovery in Azure Service Fabric] (https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-disaster-recovery)
- [Introducing Chaos in Service Fabric clusters] (https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-controlled-chaos)

## Success Criteria

To successfully complete this challenge, you will need to:
1) Demonstrate that your application remains available when two out of 5 nodes from the cluster are deactivated.
2) Demonstrate that your application can survive a set of random failures injected by the instructors

## Tips

- Using the reliable data structures (such as Reliable collections provided by SF) and stateful services with appropriately-sized replica quorum goes a LONG way 