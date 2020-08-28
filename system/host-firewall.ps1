$trustedIps = @("172.16.0.2", "192.168.51.145", "172.22.160.1")

New-NetFirewallRule -DisplayName "AllowRDP" `
                    –RemoteAddress 192.168.2.200 `
                    -Direction Inbound `
                    -Protocol TCP `
                    –LocalPort 3389 `
                    -Action Allow

New-NetFirewallRule -DisplayName "Allow inbound ICMPv4" `
                   -Direction Inbound `
                   -Protocol ICMPv4 `
                   -IcmpType 8 `
                   -RemoteAddress $trustedIps `
                   -Action Allow