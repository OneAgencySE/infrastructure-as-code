function LoginWithSP
{
    param(
        [securestring] $ApplicationId,
        [securestring] $ClientSecret
    )
    process {
        $Accounts = az account list | ConvertFrom-Json
        if ($null -eq $Accounts)
        {
            az login --service-principal --user $ApplicationId --password $ClientSecret --tenant "db1271e1-985e-4b67-957d-910f6618d2b4"
        }
        
        # does not see my subscription for some reason? consent?
        az account set --subscription "4ded1a6f-aef9-4141-a03b-5d74d2bb8519"
    }
}

