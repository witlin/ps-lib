# User Variables ##############################################
$globalProfile = $profile.AllUsersAllHosts
$userProfile = $profile.CurrentUserAllHosts
$chocoVersion = Invoke-Command { choco -v }
$psFormat = "\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
$packtracer = $HOME + "\Cisco Packet Tracer 7.3.0\saves"
$appdata = "C:\Users\vms03\AppData\Roaming"

# System info
$computerName = $env:ComputerName
$processorInfo = Get-WmiObject -Class Win32_Processor
$sysInfo = Get-WmiObject -Class Win32_ComputerSystem
$osInfo = Get-WmiObject -Class Win32_OperatingSystem
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk

########### ENVIRONMENT VARIABLES ######################

# Global Functions ##############################################
function check-choco {
    if ($chocoVersion -match "0.1") {
        "version " + $chocoVersion + " installed"
    }
    else {
        "choco is not installed"
    }
}
function install-choco {
    if ($chocoVersion -ccontains "0.1") {
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
    else {
        Write-Output " - choco $chocoVersion is installed...!"
    }
}
function Start-Workbench { 
    param([string] $Path)
    Start-Process -FilePath $Path 
}
function Start-Station {
    param([string] $Path, [String[]] $Argus)
    Start-Process -FilePath $Path -ArgumentList $Argus
}

function remote-to-server {
    param([string] $hostName)
    Enter-PSSession -ComputerName $hostName -Credential Get-Credential
}

function find-device {
    param([string] $manufacturer)
    Get-WmiObject Win32_PNPEntity | 
    Where-Object {$_.$manufacturer -match "Prolific"} |
    Select -Property Caption
}

function change-ipaddress {
    param(
        [int] $index, 
        [string] $ipaddress, 
        [string] $mask, 
        [string] $gateway,
        [string[]] $dnsServers)
    try {
        Remove-NetIPAddress -InterfaceIndex $index -IPAddress *;
    } catch {"ERROR - trying to remove the ip address...!"}
    try {
        Remove-NetRoute -InterfaceIndex $index -DestinationPrefix 0.0.0.0/0;
    } catch {"ERROR - trying to remove the route...!"}
    try {
        New-NetIPAddress -InterfaceIndex $index -IPAddress $ipaddress -PrefixLength $mask -DefaultGateway $gateway
    } catch {"ERROR - trying to add the new ip address...!"}
    try {
        Set-DnsClientServerAddress -InterfaceIndex $index -ServerAddresses ($dnsServers)
    } catch {"ERROR - trying to add new DNS server addresses...!"}
}

function install-dotnet35 {
    param([boolean] $online)
    if ($online) {
        DISM /Online /Enable-feature /FeatureName:NetFx3 /All
    } else {
        DISM /Online /Enable-feature /FeatureName:NetFx3 /All /LimitAccess /Source:e:\sources\sxs    
    }
}

<#
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = 
    [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#>