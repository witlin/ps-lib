$timer = New-Object System.Timers.Timer
$timer.Interval = 5000
$timer.AutoReset = $true
$timer.Enabled = $true
$action = {
    Write-Host "test ping google cmd..." }

Register-ObjectEvent -InputObject $timer -EventName  Elapsed -SourceIdentifier pingGoogle -Action $action