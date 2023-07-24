$sharedFolderPath = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""

#import logging
. $sharedFolderPath"\Scripts\logFunctions.ps1"

$filePath = "$sharedFolderPath\Today.pptx"
$scriptPath = "$sharedFolderPath\Scripts\rebootSlideshow.ps1"
$previousHash = ""

WriteLog ">>> waitForChange.ps1"

#enters an infinite loop to continuously check for changes
WriteLog "Starting file listener"
while ($true) {
    #get the current hash of the file
    $currentHash = Get-FileHash -Path $filePath -Algorithm MD5 | Select-Object -ExpandProperty Hash

    # Compare the current hash with the previous hash
    if ($currentHash -ne $previousHash) {
        #executes when file changed
        WriteLog "File has been changed"
        & $scriptPath
    }

    #stores the current hash as the previous hash for the next iteration
    $previousHash = $currentHash

    #delays the script
    Start-Sleep -Seconds 5
}

WriteLog "<<< waitForChange.ps1"