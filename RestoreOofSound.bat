@echo off
echo Changing death sound...
set "LOCATION=C:\Users\%USERNAME%\AppData\Local\Roblox\Versions\version-9045f70ea522489c\content\sounds"
del %LOCATION%\ouch.ogg
curl -s https://hatto.us/storage/ouch.ogg --output %LOCATION%\ouch.ogg
echo Success!
pause
exit