<#
This script should be run everytime a change is made to the Today.pptx file
This script:
    Restarts the current show
    Often used when the current show has been modified
#>

#defining variables
$root = "C:\Users\raida\OneDrive\Desktop\pptxFolder"

#script start
#kill current running powerpoint
Stop-Process -Name POWERPNT -Force
Start-Sleep -Milliseconds 100

#remove old show
Remove-Item $root"\CurrentShow.pps"

#make new show
Copy-Item $root"\Today.pptx" -Destination $root"\CurrentShow.pps"

#start new show
Start-Process $root"\CurrentShow.pps"