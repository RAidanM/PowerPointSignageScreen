
$root = $MyInvocation.MyCommand.Path -replace ("\\Scripts\\"+$MyInvocation.MyCommand.Name),""

function WriteLog
{
    Param ([string]$LogString)
    
    $today = (Get-Date).ToString("yyyy-MM-dd")
    $logFile = $root+"\LOGS\"+$today+".txt"
    $fileExists = Test-Path -Path $logFile -PathType Leaf

    if (!$fileExists) {
        New-Item $logFile
    }

    $Stamp = (Get-Date).toString("yyyy/MM/dd HH:mm:ss")
    $LogMessage = "$Stamp $LogString"
    Write-Host "Logged message: " $LogMessage
    Add-content $logFile -value $LogMessage
}