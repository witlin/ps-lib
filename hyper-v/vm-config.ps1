New-VM 
 -Name server_core 
 -MemoryStartupBytes 2GB 
 -BootDevice VHD 
 -VHDPath $home\Documents\Hyper-V\vhdx\win-app-server.vhdx 
 -Path $home+\Documents\Hyper-V\vms 
 -Generation 2 
 -SwitchName int_switch

 