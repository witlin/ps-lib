# Confifure static IP for the ADDS-LDS-DNS Server
Set-NetIPInterface -InterfaceIndex 12 -Dhcp Disabled -PassThru
New-NetIPAddress `
-AddressFamily IPv4 `
-InterfaceIndex 12  `
-IPAddress 172.16.0.2 `
-PrefixLength 27 `
-DefaultGateway 172.16.0.1

# Set the DNS Server's address (the local host is both a DNS and AD/LDS Server)
Set-DnsClientServerAddress -InterfaceIndex 12 -ServerAddresses 172.16.0.2

# Install Active Directory Tools
Install-WindowsFeature RSAT-AD-Tools
Import-Module ActiveDirectory

# Rename the host server to a proper name.
Rename-Computer -NewName DCES-ADDS -Restart -Force -PassThru

# Install Active Directory Domain Services
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Test Forest Creation
Import-Module ADDSDeployment
Test-ADDSForestInstallation -DomainName 'BASCustomer.net' -DomainNetBiosName 'BASCUSTOMER' -DomainMode Win2012 -ForestMode Win2012 -NoDnsOnNetwork -NoRebootOnCompletion -DatabasePath "C:\ADDS\NTDS" -SysvolPath "C:\ADDS\SYSVOL" -LogPath "C:\ADDS\Logs"

# Deploy Domain Controller and Forest
Install-ADDSForest -DomainName 'BASCustomer.net' -DomainNetBiosName 'BASCUSTOMER' -DomainMode Win2012 -ForestMode Win2012 -NoDnsOnNetwork -DatabasePath "C:\ADDS\NTDS" -SysvolPath "C:\ADDS\SYSVOL" -LogPath "C:\ADDS\Logs" -SkipPreChecks -Force 

# Verify the work done so far
Get-ADRootDSE

# Safemode-password: Dc3S_@Dds01

