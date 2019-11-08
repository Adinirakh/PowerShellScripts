
$SMTPServer = "outlook.jmrlp.de"
<# $username = "min\helpdesk"
$password = ConvertTo-SecureString "Eg1UHD" -AsPlainText -Force #>
$From = "helpdesk@jm.rlp.de"
$To = "sven.schaedlich@jm.rlp.de", "matthias.stubenvoll@jm.rlp.de", "fabio.clemenz@jm.rlp.de"
$Subject = "Periodic report of snapshots"
<# $Body = @"
Im Anhang befindet sich der aktuelle Report.
Nach überprüfung kann dieser Archiviert werden.
"@ #>
$Attachments = "\\5100S-MON1.justiz.jmrlp.de\SnapshotReport\SnapshotReport.html"
$Vcenter = '5100S-VC1'
$OutFile = '\\5100S-MON1.justiz.jmrlp.de\SnapshotReport\SnapshotReport.html'
$date = Get-Date
$Pre = '<img src="\\5100S-MON1.justiz.jmrlp.de\SnapshotReport\logo_klein.png" alt="ISD-Logo" align=right ><h1>List of Snapshots at 5100S-VC1</h1>'
$Post = "<h3>Created on " + "$date" + " by Sven Schaedlich</h3>"
$head = @"
<!DOCTYPE HTML PUBLIC ?-//W3C//DTD HTML 4.01 Frameset//EN? ?http://www.w3.org/TR/html4/frameset.dtd?&gt;
<html><head><title>List of current Snapshots</title><meta http-equiv=?refresh? content=?120? />
<style>

BODY {
    background-color: white;
    font-family: Verdana, Geneva, Arial, Helvetica, sans-serif;
    }
    
#report {
    width: 835px;
    }

TABLE {
    border-collapse: collapse;
    border: none;
    font: 10pt Verdana, Geneva, Arial, Helvetica, sans-serif;
    color: black;
    margin-bottom: 10px;
    }
    
table th {
    font-size: 12px;
    font-weight: bold;
    padding-left: 0px;
    padding-right: 20px;
    text-align: left;
    }
    
table td{
    font-size: 12px;
    padding-left: 0px;
    padding-right: 20px;
    text-align: left;
    }
    
h2 {
    clear: both;
    font-size: 130%;
    color:#354B5E;
    }

h3 {
    clear: both;
    font-size: 75%;
    margin-left: 20px;
    margin-top: 30px;
    color:#475F77;
    }

p {
    margin-left: 20px;
    font-size: 12px;
    }
    
table.list {
    float: left;
    }

table.list td:nth-child(1) {
    font-weight: bold;
    border-right: 1px grey solid;
    text-align: right;
    }

table.list td:nth-child(2){ padding-left: 7px; }
table tr:nth-child(even) td:nth-child(even){ background: #BBBBBB; }
table tr:nth-child(odd) td:nth-child(odd){ background: #F2F2F2; }
table tr:nth-child(even) td:nth-child(odd){ background: #DDDDDD; }
table tr:nth-child(odd) td:nth-child(even){ background: #E5E5E5; }
div.column { width: 320px; float: left; }
div.first{ padding-right: 20px; border-right: 1px grey solid; }
div.second{ margin-left: 30px; }
table{ margin-left: 20px; }

</style>
"@

# Verbindung mit vCenter aufnehmen
Write-Host 'PowerCLI laden'
Add-PSSnapin vmware.vimautomation.core

Write-Host 'mit vCenter verbinden'
Connect-VIServer $VCenter


Write-Host 'Report erstellen'
Get-VM | Get-Snapshot | Select-Object VM, Name, @{Label = "Size"; Expression = { "{0:N2} MB" -f ($_.SizeMB) } }, Created, IsCurrent | ConvertTo-Html -head $head -pre $Pre -Post $Post | Out-File $OutFile

Write-Host 'Report als Mail verschicken'
# $creds = New-Object System.Management.Automation.PSCredential ($username, $password)

$AttachmentsAsHTLM = Get-Content $Attachments | Out-String
Send-MailMessage -To $To -From $From -Subject $Subject -Body $AttachmentsAsHTLM -BodyAsHtml -SmtpServer $SMTPServer -Encoding ([System.Text.Encoding]::UTF8)