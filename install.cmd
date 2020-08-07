Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force

Start-Process git "clone -q https://github.com/powerline/fonts $env:userprofile\Downloads\fonts" -NoNewWindow -Wait
Start-Process git "clone -q https://github.com/casjay-systems/windows $env:userprofile\Downloads\windows" -NoNewWindow -Wait

Invoke-Expression $env:userprofile\Downloads\windows\src\os\just-install.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\scoop.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\chocolatey.ps1
Invoke-Expression $env:userprofile\Downloads\fonts\install.ps1

Install-Module -Name PSReadLine -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name PowerShellForGitHub
Install-Module posh-git -Scope CurrentUser
Install-Module oh-my-posh -Scope CurrentUser

Import-Module posh-git
Import-Module oh-my-posh

Set-Theme Paradox

nvm install node@13.12.0
