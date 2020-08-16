param (
    [String] $ApplicationId,
    [String] $ClientSecret
)

. .\login-func.ps1

$Subscription = "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"
$Tenant = "db1271e1-985e-4b67-957d-910f6618d2b4"

LoginWithSP -ApplicationId $ApplicationId -ClientSecret $ClientSecret -Subscription $Subscription -Tenant $Tenant