$context = Get-AzContext
if (!$context) {
    Connect-AzAccount
}

Set-AzContext -Subscription "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"

New-AzResourceGroup -Name "oa-infra-dev" -Location "west europe"

New-AzResourceGroupDeployment -ResourceGroupName "oa-infra-dev" -TemplateFile ".\environment.json" -TemplateParameterFile ".\parameters.json"