# User Variables ##############################################
$globalProfile = $profile.AllUsersAllHosts
$userProfile = $profile.CurrentUserAllHosts
$chocoVersion = Invoke-Command { choco -v }
$psFormat = "\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
$packtracer = $HOME + "\Cisco Packet Tracer 7.3.0\saves"
$appdata = "C:\Users\vms03\AppData\Roaming"
$vcxsrvDir = "C:\Users\vms03\Documents\vcxsrv"

$DIST47_HOME = "C:\Niagara\EC-Net4-4.7.110.32"
$DIST48_HOME = "C:\Niagara\EC-Net4-4.8.0.110"

$DIST47_USER = $HOME + "\Niagara4.7\distech"
$DIST48_USER = $HOME + "\Niagara4.8\distech"

# System info
$computerName = $env:ComputerName
$processorInfo = Get-WmiObject -Class Win32_Processor
$sysInfo = Get-WmiObject -Class Win32_ComputerSystem
$osInfo = Get-WmiObject -Class Win32_OperatingSystem
$diskInfo = Get-WmiObject -Class Win32_LogicalDisk

########### ENVIRONMENT VARIABLES ######################
# For vcx or xming
# Set-Variable -Name DISPLAY -Value 192.168.240.1:0.0

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
function distech-wb47 { 
    Start-Workbench -Path $DIST47_HOME"\bin\wb.exe" 
}
function distech-wb48 { 
    Start-Workbench -Path $DIST48_HOME"\bin\wb.exe" 
}

function remote-to-server {
    param([string] $hostName)
    Enter-PSSession -ComputerName $hostName -Credential Get-Credential
}