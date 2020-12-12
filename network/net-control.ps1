Get-NetAdapter | Sort-Object -Property ifIndex | ft -Wrap  
Get-NetIPAddress | Sort-Object -Property ifIndex | ft -Wrap

# Set-NetIPInterface -InterfaceIndex 14 -Dhcp Disabled -PassThru
# Remove-NetIPAddress -ifIndex 14

#DCES Eclypse | laptop = 
New-NetIPAddress `
  -AddressFamily IPv4 `
    -InterfaceIndex 11  `
    -IPAddress 172.16.0.3 `
    -PrefixLength 24 `
    -DefaultGateway 172.16.0.1


