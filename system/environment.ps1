########### WORK WITH ENVIRONMENT VARIABLES #################################################
[System.Environment]::GetEnvironmentVariables()
[Environment]::GetEnvironmentVariable("oJdk")
[Environment]::GetEnvironmentVariable("GRADLE_HOME")
([Environment]::GetEnvironmentVariable("PSModulePath")).split(";")
([Environment]::GetEnvironmentVariable("Path")).split(";")|Select-String -Pattern 'jdk'

$env:ComputerName
$val = Get-ChildItem Env:\Path|Select-Object -Property value
$val.Value.split(";")|Select-String -Pattern 'jdk'


########### ENABLE REMOTE DESKTOP ##########################
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

