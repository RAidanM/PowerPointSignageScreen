<#
This script should be run once per day after midnight
This script:
    Archives previous show
    Replaces with the a new show from the current day
#>

#defining variables
$root = "C:\Path\to\pptxFolder"
$date = Get-Date -Format "dddd"
$yesterday = (Get-Date).AddDays(-1).ToString('dddd MM-dd-yyyy')

#script start
#archive yesterday show
Copy-Item $root"\Today.pptx" -Destination $root"\ARCHIVE\"$yesterday".pptx"
Start-Sleep -Seconds 1

#remove yesterday show
Remove-Item $root"\Today.pptx"
Start-Sleep -Seconds 1

#select and copy new show
Copy-Item $root"\"$date"\"$date".pptx" -Destination $root"\Today.pptx"