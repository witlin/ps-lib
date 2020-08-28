# Because a network connection is set to public on the host computer WinRM needs the parameter to be enabled.
# Even though WinRM is only required as a client in this host, the enable command enables both client and
# server profiles and their corresponding firewall rules essentially opening WinRM ports on the host firewall
# for incoming remote connections as well as the required outgoing remote connection features.
# for WinRM clients allowing for server features is a vunerability and it must be plugged as part of the
# Non-domain WinRM client config workload.
Enable-PSRemoting -SkipNetworkProfileCheck
$credentials = Get-Credential
Set-Item WSMan:\localhost\Client\TrustedHosts -Value "172.16.0.2"
$sess = New-PSSession -ComputerName 172.16.0.2 -Credential $credentials
Enter-PSSession $sess