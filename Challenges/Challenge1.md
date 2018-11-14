# Challenge 1 - The Cluster

Now that we have the application working on our local dev machines, we challenge you to build a cluster in Microsoft Azure that will host your application.

You can use your own Azure subscription if you have one already. If not, instructors will provide a free Azure subscription for you to use during the hackathon.

We will be using a 5-node cluster based on the Standard_E2s_v3 VM template in the West Europe region.

## Documentation References

- [Create Service Fabric clusters on Windows Server or Linux](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-deploy-anywhere)
- [Tutorial: Deploy a Service Fabric Windows cluster into an Azure virtual network](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-tutorial-create-vnet-and-windows-cluster)
- [Service Fabric explorer](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-visualizing-your-cluster)
- [Service Fabric cluster capacity planning considerations](https://docs.microsoft.com/en-us/azure/service-fabric/service-fabric-cluster-capacity)

## Success Criteria

To successfully complete this challenge, you need to be able to demonstrate to the instructors that your cluster is up and healthy.

## Tips

- Clusters in Azure are exposed with public IP addresses per default, make sure to protect your management endpoints.
- Being able to automate the creation of a cluster and the required resources, enables you to quickly throw away or reconfigure you resources.