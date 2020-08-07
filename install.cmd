@echo off
color 1F
echo.
Set-ExecutionPolicy -Scope CurrentUser Unrestricted

git clone -q https://github.com/powerline/fonts %USERPROFILE%\Downloads\fonts
git clone -q https://github.com/casjay-systems/windows %USERPROFILE%\Downloads\windows /n

powershell.exe %USERPROFILE%\Downloads\windows\src\os\just-install.exe

powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\scoop.ps1"
powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\chocolatey.ps1"
powershell.exe -ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\fonts\install.ps1"

Install-Module -Name PowerShellForGitHub
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser
Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck

Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Paradox

nvm install node@13.12.0
