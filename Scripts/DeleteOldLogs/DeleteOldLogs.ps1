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
  Creation Date:  2020-05-22
  Purpose/Change: Initial script development
  
.EXAMPLE
  DeleteOldLogs.ps1
  Search one ore more directories and deletes all log and blk files older than 90 days..
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

#Global Variables

#-----------------------------------------------------------[Functions]------------------------------------------------------------

#-----------------------------------------------------------[Execution]------------------------------------------------------------



Get-ChildItem 'C:\Program Files\Microsoft\Exchange Server\V15\Logging','C:\Inetpub\Logs' -Directory |
    Get-ChildItem -Include '*.log','*.blg' -Recurse |
        Where-Object LastWriteTime -lt (Get-Date).AddDays(-90) |
            Remove-Item