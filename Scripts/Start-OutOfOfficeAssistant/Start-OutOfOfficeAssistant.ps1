<#
.SYNOPSIS
  Überprüft, setzt oder deaktiiert die Abwesenheitsnachricht für ein Exchange Postfach.
.DESCRIPTION
  Das interaktive Skript hilft IT-Verantwortlichen beim setzen des
Abwesenheitsassistenten. Benötigt wird nur PowerShell Version 5+, ein
Exchange-Server und eine .txt Datei mit der gewünschten Nachricht. Vor der
ersten Nutzung müssen folgende Variablen im Skript angepasst werden:

$outlookURI: Hier muss die URI der Exchange PowerShell angegeben werden. Sollte
ein Loadbalancer genutzt werden, kann es sein, dass man direkt mit einem
Exchange-Server verbinden muss. Die Angabe muss im Format wie folgt aussehen:\
*http://Exchange/PowerShell*

$MBXServer: FQDN des genutzten Exchang-Server\
*Server.domain.tld*

Nach dem Ausführen des Skripts, bitte den Anweisungen auf dem Bildschirm folgen.
.PARAMETER
  None
.INPUTS
  None
.OUTPUTS
  None
.NOTES
  Version:        1.0
  Author:         myztic@gmx.net
  Creation Date:  2020-02-13
  Purpose/Change: Initial script Deployment

  Version:        1.1
  Author:         myztic@gmx.net
  Creation Date:  2020-02-17
  Purpose/Change: Creating help file
.EXAMPLE
  None
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

$outlookURI = "http://exchange/PowerShell"
$MBXServer = "exchange1.domain.tld"

################################################## Do not touch behind this line! #################################################

$credentials = Get-Credential
$exchangeSession = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri $outlookURI -Authentication Kerberos -Credential $credentials -AllowRedirection
$sessionID = Get-PSSession | Where-Object ComputerName -Match $MBXServer | Select-Object ID | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | ForEach-Object { $_ -replace '"', "" }

#-----------------------------------------------------------[Functions]------------------------------------------------------------

function Show-Menu {
    param (
        [string]$Title = 'My Menu'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1: Drücke '1' um die AutoReplyConfiguration für einen Benutzer anzuzeigen."
    Write-Host "2: Drücke '2' um die AutoReplyConfiguration für einen Nutzer zu aktivieren."
    Write-Host "3: Drücke '3' um die AutoReplyConfiguration für einen Nutzer zu deaktivieren."
    Write-Host "Q: Drücke 'Q' um das Skript zu beenden."
}

function Get-Option1 {
    $mailbox = Read-Host 'Geben Sie eine Mailbox an'
    $AutoReplyState = Get-MailboxAutoReplyConfiguration -Identity $mailbox | Select-Object AutoReplyState | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | ForEach-Object { $_ -replace '"', "" }
    "Der Abwesenheitsassistent ist $AutoReplyState.`n"
}

function Get-Option2 {
    $mailbox = Read-Host 'Geben Sie eine Mailbox an'
    $pathToText = Read-Host 'Geben Sie den Pfad zur Abwesenheitsnachricht an'
    $autoReplyMessage = Get-Content $pathToText
    Set-MailboxAutoReplyConfiguration -Identity $mailbox -InternalMessage $autoReplyMessage -ExternalAudience None -AutoReplyState Enabled
}

function Get-Option3 {
    $mailbox = Read-Host 'Geben Sie eine Mailbox an'
    Set-MailboxAutoReplyConfiguration -Identity $mailbox -AutoReplyState Disabled
    $AutoReplyState = Get-MailboxAutoReplyConfiguration -Identity $mailbox | Select-Object AutoReplyState | ConvertTo-Csv -NoTypeInformation | Select-Object -Skip 1 | ForEach-Object { $_ -replace '"', "" }
    "Der Abwesenheitsassistent ist $AutoReplyState.`n"
}

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Import-PSSession $exchangeSession -DisableNameChecking
Set-ADServerSettings -ViewEntireForest $true
Clear-Host

do {
    Show-Menu -Title "Auswahlmenü"
    $selection = Read-Host "Treffe eien Auswahl"
    switch ($selection) {
        '1' { 
            Get-Option1
            Pause
        }
        '2' {
            Get-Option2
            Pause
        }
        '3' {
            Get-Option3
            Pause
        }
    }
}
until ($selection -eq 'q')
Remove-PSSession -Id $sessionID

#-----------------------------------------------------------[EOF]------------------------------------------------------------------