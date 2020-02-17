#requires -version 5
<#
.SYNOPSIS
  
.DESCRIPTION
  <Brief description of script>
.PARAMETER
    TaskID - Needed for checking the task.
.INPUTS
  <Inputs if any, otherwise state None>
.OUTPUTS
  <Outputs if any, otherwise state None>
.NOTES
  Version:        1.0
  Author:         myztic@gmx.net
  Creation Date:  2019-11-08
  Purpose/Change: Initial script development
  
.EXAMPLE
  Get-VMwareTask.ps1 -TaskID Task-task-310923
  Checks the task with the ID Task-task-310923
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Global Variables

#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------

param (
    [Parameter(Mandatory = $true)]
    [String]$TaskID
)
do {
    $a = Get-Task -Id $TaskID
    if ($a.PercentComplete -gt 99) {
        Send-MailMessage -SmtpServer "smtp.yourserver.tld" -to "your@mail.address" -from "from@mail.address" -Subject "Die Aufgabe ist Fertig" -Body "Hallo, der Auftrag wurde abgearbeitet." -UseSsl
        $x = 1
    }
    else {
        Write-Output $a.PercentComplete
        Start-Sleep -s 30
    } 
}
until ($x -gt 0)

#-----------------------------------------------------------[EOF]------------------------------------------------------------------