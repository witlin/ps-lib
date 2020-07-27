# official windows base images
docker pull mcr.microsoft.com/windows/iotcore:1809
docker pull mcr.microsolf.com/windows/servercore:ltsc2019
docker pull mcr.microsoft.com/windows/nanoserver:1903

# official linux distros
docker pull centos
docker pull ubuntu

docker ps -a --format $psFormat

# WIN 10 IOT  - NOT WORKING !!!
# docker run --rm -ti --name iot_0001 mcr.microsoft.com/windows/iotcore:1809 cmd.exe

# WIN SERVER CORE
docker run -ti --name core_0001 mcr.microsoft.com/windows/servercore:ltsc2019 powershell.exe
docker commit core_0001 winserver
docker run --rm -ti --name core_0002 -P -v C:\Users\vms03\Documents\docker-vols\winserver:C:\Users\ContainerAdministrator\host-share winserver powershell.exe

# WIN SERVER NANO
docker run -ti --name nano_0001 mcr.microsoft.com/windows/nanoserver:1903 cmd.exe
docker commit nano_0001 nano_latest
docker run --rm -ti --name nano_0002 -P -v C:\Users\vms03\Documents\docker-vols\wappserver:C:\Users\ContainerUser\host-share wappserver cmd.exe

# WIN 10 BASE
docker run -ti --name winbase_0001 mcr.microsoft.com/windows:1903 powershell.exe
docker commit winbase_0001 n4base
docker run -ti --name winbase_ps0002 -P --user "NT AUTHORITY\SYSTEM" -v C:\Users\vms03\Documents\docker-vols\n4base:C:\Users\ContainerAdministrator\host-share n4base powershell.exe
  net user vitek dces /add
  net localgroup Administrators /add vitek
  net user administrator dces
  net user vitek /active:yes
  net user administrator /active:yes
  # Run on the host
  New-NetFirewallRule -Name "ContainerRDP" -DisplayName "RDP Port for connecting to the container" -Protocol TCP -LocalPort @(3389) -Action Allow 
  New-NetFirewallRule -Name "RDP" -DisplayName "Remote Desktop Protocol" -Protocol TCP -LocalPort @(3390) -Action Allow
docker commit winbase_ps0002 n4base_img0001
docker run --rm -ti --name winbase_ps0003 -e DISPLAY=$DISPLAY n4base_img0001 "C:\Program Files\Internet Explorer\iexplore.exe"
