########### WORK WITH ENVIRONMENT VARIABLES #################################################
[System.Environment]::GetEnvironmentVariables()
[Environment]::GetEnvironmentVariable("oJdk")
[Environment]::GetEnvironmentVariable("GRADLE_HOME")
([Environment]::GetEnvironmentVariable("PSModulePath")).split(";")
([Environment]::GetEnvironmentVariable("Path")).split(";")

$env:ComputerName

########### ENABLE REMOTE DESKTOP ##########################
Set-ItemProperty -Path 'HKLM:\System\CurrentControlSet\Control\Terminal Server' -name "fDenyTSConnections" -value 0

