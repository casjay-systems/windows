Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force

Start-Process git "clone -q https://github.com/powerline/fonts $env:userprofile\Downloads\fonts" -NoNewWindow -Wait
Start-Process git "clone -q https://github.com/casjay-systems/windows $env:userprofile\Downloads\windows" -NoNewWindow -Wait

Invoke-Expression $env:userprofile\Downloads\windows\src\os\just-install.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\scoop.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\chocolatey.ps1
Invoke-Expression $env:userprofile\Downloads\fonts\install.ps1

Install-Module -Name PSReadLine -Force -SkipPublisherCheck -y
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force -y

Install-Module -Name PowerShellForGitHub -Force -y
Install-Module posh-git -Force -y
Install-Module oh-my-posh -Force -y

Set-Theme Paradox

nvm install node@13.12.0
