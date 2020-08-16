function CreateDeployAccount {
    param (
        [String] $AccountName
    )
    process
    {
        $result = az ad sp create-for-rbac --name "http://$AccountName" --skip-assignment --query '[appId, password]' --output json

        $resultAsPsObject = ConvertFrom-Json -InputObject ([string]$result)
        $secureApplicationId = ConvertTo-SecureString $resultAsPsObject[0] -AsPlainText
        $secureApplicationSecret = ConvertTo-SecureString $resultAsPsObject[1] -AsPlainText
    }
    end
    {
        return $secureApplicationId, $secureApplicationSecret
    }
}

