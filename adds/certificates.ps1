
Install-Module -Name PSPKI

Get-Command -Module PSPKI | select-string Convert

get-help Convert-PfxToPem -Examples

Convert-PfxToPem -InputFile .\ec-bos.pfx -Password (ConvertTo-SecureString 'Distech123' -AsPlainText -Force) -OutputFile ec-bos.pem -IncludeChain -OutputType Pkcs1