@echo off
title RestoreOofSound v2.2
echo Getting Roblox Version...
powershell "$json = Invoke-WebRequest https://clientsettings.roblox.com/v2/client-version/WindowsPlayer; $verupload = ConvertFrom-Json $json; $verupload.clientVersionUpload | Out-File $env:USERPROFILE\tempcurrentverupload.txt"
cd %USERPROFILE%
FOR /F "tokens=* USEBACKQ" %%F IN (`type tempcurrentverupload.txt`) DO (
SET CurrentVersionUpload=%%F
)
if exist "%USERPROFILE%\AppData\Local\Roblox\Versions\%CurrentVersionUpload%\RobloxPlayerLauncher.exe" (
echo Changing death sound...
del %USERPROFILE%\AppData\Local\Roblox\Versions\%CurrentVersionUpload%\content\sounds\ouch.ogg
curl -s -L https://github.com/akidinatophat/RestoreOofSound/raw/main/ouch.ogg --output %USERPROFILE%\AppData\Local\Roblox\Versions\%CurrentVersionUpload%\content\sounds\ouch.ogg
color 2
echo Success!
del %USERPROFILE%\tempcurrentverupload.txt
pause
exit
) else (
color 4
echo ERROR: Outdated Roblox Version! Please update your Roblox client!
del %USERPROFILE%\tempcurrentverupload.txt
pause
exit
)
