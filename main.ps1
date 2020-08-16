. .\login-func.ps1
. .\service-principal-func.ps1

$Subscription = "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"
$Tenant = "db1271e1-985e-4b67-957d-910f6618d2b4"

$result = SetupDeployAccount -AccountName "devops-tuesday-deploy-user-13" -Subscription $Subscription

Write-Host($result)

#LoginWithSP -ApplicationId $result[0] -ClientSecret $result[1] -Subscription $Subscription -Tenant $Tenant