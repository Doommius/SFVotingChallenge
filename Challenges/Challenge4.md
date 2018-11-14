# Challenge 4 - Prove service availability during upgrade

Sooner or later during the application lifecycle, we will need to upgrade the application code or configuration. 

We challenge you to prove that your service will remain healthy during application upgrades, with no data-loss, minimal downtime and failed client requests.

## Documentation References

- [Service Fabric application upgrade](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-application-upgrade)
- [Troubleshoot application upgrades](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-application-upgrade-troubleshooting)
- [How data serialization affects an application upgrade](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-application-upgrade-data-serialization)

## Success Criteria

To successfully complete this challenge, you need to:

1) Explain to the instructors how you prevent data-loss during upgrades
2) Show your application availability data (response time and failed requests) while performing an application upgrade

## Tips

- Azure DevOps provides tasks available to help build and upgrade Service Fabric applications.
- There are a lot of upgrade parameters and configuration options to be cautions about, when choosing your upgrade strategy.