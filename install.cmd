
Set-ExecutionPolicy -Scope CurrentUser Unrestricted

Start-Process git "clone -q https://github.com/powerline/fonts $env:userprofile\Downloads\fonts" -NoNewWindow -Wait
Start-Process git "clone -q https://github.com/casjay-systems/windows $env:userprofile\Downloads\windows" -NoNewWindow -Wait

Start-Process "$env:userprofile\Downloads\windows\src\os\just-install.ps1" -NoNewWindow -Wait

Start-Process "$env:userprofile\Downloads\windows\src\os\scoop.ps1" -NoNewWindow -Wait
Start-Process "$env:userprofile\Downloads\windows\src\os\chocolatey.ps1" -NoNewWindow -Wait 
Start-Process "$env:userprofile\Downloads\fonts\install.ps1" -NoNewWindow -Wait

Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name PowerShellForGitHub
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Paradox

nvm install node@13.12.0
