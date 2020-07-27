
# Get a network interface
$adapter = Get-NetAdapter -InterfaceDescription "Killer*th*"
$adapter

# get all the vm-network-adapters in table format
Get-VMNetworkAdapter -All | Format-Table -AutoSize
Get-VMNetworkAdapter -VMName win-app-server

# Create a new VM Switch 
New-VMSwitch -name ExternalSwitch  -NetAdapterName $adapter -AllowManagementOS $true

# Connect a VM's network adapter to a VM Switch
Get-VMNetworkAdapter -VMName win-app-server | Connect-VMNetworkAdapter -SwitchName int_switch

# Get network adapter information
Get-VMNetworkAdapter | Get-Member *
Get-NetAdapter | Format-Table Name, NetworkAddresses, MacAddress, Status, LinkSpeed, MtuSize, DeviceName -AutoSize

# Get vm-network adapter information
Get-VMNetworkAdapter | Format-Table Name, IPAddresses, MacAddress, SwitchName, VMName, connected, VlanSetting
