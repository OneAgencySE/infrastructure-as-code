function SetupDeployAccount {
    param (
        [String] $AccountName,
        [String] $Subscription
    )
    process
    {
        # Create service principal and extract application id and client secret
        $result = az ad sp create-for-rbac --name "http://$AccountName" --skip-assignment --query '[appId, password]' --output json

        $resultAsPsObject = ConvertFrom-Json -InputObject ([string]$result)
        $applicationId = $resultAsPsObject[0]
        $applicationSecret = $resultAsPsObject[1]

        # Find object id of service principal
        $objectId = az ad sp list --display-name $AccountName --query [].objectId --output tsv
        
        # Give service principal contributor access on the chosen subscription
        az role assignment create --role "b24988ac-6180-42a0-ab88-20f7382dd24c" --assignee-object-id $objectId --scope "/subscriptions/$Subscription" --assignee-principal-type "ServicePrincipal"
    }
    end
    {
        return $applicationId, $applicationSecret
    }
}

