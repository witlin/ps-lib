Get-NetAdapter|ft    
Get-NetIPAddress|ft 

Set-NetIPInterface -InterfaceIndex 12 -Dhcp Disabled -PassThru
New-NetIPAddress -AddressFamily IPv4 -InterfaceIndex 12 -IPAddress 172.16.0.2 -PrefixLength 27 -DefaultGateway 172.16.0.1

