# Setup
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
[System.Net.ServicePointManager]::ServerCertificateValidationCallback = { $true }
$url = 'https://192.168.1.236/api/rest/v1/protocols/bacnet/local/objects/binary-value/101/properties/present-value?encode=json'
$credentials = Get-Credential

#POST
Invoke-RestMethod -Uri $url -Method 'Post' -Authentication 'Basic' -Credential $credentials -ContentType 'application/json' -SkipCertificateCheck -body '{"value":"Active"}' -Verbose

#GET
Invoke-RestMethod -Uri $url -Method 'Get' -Authentication 'Basic' -Credential $credentials -ContentType 'application/json' -SkipCertificateCheck -verbose | Write-Host

# Firmware upgrade routes
# GET https://ecy-top.vitek.com/api/rest/v1/info/device?$select=softwareVersion

# GET https://ecy-top.vitek.com/api/rest/v1/system/update/firmware/status

# POST MULTIPART-FORM https://ecy-top.vitek.com/api/rest/v1/system/update/firmware?apply=true

# GET https://ecy-top.vitek.com/api/rest/v1/system/update/firmware/status