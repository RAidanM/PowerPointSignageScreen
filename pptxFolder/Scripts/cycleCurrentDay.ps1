#defining variables
$root = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""
$date = Get-Date -Format "dddd"
$yesterday = (Get-Date).AddDays(-1).ToString('dddd MM-dd-yyyy')
$todayPath = $root+"\Today.pptx"

#setting error action preference
$ErrorActionPreference = 'SilentlyContinue'

#import logging
. $root"\Scripts\logFunctions.ps1"

#archive yesterday show
WriteLog ">>> cycleCurrentDay.ps1"
WriteLog "Today is $date"

WriteLog "Archiving yesterday show"
if(Test-Path -Path $todayPath -PathType Leaf){

    $yesterday = (Get-Date).AddDays(-1).ToString('dddd MM-dd-yyyy')

    Copy-Item $todayPath -Destination $root"\ARCHIVE\"$yesterday".pptx"
    Start-Sleep -Milliseconds 100
    

    Remove-Item $todayPath
    Start-Sleep -Milliseconds 100
    WriteLog "SUCCESS"
}
else{
    WriteLog "!!! Can't find yesterday's show"
}

#creating new show
WriteLog "Attempting to select and copy new show"
if (Test-Path -Path $root"\Days\"$date".pptx" -PathType Leaf) {
    Copy-Item $root"\Days\"$date".pptx" -Destination $root"\Today.pptx"
    WriteLog "SUCCESS"
}
else {
    WriteLog "!!! Unable to find path to today's show"
}

WriteLog "<<< cycleCurrentDay.ps1"