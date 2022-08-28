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

# Rename the host server to a proper name.
Rename-Computer -NewName DCES-ADDS -Restart -Force -PassThru

# Install Active Directory Domain Services
Install-WindowsFeature -Name AD-Domain-Services -IncludeManagementTools

# Install Active Directory Tools
Install-WindowsFeature -Name RSAT-AD-Tools -IncludeManagementTools
Restart-Computer -Force
Import-Module ActiveDirectory

# Test Forest Creation
Import-Module ADDSDeployment
Test-ADDSForestInstallation -DomainName 'BASCustomer.net' -DomainNetBiosName 'BASCUSTOMER' -DomainMode Win2012 -ForestMode Win2012 -NoDnsOnNetwork -NoRebootOnCompletion -DatabasePath "C:\ADDS\NTDS" -SysvolPath "C:\ADDS\SYSVOL" -LogPath "C:\ADDS\Logs"

# Deploy Domain Controller and Forest
Install-ADDSForest -DomainName 'BASCustomer.net' -DomainNetBiosName 'BASCUSTOMER' -DomainMode Win2012 -ForestMode Win2012 -NoDnsOnNetwork -DatabasePath "C:\ADDS\NTDS" -SysvolPath "C:\ADDS\SYSVOL" -LogPath "C:\ADDS\Logs" -SkipPreChecks -Force 

# Verify the work done so far
Get-ADRootDSE

# Safemode-password: Dc3S_@Dds01

# Adding a new AD User to the domain
Set-ADAccountPassword -Identity:"CN=Dayana Berta,CN=Users,DC=vitek,DC=com" -NewPassword:"System.Security.SecureString" -Reset:$null -Server:"WIN-MP029PCO3QU.vitek.com"

Enable-ADAccount -Identity:"CN=Dayana Berta,CN=Users,DC=vitek,DC=com" -Server:"WIN-MP029PCO3QU.vitek.com"

Add-ADPrincipalGroupMembership -Identity:"CN=Dayana Berta,CN=Users,DC=vitek,DC=com" -MemberOf:"CN=Users,CN=Builtin,DC=vitek,DC=com" -Server:"WIN-MP029PCO3QU.vitek.com"

Set-ADAccountControl -AccountNotDelegated:$false -AllowReversiblePasswordEncryption:$false -CannotChangePassword:$false -DoesNotRequirePreAuth:$false -Identity:"CN=Dayana Berta,CN=Users,DC=vitek,DC=com" -PasswordNeverExpires:$false -Server:"WIN-MP029PCO3QU.vitek.com" -UseDESKeyOnly:$false

Set-ADUser -ChangePasswordAtLogon:$true -Identity:"CN=Dayana Berta,CN=Users,DC=vitek,DC=com" -Server:"WIN-MP029PCO3QU.vitek.com" -SmartcardLogonRequired:$false