$a = new-object system.text.asciiencoding
$byte = $a.GetBytes("$(Get-Date)")
$udpobject = new-Object system.Net.Sockets.Udpclient(11000)
$udpobject.Connect("52.1.181.191",1194)
[void]$udpobject.Send($byte,$byte.length)



#IPEndPoint object will allow us to read datagrams sent from any source.
$remoteendpoint = New-Object system.net.ipendpoint([system.net.ipaddress]::Any,0)

#Blocks until a message returns on this socket from a remote host.
$receivebytes = $udpobject.Receive([ref]$remoteendpoint)

#Convert returned data into string format
[string]$returndata = $a.GetString($receivebytes)

#Uses the IPEndPoint object to show that the host responded.
Write-Host "This is the message you received: $($returndata.ToString())"
Write-Host "This message was sent from: $($remoteendpoint.address.ToString()) on their port number: $($remoteendpoint.Port.ToString())"