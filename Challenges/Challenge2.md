# Challenge 2 - Deploy the application

Now that we have a cluster in Azure up and running, let's get the application deployed. 

We challenge you to add the ability to continuously build and automatically deploy the Voting application to your cluster.

## Documentation References

- [Service Fabric application life-cycle](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-application-lifecycle)
- [Tutorial: Deploy an application with CI/CD to a Service Fabric cluster](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-tutorial-deploy-app-with-cicd-vsts)
- [Manage applications for multiple environments](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-manage-multiple-environment-app-configuration)

## Success Criteria

To successfully complete this challenge, you need to: 

1. Explain your continuous integration pipeline setup to the instructors
2. Provide the instructors with the information needed to validate the following API calls will return HTTP OK (200), from a random computer on the Internet:

- http://[endpoint]/api/votes (GET)
- http://[endpoint]/api/votes/dog (PUT)

## Tips

- Access to an exposed endpoint in a Service Fabric cluster, from public Internet, is controlled through Azure Load Balancers.
- Azure DevOps provides tasks available to help build Service Fabric applications and deploy them to a Service Fabric cluster.