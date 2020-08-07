
Set-ExecutionPolicy -Scope CurrentUser Unrestricted

git clone -q https://github.com/powerline/fonts %USERPROFILE%\Downloads\fonts
git clone -q https://github.com/casjay-systems/windows %USERPROFILE%\Downloads\windows

Start-Process %USERPROFILE%\Downloads\windows\src\os\just-install.exe -NoNewWindow -Wait

ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\scoop.ps1"
ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\windows\src\os\chocolatey.ps1"
ExecutionPolicy Bypass -File "%USERPROFILE%\Downloads\fonts\install.ps1"

Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name PowerShellForGitHub
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Paradox

nvm install node@13.12.0
