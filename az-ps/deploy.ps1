$context = Get-AzContext
if (!$context) {
    Connect-AzAccount
}

$ResourceGroupName = "oa-infra-dev"
$Location = "west europe"

Set-AzContext -Subscription "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

New-AzContainerRegistry -ResourceGroupName $ResourceGroupName -Location $Location -Name "oainfraacrdev" -Sku Basic