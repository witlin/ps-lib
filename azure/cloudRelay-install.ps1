# Connect-AzAccount 
# Get-AzSubscription
# Get-AzContext
# $tenantId = Get-AzTenant | Select-Object -Property Id
# $scopeId, $clientId, $clientSecret

# New-AzADApplication -DisplayName 'CloudRelayAPI'
# New-AzADApplication -DisplayName 'CloudRelayClient'

# $azad_apps = Get-AzADApplication
# foreach ($i in $azad_apps) {
#     if ($i.DisplayName.Equals('CloudRelayAPI')) {$scopeId = $i.AppId}
#     elseif ($i.DisplayName.Equals('CloudRelayClient')) {$clientId = $i.AppId}
# }

# $clientSecret = Get-AzADApplication -ApplicationId $clientId | New-AzADAppCredential

# New-AzResourceGroup -Name 'rg-cloudrelaygateway' -Location 'Central US'
# New-AzResourceGroup -Name 'rg-cloudrelaycompute' -Location 'Central US'

### Extract the relay-arm.zip file into your working directory. ###

New-AzResourceGroupDeployment -ResourceGroupName 'rg-cloudrelaygateway' -TemplateFile '.\Gateway\Distech.CloudRelay.Gateway.json' -TemplateParameterFile '.\Gateway\Distech.CloudRelay.Gateway.Parameters.json'
