# Powershell Taschenkarte

## PowerShell Überblick

### Starten der PowerShell

PowerShell kann über Start-> powershell eingeben-> Eingabetaste drücken gestartet werden. Manche Aktionen benötigen administrative Rechte, diese können abgearbeitet werden, indem man PowerShell mit erweiterten Rechten startet. Erweiterte Rechte erhält man durch Start-> powershell eingeben-> Umschalt+Steuerung+Eingabe. PowerShell cmdlet können auch aus cmd.exe durch eingeben von powershell –c „cmdlet“ gestartet werden.

### Syntax

Ein einzelner Befehl in PowerShell heißt Cmdlet und besteht typischerweise aus drei Teilen: einem Verb, einem Substantiv und Parametern. Verb und Substantiv werden durch einen Bindestrich getrennt, Parameter durch ein Leerzeichen. Übliche werben sind:

| Verb    | Funktion                                                   |
| :------ | :--------------------------------------------------------- |
| New-    | Erstellt eine neue Ressource                               |
| Set-    | Modifiziert vorhandene Ressourcen                          |
| Get-    | Ruft eine vorhandene Ressource ab                          |
| Read-   | Liest Informationen aus eine Quelle wie einen Textfile ein |
| Find-   | Sucht nach einem Objekt                                    |
| Search- | Erstellt eine Referenz zu einem Objekt                     |
| Start-  | (asynchron) Startet eine Operation oder Prozess            |
| Invoke- | (synchron) Führt eine Aktion aus                           |

### 5 PowerShell Grundlagen

| Cmdlet                        | Was es macht                                          | Alias     |
| :---------------------------- | :---------------------------------------------------- | :-------- |
| Get-Help \[cmdlet\] -Examples | Ruft die Hilfe eines Cmdlets ab und zeigt Beispiele   | man, help |
| Get-Command                   | Zeigt eine Liste mit Cmdlets                          | gcm       |
| Get-Member                    | Zeigt Eigenschafften und Methoden eines Cmdlets       | gm        |
| ForEach-Object \{$_\}         | Nimmt jedes Item aus der Pipe und behandelt es als $_ | %         |
| Select-String                 | Sucht nach Strings in Files                           | grep, sls |

### Vergleichende Operatoren

| Case in-sensitive | Case sensitive | Bedeutung                                                            |
| :---------------- | :------------- | :------------------------------------------------------------------- |
| -lt               | -clt           | Kleiner als                                                          |
| -le               | -cle           | Kleiner oder gleich                                                  |
| -gt               | -cgt           | Größer als                                                           |
| -ge               | -cge           | Größer oder gleich                                                   |
| -eq               | -ceq           | Ist gleich                                                           |
| -ne               | -cne           | Ist nicht gleich                                                     |
| -like             | -clike         | Übereinstimmung in einem String, Wildcards (*, ?) sind erlaubt       |
| -notlike          | -cnotlike      | Keine Übereinstimmung in einem String, Wildcards (*, ?) sind erlaubt |
| -match            | -cmatch        | Vergleich mit regulären Ausdrücken                                   |
| -notmatch         | -cnotmatch     | Keine Übereinstimmung mit einem regulären Ausdruck                   |
| -is               | -              | Typvergleich                                                         |
| -in               | -              | Ist in set enthalten                                                 |
| -notin            | -              | Ist in set nicht enthalten                                           |

Logische Verbindungen mit -and, -or und -not (Alias ist !) können auch genutzt werden.

## Hilfe bekommen

| Befehl                        | Auswirkung                                    |
| :---------------------------- | :-------------------------------------------- |
| Get-Help                      | Hilfe zur Hilfe anzeigen                      |
| Get-Help \<cmdlet\>           | Anzeigen der Selbstdokumentation eines Cmdlet |
| Get-Help \<cmdlet\> -detailed | Detaillierte Hilfe                            |
| Get-Help \<cmdlet\> -examples | Anwendungsbeispiele                           |
| Get-Help \<cmdlet\> -full     | Vollständige Dokumentation                    |
| Get-Help \<cmdlet\> -online   | Onlinehilfe                                   |

## Aliase

Aliase liefern kurze Versionen von langen Cmdlets

| Befehl                          | Auswirkung                                  |
| :------------------------------ | :------------------------------------------ |
| Get-Alias                       | Listet verfügbare Aliase auf                |
| Get-Alias \<unbekanntes Alias\> | Zum Erweitern des Alias in den vollen Namen |

## Effizientes Arbeiten mit der PowerShell

Tab Completion:

```PowerShell
get-child<Tab>
```

wird zu

```PowerShell
Get-ChildItem
```

Parameter kürzen:

```PowerShell
Get-ChildItem -recurse
```

ist äquivalent zu

```PowerShell
ls -r
```

## Nützliche Cmdlets und Aliase

Ein Verzeichnis auflisten (ls, dir,gci):

```PowerShell
Get-ChildItem
```

Eine Datei kopieren (cp, copy, cpi):

