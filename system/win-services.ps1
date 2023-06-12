# Server-core commands and functions

Get-WindowsFeature | Where-Object Installed 
Get-WindowsFeature -Name RSAT*
Get-WindowsFeature -Name DNS*
Get-WindowsFeature -Name AD*

## Install RSAT tools
Install-WindowsFeature -Name RSAT-Role-Tools

# Install Active Directory
Install-WindowsFeature RSAT-AD-Tools
Import-Module ActiveDirectory
$adModule = (Get-Module ActiveDirectory)
$adModule.ExportedCmdlets | Format-Table Keys


function is-service-running {
    param ( [Parameter ()] [string]$name )
    if ((Get-Service -Name $Name).Status -eq 'Running') { $true } else { $false }
}

function is-feature-installed {
    param ( [Parameter ()] [string] $name )
    Get-WindowsFeature -Name $name | Where-Object Installed
}