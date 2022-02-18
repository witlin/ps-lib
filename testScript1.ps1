Get-Item -Path Env:* | Get-Member
Get-ChildItem Env:Path

Set-Location Env:
Get-ChildItem Path
$env:Path += ";C:\Program Files (x86)\Windows Kits\10\Assessment and Deployment Kit\Imaging and Configuration Designer\x86"
$env:Path
