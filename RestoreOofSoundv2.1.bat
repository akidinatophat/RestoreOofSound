@echo off
title RestoreOofSound v2.1
echo Getting Roblox Version...
powershell "$json = Invoke-WebRequest https://clientsettings.roblox.com/v2/client-version/WindowsPlayer; $verupload = ConvertFrom-Json $json; $verupload.clientVersionUpload | Out-File C:\Users\$env:UserName\tempcurrentverupload.txt"
cd C:\Users\%USERNAME%
FOR /F "tokens=* USEBACKQ" %%F IN (`type tempcurrentverupload.txt`) DO (
SET CurrentVersionUpload=%%F
)
if exist "C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\%CurrentVersionUpload%\RobloxPlayerLauncher.exe" (
echo Changing death sound...
del C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\%CurrentVersionUpload%\content\sounds\ouch.ogg
curl -s -L https://github.com/akidinatophat/RestoreOofSound/raw/main/ouch.ogg --output C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\%CurrentVersionUpload%\content\sounds\ouch.ogg
color 2
echo Success!
del C:\Users\%USERNAME%\tempcurrentverupload.txt
pause
exit
) else (
color 4
echo ERROR: Outdated Roblox Version! Please update your Roblox client!
del C:\Users\%USERNAME%\tempcurrentverupload.txt
pause
exit
)
