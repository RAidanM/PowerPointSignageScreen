#setting error action preference
$ErrorActionPreference = 'SilentlyContinue'
#defining variables
$root = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""
#import log
. $root"\Scripts\logFunctions.ps1"

WriteLog ">>> rebootSlideshow.ps1"

#kill current running powerpoint
WriteLog "Killing active show"
get-process powerpnt |stop-process
Start-Sleep -Milliseconds 100

#remove old show
WriteLog "Attempting to remove old CurrentShow.pps"
if (Test-Path -Path $root"\CurrentShow.pps" -PathType Leaf) {
    Remove-Item $root"\CurrentShow.pps"
    WriteLog "SUCCESS"
}
else{
    WriteLog "!!! CurrentShow.pps does not exist"
}

#creating show
WriteLog "Attempting to set new CurrentShow.pps from Today.pptx"
if (Test-Path -Path $root"\Today.pptx" -PathType Leaf) {
    Copy-Item $root"\Today.pptx" -Destination $root"\CurrentShow.pps"
    WriteLog "SUCCESS"
}
else{
    WriteLog "!!! Today.pptx does not exist"
}

#running the new show
WriteLog "Starting Currentshow.pps"
Start-Process $root"\CurrentShow.pps"

WriteLog "<<< rebootSlideshow.ps1"