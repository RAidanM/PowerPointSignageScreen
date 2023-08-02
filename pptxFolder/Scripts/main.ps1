#this is the script you want to run using task schedule on a daily timer

#importing scripts
$scripts = $MyInvocation.MyCommand.Path -replace ($MyInvocation.MyCommand.Name),""
$scriptOneLocation = $scripts+"/cycleCurrentDay.ps1"
$scriptTwoLocation = $scripts+"/waitForChange.ps1"
. $scripts"/logFunctions.ps1"

#running scripts
WriteLog ">>> main.ps1"

WriteLog "Running script 1/2"
& $scriptOneLocation

WriteLog "Running script 2/2"
& $scriptTwoLocation

WriteLog "<<< main.ps1"