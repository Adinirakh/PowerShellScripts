$Profiles = @()
$Profiles += (netsh wlan show profiles) | Select-String "\:(.+)$" | ForEach-Object { $_.Matches.Groups[1].Value.Trim() }
$Profiles | ForEach-Object { $SSID = $_ ; (netsh wlan show profile name="$_" key=clear) } | Select-String "Schlüsselinhalt\W+\:(.+)$" | ForEach-Object { $pass = $_.Matches.Groups[1].Value.Trim(); $_ } | ForEach-Object { [PSCustomObject]@{Wireless_Network_Name = $SSID; Password = $pass } }
Format-Table -AutoSize
Start-Sleep -s 20