<#
This script should be run once per day after midnight
It will then run continuously until the next day
This script:
    Checks for any change in the show's file
        if change, then it runs the rebootSlideshow.ps1 script
#>

$sharedFolderPath = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""

#import logging
. $sharedFolderPath"\Scripts\logFunctions.ps1"

$filePath = "$sharedFolderPath\Today.pptx"
$scriptPath = "$sharedFolderPath\Scripts\rebootSlideshow.ps1"
$previousHash = ""

#sript start
#enters an infinite loop to continuously check for changes
while ($true) {
    #get the current hash of the file
    $currentHash = Get-FileHash -Path $filePath -Algorithm MD5 | Select-Object -ExpandProperty Hash

    # Compare the current hash with the previous hash
    if ($currentHash -ne $previousHash) {
        #executes when file changed
        WriteLog "File change"
        & $scriptPath
    }

    #stores the current hash as the previous hash for the next iteration
    $previousHash = $currentHash

    #delays the script
    Start-Sleep -Seconds 5
}