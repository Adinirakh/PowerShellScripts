<#
.SYNOPSIS
  This simple PowerShell script will read through a directory and convert all Microsoft Word files (.doc, .docm and .docx) into PDF files.
.DESCRIPTION

.INPUTS
  
.OUTPUTS
  
.NOTES
  Version:        1.0
  Author:         myztic@gmx.net
  Creation Date:  2020-03-18
  Purpose/Change: Initial script development
  
.EXAMPLE
  doc2pdf.ps1
  This command converts word documents to pdf.
#>

#---------------------------------------------------------[Initialisations]--------------------------------------------------------

#Set Error Action to Silently Continue
$ErrorActionPreference = "SilentlyContinue"

#----------------------------------------------------------[Declarations]----------------------------------------------------------

$path = "C:\temp\docs" 
$word_app = New-Object -ComObject Word.Application

#-----------------------------------------------------------[Execution]------------------------------------------------------------

Get-ChildItem -Path $path -Filter *.doc? | ForEach-Object {
    $document = $word_app.Documents.Open($_.FullName)
    $pdf_filename = "$($_.DirectoryName)\$($_.BaseName).pdf"
    $document.SaveAs([ref] $pdf_filename, [ref] 17)
    $document.Close()
}
$word_app.Quit()

#-----------------------------------------------------------[EOF]------------------------------------------------------------------