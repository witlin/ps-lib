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
    param([string] $Path, [String[]] $Args)
    Start-Process -FilePath $Path -ArgumentList $Args
}

function remote-to-server {
    param([string] $hostName)
    Enter-PSSession -ComputerName $hostName -Credential Get-Credential
}

<#
Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = 
    [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#>