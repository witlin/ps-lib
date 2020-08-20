# Enumerated Constants ##########################################
$appReg = "Not Installed", "Installed"

# Global Variables ##############################################
$globalProfile = $profile.AllUsersAllHosts
$userProfile = $profile.CurrentUserAllHosts
$chocoVersion = Invoke-Command { choco -v }
$psFormat = "\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"
$packtracer = $HOME + "\Cisco Packet Tracer 7.3.0\saves"
$vcxsrvDir = "C:\Users\vms03\Documents\vcxsrv"

# System info
$ComputerName = $env:ComputerName
$processorInfo = Get-WmiObject -Class Win32_Processor
$SysInfo = Get-WmiObject -Class Win32_ComputerSystem
$OsInfo = Get-WmiObject -Class Win32_OperatingSystem
$DiskInfo = Get-WmiObject -Class Win32_LogicalDisk



$DIST47_HOME = "C:\Niagara\EC-Net4-4.7.110.32"
$DIST48_HOME = "C:\Niagara\EC-Net4-4.8.0.110"

$DIST47_USER = $HOME+"\Niagara4.7\distech"
$DIST48_USER = $HOME+"\Niagara4.8\distech"

# $JCI46_HOME = "C:\JCI\FXWorkbench-14.6"
# $JCI48_HOME = "C:\JCI\FXWorkbench-14.8"

# $JCI46_USER = $HOME+"\Niagara4.6\tridium"
# $JCI48_USER = $HOME+"\Niagara4.8\tridium"

$appRegistry = [ordered]@{ 
    "7zip" = $appReg[0], "C:\Program Files\7-Zip\7z.exe"; 
    "Choco" = $appReg[0], $env:ChocolateyInstall + "\choco.exe"; 
    "docker" = $appReg[0], "";
    "eclipse" = $appReg[0], "";
    "git" = $appReg[0], "";
    "gradle" = $appReg[0], $env:GRADLE_HOME;
    "jdk6" = $appReg[0], "";
    "jdk8" = $appReg[0], "";
    "jdk11" = $appReg[0], $env:JAVA_HOME;
    "intellij" = $appReg[0], "";
    "netbeans" = $appReg[0], "";
    "python" = $appReg[0], "";
    "vscode" = $appReg[0], $HOME + "\AppData\Local\Programs\Microsoft VS Code\Code.exe";
}
$MODULES_HOME = $HOME+"\git\ps-modules"

########### Environment Variables ##############################################
# For vcx or xming
Set-Variable -Name DISPLAY -Value 192.168.240.1:0.0

########### Global Functions ##############################################
function check-choco {
    if($chocoVersion -match "0.1"){
        "version "+$chocoVersion+" installed"
    } else {
        "choco is not installed"
    }
}
function install-choco {
    if($chocoVersion -ccontains "0.1"){
        [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
      } else {
        Write-Output " - choco $chocoVersion is installed...!"
      }
}
function Start-Workbench { 
    param([string] $Path)
    Start-Process -FilePath $Path 
}
function Start-Station {
    param([string] $Path)
    Start-Process -FilePath $Path
}
# function jci-wb46 { 
#     Start-Workbench -Path $JCI46_HOME"\bin\wb.exe" 
# }
function distech-wb47 { 
    Start-Workbench -Path $DIST47_HOME"\bin\wb.exe" 
}
function distech-wb48 { 
    Start-Workbench -Path $DIST48_HOME"\bin\wb.exe" 
}

