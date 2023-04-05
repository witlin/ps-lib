<#
    Author: Charlie Russel
#>

[CmdletBinding()]
param (
    [Parameter(Mandatory=$false, Position=0)]
    [string]
    $DomainController
)

if($DomainController) {
    $AD = Get-ADRootDSE -Server $DomainController -Property ObjectVersion
} else {
    $AD = Get-ADRootDSE
    Get-ADObject $AD.SchemaNamingContext -Property ObjectVersion
}
$Forest = $AD.ForestFunctionality
$Domain = $AD.DomainFuctionality
$VersionCodes = @"
Forest: $Forest
Domain: $Domain
Where the Schema version is:
72 = Windows Server Technical Preview Build 9841
69 = Windows Server 2012 R2
56 = Windows Server 2012
47 = Windows Server 2008 R2
44 = Windows Server 2008
31 = Windows Server 2003 R2
30 = Windows Server 2003
13 = Windows 2000
"@

$VersionCodes