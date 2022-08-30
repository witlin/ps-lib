######### AZ PS MODULE #########

# Connect-AzAccount 
# Get-AzSubscription
# Get-AzContext
$tenantId = Get-AzTenant | Select-Object -Property Id
$scopeId, $clientId, $clientSecret

# New-AzADApplication -DisplayName 'CloudRelayAPI'
# New-AzADApplication -DisplayName 'CloudRelayClient'

$azad_apps = Get-AzADApplication
foreach ($i in $azad_apps) {
    if ($i.DisplayName.Equals('CloudRelayAPI')) {$scopeId = $i.AppId}
    elseif ($i.DisplayName.Equals('CloudRelayClient')) {$clientId = $i.AppId}
}

# $clientSecret = Get-AzADApplication -ApplicationId $clientId | New-AzADAppCredential

# New-AzResourceGroup -Name 'rg-cloudrelaygateway' -Location 'Central US'
# New-AzResourceGroup -Name 'rg-cloudrelaycompute' -Location 'Central US'
#  Get-AzResourceGroup

# New-AzApplicationInsights -Kind web -ResourceGroupName rg-cloudrelaycompute -name shubiAppInsights -location centralus

### Extract the relay-arm.zip file into your working directory. ###

# New-AzStorageAccount -ResourceGroupName rg-cloudrelaygateway -Name shubistore -Location centralus -SkuName Standard_LRS -Kind BlobStorage -AccessTier Hot

# New-AzIotHub -ResourceGroupName rg-cloudrelaygateway -Name shubi -SkuName 'S1' -Units 1 -Location 'centralus'

######### AZ CLI #########

# cd .\azure\Gateway
# az group deployment create `
# --handle-extended-json-format `
# --name CloudRelayGatewayDeployment `
# --template-file Distech.CloudRelay.Gateway.json `
# --parameters Distech.CloudRelay.Gateway.Parameters.json `
# --resource-group rg-cloudrelaygateway

# cd .\azure\Compute
# az group deployment create `
# >> --handle-extended-json-format `
# >> --name CloudRelayComputeDeployment `
# >> --resource-group rg-cloudrelaycompute `
# >> --template-file .\Distech.CloudRelay.Compute.json `
# >> --parameters .\Distech.CloudRelay.Compute.Parameters.json