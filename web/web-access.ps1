Set-ExecutionPolicy Bypass -Scope Process -Force; 
[System.Net.ServicePointManager]::SecurityProtocol = `
[System.Net.ServicePointManager]::SecurityProtocol -bor 3072; 
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

get-windowsfeature | where-object "Installed" -eq true

get-windowsfeature *Powershell*

add-windowsfeature WindowsPowershellWebAccess

get-windowsfeature *web*

install-windowsfeature Web-Scripting-Tools

get-help *pswa*
