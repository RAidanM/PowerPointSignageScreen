<#
This script should be run everytime a change is made to the Today.pptx file
This script:
    Restarts the current show
    Often used when the current show has been modified
#>

#setting error action preference
$ErrorActionPreference = 'SilentlyContinue'

#defining variables
$root = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""

#import log
. $root"\Scripts\logFunctions.ps1"

#script start
#kill current running powerpoint
Stop-Process -Name POWERPNT -Force
Start-Sleep -Milliseconds 100

#remove old show
WriteLog "Removing old show"
Remove-Item $root"\CurrentShow.pps"

WriteLog "Starting Show"
try {
    #make new show
    Copy-Item $root"\Today.pptx" -Destination $root"\CurrentShow.pps"

    #start new show
    Start-Process $root"\CurrentShow.pps"
}
catch {
    Write-Host "Unable to start show"
}