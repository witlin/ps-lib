# Get the host time source
w32tm /query /source

# query host NTP status info
w32tm /query /status

# Get other NTP servers this host syncs time from
w32tm /query /peers

# Check the connection to a peer NTP Server
w32tm /query /stripchart /computer:10.10.0.2 /dataonly /samples:5

# Check timezone settings
w32tm /tz

# Service start/stop
net start w32tm
net stop w32tm

# Open NTP Server port
New-NetFirewallRule -DisplayName NTP_SERVER `
                    -RemoteAddress Any `
                    -Enabled True `
                    -Profile Any `
                    -Direction Inbound `
                    -Action Allow `
                    -EdgeTraversalPolicy Block `
                    -LocalPort 123 `
                    -Protocol UDP `
                    -Description 'host can listen for NTP requests over UDP 123'

# Enable rights to run this script
Set-ExecutionPolicy Bypass -Scope Process -Force

# Enable NTP Server
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\w32time\TimeProviders\NtpServer" `
                 -Name "Enabled" 
                 -Value 1

# Set AnnounceFlags
Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\services\W32Time\Config" 
                 -Name "AnnounceFlags" 
                 -Value 5

# Restart Time Server
Restart-Service W32Time