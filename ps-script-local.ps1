#make a new hyper-v vm from an existing vhdx resource
New-VM -Name "axvm" -VHDPath "D:\vhd_imgs\WIN-56GUFVSP8DD-carlospublichsvres0net.VHDX" -Path "D:\hyper-v-vms"