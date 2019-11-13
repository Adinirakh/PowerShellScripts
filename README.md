# PowerShellScripts

Eine Sammlung der Skripte die ich regelmäßig benutze. Sie sind nicht schön, aber sie funktionieren.

## Skripte für die PowerCLi von VMWare

### Get-VMwareTask.ps1

Dieses Skript fragt einen Task im vCenter regelmäßig ab und schickt eine E-Mail wenn dieser Task
beendet ist.

### Create-Snapshots.ps1

Das Skript fährt alle virtuellen Maschinen aus der Datei stopVMs.txt herunter, erstellt Snapshots
der Maschinen und fährt diese dann in der Reihenfolge wie in der Datei startVMs.txt angegeben
wieder hoch.

### Get-SnapshotReport.ps1

Erstellt einen Bericht über alle Snapshots und verschickt diesen Bericht als E-Mail an definierte
Benutzer.

### Install-PersonalEnviroment.ps1

Das Skript installiert meine Standard Programme auf einem frischen Windows 10 Computer.
