Get-NetAdapter | Sort-Object -Property ifIndex | ft -Wrap  
Get-NetIPAddress | Sort-Object -Property ifIndex | ft -Wrap

Set-NetIPInterface -InterfaceIndex 14 -Dhcp Disabled -PassThru

Remove-NetIPAddress -ifIndex 14

New-NetIPAddress `
    -AddressFamily IPv4 `
    -InterfaceIndex 14  `
    -IPAddress 172.16.0.2 `
    -PrefixLength 27 `
    -DefaultGateway 172.16.0.1


