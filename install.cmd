Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force

Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart

Start-Process git "clone -q https://github.com/powerline/fonts $env:userprofile\Downloads\fonts" -NoNewWindow -Wait
Start-Process git "clone -q https://github.com/casjay-systems/windows $env:userprofile\Downloads\windows" -NoNewWindow -Wait

Copy-Item -Path "$env:userprofile\Downloads\windows\src\git\*" -Destination "$env:userprofile" -Recurse -Force
Copy-Item -Path "$env:userprofile\Downloads\windows\src\bash\*" -Destination "$env:userprofile" -Recurse -Force
Copy-Item -Path "$env:userprofile\Downloads\windows\src\powershell\*" -Destination "$env:userprofile\Documents\PowerShell" -Recurse -Force
Copy-Item -Path "$env:userprofile\Downloads\windows\src\powershell\*" -Destination "$env:userprofile\Documents\WindowsPowerShell" -Recurse -Force

Invoke-Expression $env:userprofile\Downloads\fonts\install.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\scoop.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\just-install.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\chocolatey.ps1

Install-Module -Name PSReadLine -Force -SkipPublisherCheck
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Install-Module -Name PowerShellForGitHub -Force
Install-Module posh-git -Force
Install-Module oh-my-posh -Force

Set-Theme Paradox

nvm install node@13.12.0
