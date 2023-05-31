<#
This script should be run once per day after midnight
This script:
    Archives previous show
    Replaces with the a new show from the current day
#>

#setting error action preference
$ErrorActionPreference = 'SilentlyContinue'

#defining variables
$root = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""
$date = Get-Date -Format "dddd"
$yesterday = (Get-Date).AddDays(-1).ToString('dddd MM-dd-yyyy')

#script start
#archive yesterday show

Copy-Item $root"\Today.pptx" -Destination $root"\ARCHIVE\"$yesterday".pptx"
Start-Sleep -Seconds 1

Remove-Item $root"\Today.pptx"
Start-Sleep -Seconds 1

#select and copy new show
Try {
    Copy-Item $root"\Days\"$date".pptx" -Destination $root"\Today.pptx"
}
Catch {
    Write-Host "Unable to find path to today's show"
}