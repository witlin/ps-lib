New-AzureRmVm 
							-ResourceGroupName "WCTC" 
							-Name "MS2016-Course" 
							-Location "Central US" 
							-VirtualNetworkName "myWCTC-NET" 
							-SubnetName "ms2016subnet" 
							-SecurityGroupName "ms2016SecGroup" 
							-PublicIpAddressName "ms2016PublicIp" 
							-OpenPorts 80,443,3389
							
							
### OUTPUT
# cmdlet New-AzureRmVM at command pipeline position 1
# Supply values for the following parameters:
# Credential
# User: vsmolinski
# Password for user vsmolinski: *************

# ResourceGroupName        	: WCTCId                       
# 							: /subscriptions/5577f3d3-f046-49a6-9caf-a022f2636e91/resourceGroups/WCTC/providers/Microsoft.Compute/virtualMachines/MS2016-CourseVmId                     
# 							: c96f9b5e-7229-49ff-9140-04a2e8159c95Name                     
# 							: MS2016-CourseType                     
# 							: Microsoft.Compute/virtualMachinesLocation                 
# 							: centralusTags                     
# 							: {}HardwareProfile          
# 							: {VmSize}NetworkProfile           
# 							: {NetworkInterfaces}OSProfile                
# 							: {ComputerName, AdminUsername, WindowsConfiguration, Secrets}ProvisioningState        
# 							: SucceededStorageProfile           
# 							: {ImageReference, OsDisk, DataDisks}FullyQualifiedDomainName 
# 							: ms2016-course-7eafb2.Central US.cloudapp.azure.comAzure:/

Get-AzureRmPublicIpAddress -ResourceGroupName "WCTC" | Select-Object "IpAddress"

### OUTPUT
# IpAddress
# ---------
# 23.99.190.242

mstsc /v: 23.99.190.242

#make a new hyper-v vm from an existing vhdx resource
New-VM -Name "axvm" -VHDPath "D:\vhd_imgs\WIN-56GUFVSP8DD-carlospublichsvres0net.VHDX" -Path "D:\hyper-v-vms"
