<#
This script should be run once per day after midnight
This script:
    Archives previous show
    Replaces with the a new show from the current day
#>

#defining variables
$root = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""
$date = Get-Date -Format "dddd"
$yesterday = (Get-Date).AddDays(-1).ToString('dddd MM-dd-yyyy')

#setting error action preference
$ErrorActionPreference = 'SilentlyContinue'

#import logging
. $root"\Scripts\logFunctions.ps1"

#archive yesterday show
$todayPath = $root+"\Today.pptx"

if(Test-Path -Path $todayPath -PathType Leaf){
    WriteLog "Archiving yesterday show"

    $yesterday = (Get-Date).AddDays(-1).ToString('dddd MM-dd-yyyy')

    Copy-Item $todayPath -Destination $root"\ARCHIVE\"$yesterday".pptx"
    Start-Sleep -Seconds 1

    Remove-Item $todayPath
    Start-Sleep -Seconds 1
}
else{
    WriteLog "Can't find previous show"
}


#select and copy new show
WriteLog "Selecting and copying new show"

Try {
    Copy-Item $root"\Days\"$date".pptx" -Destination $root"\Today.pptx"
}
Catch {
    WriteLog "Unable to find path to today's show"
}