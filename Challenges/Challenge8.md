# Challenge 8 - Noisy Neighbors

While multi-tenancy allows more efficient use of cluster resources, it can lead to new class of problems like the "Noisy Neighbors" where one (very active) tenant could  starve the other tenants for resources.

Our next challenge for you is to ensure some level of fairness in resource sharing, and reduce/remove the effect of noisy neighbors. 

## Documentation References

- [Resource Governance in Service Fabric](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-resource-governance)
- [Capacity Planning](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity)
- [Placement Constraints in Service Fabric] (https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-resource-manager-cluster-description#node-properties-and-placement-constraints)

## Success Criteria

To successfully complete this challenge, you will need to:
1) Explain your chosen design for preventing "noisy neighbors" in your application to the instructors. 
2) Prove your application availability for a random new poll in the presence of "noisy neighbors" (i.e. load tests)

## Tips

- Depending on how you designed the support for multi-tenancy, implementing the "noisy neighbors" protection may be more or less straightforward