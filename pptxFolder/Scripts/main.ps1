#importing scripts
$scripts = $MyInvocation.MyCommand.Path -replace ($MyInvocation.MyCommand.Name),""
$scriptOneLocation = $scripts+"/cycleCurrentDay.ps1"
$scriptTwoLocation = $scripts+"/waitForChange.ps1"
. $scripts"/logFunctions.ps1"

WriteLog ">>> main.ps1"

WriteLog "Running script 1/2"
& $scriptOneLocation

WriteLog "Running script 2/2"
& $scriptTwoLocation

WriteLog "<<< main.ps1"