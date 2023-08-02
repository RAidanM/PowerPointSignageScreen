## PowerPoint Signage Screen

The goal of this project is to turn a dedicated PC into a signage screen using PowerPoint. This project was setup to be used on a shared folder network.

It uses PowerShell, PowerPoint, and optionally a shared folder to modify the folder remotely.

⭐ Fully automated

⭐ Separate presentations for each day of the week

⭐ Live changing without touching the signage screen's dedicated computer if you are using a shared folder

I published my work on this to aid others who need to set this up themselves so that they may avoid the headaches I went through developing it.

## Installation

Download this project and put it into any folder or shared folder where you want it to be run.

Next, you'll need to ensure scripts can be run on this computer. To do this, run each PowerShell script inside of the project found at *\\pptxFolder\Scripts*. If prompted for what permission option, press 'A' then hit enter which will properly set the correct permission level.

NOTE: MegaSync broke my program and it only worked once I switched to a locally shared folder on my building's network. I would assume that other cloud folders might also encounter issues. My assumption on the issue is my scripts add and remove files with the same name rather quickly which might be confusing backup software. Possible adding time between actions may solve the issue.

Next, we will setup a daily task with Windows Task Scheduler. You can use this guide if you haven't used Task Scheduler for PowerShell before. \
https://blog.netwrix.com/2018/07/03/how-to-automate-powershell-scripts-with-task-scheduler  
The script you'll want to run daily will be *main.ps1*. Note whenever the task is run, it switches to the next day so only have it trigger at the start of each day.

This should be the end of setup. Close everything and let the task start up the script so as to not confuse Task Scheduler. You may test the task by hitting the "Run Task" button.

## Usage

You can change the PowerPoints inside of the *\Days* folder to whatever show you want to appear for each day. 

EG: Whatever you put as *Wednesday.pptx* will show every Wednesday until you change its contents again.

To change the show that is currently on the screen, modify *pptxFolder\Today.pptx*. Once you have modified the file, it will close the current show automatically and then reopen your now-modified show.

NOTE: It will NOT change the original day folder show. EG: let's say it is a Friday and you need to add a birthday slide. You would open *Today.pptx* and add your slide and save it. Now, your slide would show on the screen for the day however it would not change your original *Friday.pptx* file.

If you want to see previous shows from past days, all old shows are moved to *pptxFolder\ARCHIVE* and labelled with the date they are from.

Log files for each action of the program are stored inside of *pptxFolder\LOGS* and labelled with the current date. These files assist in troubleshooting what the PowerShell scripts are attempting to do and what they are doing.

## Support

If you have any questions, comments, and/or concerns please reach out to me at my email:
r.adian.mealey@gmail.com 
