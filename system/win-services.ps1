# Function with a string parameter, to find out if a windows service is running. 
# The parameter is the name of the service.
function is-service-running {
    param ( [Parameter ()] [string]$Name )
    if ((Get-Service -Name $Name).Status -eq 'Running') { $true } else { $false }
}