function LoginWithSP
{
    param(
        [String] $ApplicationId,
        [String] $ClientSecret,
        [String] $Subscription,
        [String] $Tenant
    )
    process {
        $Accounts = az account list | ConvertFrom-Json
        if ($null -eq $Accounts)
        {
            az login --service-principal --user $ApplicationId --password $ClientSecret --tenant $Tenant
        }
        
        az account set --subscription $Subscription
    }
}