```PowerShell
Copy-Item "Quelle" "Ziel"
```

Eine Datei verschieben (mv, move, mi):

```PowerShell
Move-Item "Quelle" "Ziel"
```

Eine Textpassage in einer Datei finden:

```PowerShell
Select-String -path c:\users\*.txt -pattern password
```

Oder:

```PowerShell
ls -r c:\users -file | % {Select-String -path $_ -pattern password}
```

Aktuelles Verzeichnis anzeigen (pwd, gl):

```PowerShell
Get-Location
```

Laufende Prozesse anzeigen (ps, gps):

```PowerShell
Get-Process
```

Dienste anzeigen:

```PowerShell
Get-Service
```

Ausgabe eines Kommandos formatieren (fl):

```PowerShell
ls | Format-List -property Name
```

Seiten-/Zeilenweise Ausgabe:

```PowerShell
ls -r | Out-Host -paging
```

Den Hash-Wert einer Datei ausgeben:

```PowerShell
Get-FileHash -Algorithm SHA1 Datei.txt
```

Ausgabe in CSV exportieren:

```PowerShell
Get-Process | Export-CSV Process.csv
```

## Ein- und Ausgabe

| Befehl                       | Auswirkung                                                                              |
| :--------------------------- | :-------------------------------------------------------------------------------------- |
| Format-Table (ft)            | Ausgabe als Tabele                                                                      |
| Format-List (fl)             | Ausgabe als Liste                                                                       |
| Get-Content (type, cat, gc)  | Liest den Inhalt eines Item. Zum Beispiel den Inhalt einer Textdatei und einer Funktion |
| Out-Host (oh)                | Ausgabe auf der Konsole mit Farboptionen                                                |
| Out-Gridview (ogv)           | Interaktive Tabelle mit Filter- und Sortierfunktionen                                   |
| Out-File (>, >>)             | Ausgabe in eine Datei                                                                   |
| Out-Printer (lp)             | Ausgabe auf einem Drucker                                                               |
| Out-Clipboard                | Ausgabe in die Zwischenablage                                                           |
| Read-Host                    | Liest von der Konsole                                                                   |
| Import-CSV, Export-CSV       | Ein- und Ausgabe von CSV Dateien                                                        |
| Import-CLIXML, Export-CLIXML | Ein- und Ausgabe von XML Dateien                                                        |

## Konfigurieren und nutzen des Netzwerk

| Befehl                                          | Auswirkung                                               |
| :---------------------------------------------- | :------------------------------------------------------- |
| Get-NetAdapter                                  | Auflisten aller Netzwerkadapter (auch virtuelle Adapter) |
| Get-NetAdapterBinding                           | Eigenschaften einer NEtzwerkverbindung                   |
| Set-NetIPInterface                              | Aktivieren und deaktivieren von DHCP                     |
| New-NetIPAddress, Remove-NetIPAddress           | Setzen und löschen von festen IP-Adressen                |
| Set-DnsClientServerAddress                      | Setzen und entfernen von DNS Servern                     |
| Remove-NetRoute                                 | Entfernen einer Netzwerkroute                            |
| Resolve-DnsName                                 | Löst einen DNS Namen auf (früher nslookup)               |
| Enable-NetFirewallRule, Disable-NetFirewallRule | Aktivieren und deaktivieren von Firewallregeln           |
| Test-Connection                                 | Ping                                                     |
| Send-MailMessage                                | Verschickt eine Email                                    |
| IInvoke-WebRequest                              | HTTP Request                                             |
| New-WebProxyService                             | Erstellt einen Proxy für SOAP basierte Dienste           |
| Export-ODataEndpointProxy                       | Erstellt einen Proxy für OData basierte Dienste          |

## Spaß mit der PowerShell

Einzeiler für einen IP-Scanner:

```PowerShell
1..255 | % {echo "10.10.120.$_"; ping -n 1 -w 100 10.10.120.$_ | Select-String ttl}
```

Einzeiler für einen Port-Scanner:

```PowerShell
1..1024 | %{echo ((New-Object Net.Sockets.TcPClient).Connect("10.10.12.10",$_)) "Port $_ ist offen!"} 2>$null
```

Auflisten aller Autostartprogramme aus der Registry:

```PowerShell
Get-ItemProperty HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\run
```

Auflisten und modifizieren von Firewallregeln:

```PowerShell
Get-NetFirewallRule -all
```

```PowerShell
Set-NetFirewallRule -Action Allow -DisplayName LetMeIn -RemoteAddress 10.10.10.10
```

Finden von Dateien mit bestimmten Namen:

```PowerShell
Get-ChildItem "C:\Users\" -recurse -include *passwort*.txt
```

Eine Datei per HTTP herunterladen (wget für Windows):

```PowerShell
(New-Object System.Net.WebClient).DownloadFile("http://10.10.10.10/datei.exe","datei.exe")
```

Erstellt von\
myztic\@gmx.net\
v3.0 Stand 2020-02-11
