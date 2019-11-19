#requires -version 5
<#
.SYNOPSIS
  Report-Snapshots.ps1 generates a report of all snapshots and send the report as E-Mail.
.DESCRIPTION

.INPUTS
  
.OUTPUTS
  
.NOTES
  Version:        1.0
  Author:         myztic@gmx.net
  Creation Date:  2019-11-19
  Purpose/Change: Initial script development
  
.EXAMPLE
  Report-Snapshots.ps1
  This command create a report and send it to all recipients in $MailRecipients
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

$vcenter = 'vcenter'
$TXTPath = 'C:\temp\temp.html'
$date = Get-Date -Format "yyyy-MM-dd, HH:mm"
$AllSnapshots = ''
$utf8 = New-Object System.Text.utf8encoding
$MailServer = 'SMTP Server'
$MailRecipient = 'Recipient'
$MailSender = 'Sender'

#-----------------------------------------------------------[HTML and CSS]------------------------------------------------------------

$Post = "<h3>Created on " + "$date" + " by $env:USERNAME</h3>"
$head = "<style>
td { width:100px; max-width:300px; background-color:lightblue; }
table { width:100%; }
th { font-size:14pt; background-color:blue; }
</style>"

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Import-Module VMware.PowerCLI
Connect-VIServer $vcenter

Get-VM |
Get-Snapshot |
Select-Object VM, Name, Description, @{Label = "Size"; Expression = { " { 0:N2 } MB" -f ($_.SizeMB) } }, Created |
ConvertTo-Html -head $head -Post $Post -Title 'Snapshot Report' -PreContent "<h1>Snapshot report of $vcenter</h1>" |
Out-File $TXTPath
$AllSnapshots = Get-Content $TXTPath | Out-String
Send-MailMessage -SmtpServer $MailServer -To $MailRecipient -From $MailSender -Subject 'Snapshot report from 5100S-VC1' -Body $AllSnapshots -BodyAsHtml -Encoding $utf8 

Remove-Item -Path $TXTPath
#-----------------------------------------------------------[EOF]------------------------------------------------------------------