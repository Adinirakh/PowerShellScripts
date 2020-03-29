# PowerShellScripts

Eine Sammlung der Skripte die ich regelmäßig benutze. Sie sind nicht schön, aber sie funktionieren.

## Skripte für die PowerCLi von VMWare

### [Get-VMwareTask.ps1](./Scripts/Get-VMwareTask/Get-VMwareTask.ps1)

Dieses Skript fragt einen Task im vCenter regelmäßig ab und schickt eine E-Mail wenn dieser Task
beendet ist.

### [Create-Snapshots.ps1](./Scripts/Create-Snapshots/Create-Snapshots.ps1)

Das Skript fährt alle virtuellen Maschinen aus der Datei stopVMs.txt herunter, erstellt Snapshots
der Maschinen und fährt diese dann in der Reihenfolge wie in der Datei startVMs.txt angegeben
wieder hoch.

### [Report-Snapshots.ps1](./Scripts/Report-Snapshots/Report-Snapshots.ps1)

Erstellt einen Bericht über alle Snapshots und verschickt diesen Bericht als E-Mail an definierte
Benutzer.

### [Install-PersonalEnviroment.ps1](./Scripts/Install-PersonalEnviroment/Install-PersonalEnviroment.ps1)

Das Skript installiert meine Standard Programme auf einem frischen Windows 10 Computer.

### [Start-OutOfOfficeAssistant.ps1](./Scripts/Start-OutOfOfficeAssistant/Start-OutOfOfficeAssistant.ps1)

Das interaktive Skript hilft IT-Verantwortlichen beim setzen des Abwesenheitsassistenten. Benötigt wird nur PowerShell Version 5+, ein Exchange-Server und eine .txt Datei mit der gewünschten Nachricht.

### [doc2pdf.ps1](./Scripts/doc2pdf/doc2pdf.ps1)

Das Skript konvertiert alle .doc und .docx Dateien in einem Verzeichnis in.pdf Dateien.

### [Get-WifiPasswords.ps1](./Scripts/Get-WifiPasswords/Get-WifiPasswords.ps1)

Das Skript listet alle gespeicherten WLAN-Netze mit den gespeicherten Passwörtern auf. Auf einem englischen System muss das Wort "Schlüsselinhalt" gegen "keyvalue" ausgetauscht werden.

## [Profile](./Scripts/Profile/Microsoft.PowerShell_profile.ps1)

Mein Standardprofil für die PowerShell.
