. .\account-func.ps1

$Subscription = "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"

$account = SetupDeployAccount -AccountName "devops-tuesday-deploy-user" -Subscription $Subscription

Write-Host($account)

#TODO: save account details somewhere