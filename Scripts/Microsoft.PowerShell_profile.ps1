#Variablen definieren
$PSEmailServer = "smtp.mail.server"

#Aliase setzen
Set-Alias -Name TN -value Test-Connection -Description "own: Test-Connection"
Set-Alias -Name o -value Start-Process -Description "own: Start-Process"

#Prompt anpassen
$global:CurrentUser = [System.Security.Principal.WindowsIdentity]::GetCurrent()
function prompt {
  $host.ui.rawui.WindowTitle = $CurrentUser.Name + " " + $Host.Name + " " + $Host.Version + " Line: " + $host.UI.RawUI.CursorPosition.Y
  Write-Host ("" + $(get-location) + "`n~") -NoNewline -foregroundcolor "Magenta"
  return " "
  $host.ui.rawui.BackgroundColor = "Black"
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}

#PromptPfad setzen
Set-Location C:\

#Bereinigung des Bildschirms
#Clear-Host

#MotD
Write-Host Hallo $CurrentUser.Name -ForegroundColor Cyan
Write-Host "Es ist der"$(Get-date)"und du befindest dich an $(hostname)." -ForegroundColor Cyan

#EOF