@echo off
color 1F
echo.
powershell.exe -Command Invoke-WebRequest https://github.com/casjay-systems/windows/raw/master/src/os/just-install.exe -o %USERPROFILE%\Downloads\just-install.exe

%USERPROFILE%\Downloads\just-install.exe /qn

git clone -q https://github.com/powerline/fonts %USERPROFILE%\Downloads\fonts
git clone -q https://github.com/casjay-systems/windows %USERPROFILE%\Downloads\windows

powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\scoop.ps1"
powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\chocolatey.ps1"
powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\fonts\install.ps1"

Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck

Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Powerlevel10k-Classic

nvm install node@13.12.0
