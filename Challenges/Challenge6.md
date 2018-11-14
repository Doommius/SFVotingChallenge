# Challenge 6 - Multi-tenancy

The next step in the evolution of our application is to support multiple simultaneous polls to co-exist on the same cluster. 

We challenge you to introduce support for multi-tenancy to our application, so our booming voting business can continue to grow. 

## Documentation References

- [Scaling in Service Fabric](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-concepts-scalability)

## Success Criteria

To successfully complete this challenge, you will need to:
1) Explain your chosen design for multi-tenancy to the instructors 
2) Implement the support for the following APIs: 
	- /api/polls/ (PUT) (create a new poll)
	- /api/polls/ (GET) (returns a list of currently active polls)
	- /api/polls/<pollname> (DELETE) (Delete a specific poll)
	- /api/polls/<pollname> (GET) (Give current poll results)
	- /api/polls/<pollname>/<vote> (PATCH) (Add a vote)

## Tips

- There are multiple ways to approach this challenge - think about how to (dis)allow any individual poll to consume a disproportionate amount of cluster resources
- Please keep adding new telemetry data point as you evolve your application - you'll have a much easier time when debugging :)