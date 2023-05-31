

#importing scripts
$scripts = $MyInvocation.MyCommand.Path -replace ($MyInvocation.MyCommand.Name),""
$scriptOneLocation = $scripts+"/cycleCurrentDay.ps1"
$scriptTwoLocation = $scripts+"/waitForChange.ps1"
. $scripts"/logFunctions.ps1"

WriteLog "Program Start"

WriteLog "Running script 1/2"
& $scriptOneLocation

WriteLog "Running script 2/2"
& $scriptTwoLocation

WriteLog "Program End"