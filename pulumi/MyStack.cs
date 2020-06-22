using Pulumi;
using Pulumi.Azure.Core;
using Pulumi.Azure.ContainerService;

class MyStack : Stack
{
    public MyStack()
    {
        // Create an Azure Resource Group
        var rg = new ResourceGroup("oa-infra-dev");

        // Create an Azure Container Registry
        var acr = new Registry("oainfraacrdev", new RegistryArgs
        {
            ResourceGroupName = rg.Name,
            Location = rg.Location,
            Sku = "Basic",
            AdminEnabled = false,
        });
    }
}
