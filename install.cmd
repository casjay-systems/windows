@echo off
color 1F
echo.
powershell.exe -Command Invoke-WebRequest https://github.com/casjay-systems/windows/raw/master/src/os/just-install.exe -o %USERPROFILE%\Downloads\just-install.exe
%USERPROFILE%\Downloads\just-install.exe /qn
git clone -q https://github.com/casjay-systems/windows %USERPROFILE%\Downloads\windows
powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\scoop.ps1"

