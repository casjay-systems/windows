Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Bypass -Force

Start-Process git "clone -q https://github.com/powerline/fonts $env:userprofile\Downloads\fonts" -NoNewWindow -Wait
Start-Process git "clone -q https://github.com/casjay-systems/windows $env:userprofile\Downloads\windows" -NoNewWindow -Wait

Copy-Item -Path "src\bash\*" -Destination "$env:userprofile" -Recurse
Copy-Item -Path "src\git\*" -Destination "$env:userprofile" -Recurse
Copy-Item -Path "src\powershell\*" -Destination "$env:userprofile\Documents\PowerShell" -Recurse
Copy-Item -Path "src\powershell\*" -Destination "$env:userprofile\Documents\WindowsPowerShell" -Recurse

Invoke-Expression $env:userprofile\Downloads\windows\src\os\just-install.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\scoop.ps1
Invoke-Expression $env:userprofile\Downloads\windows\src\os\chocolatey.ps1
Invoke-Expression $env:userprofile\Downloads\fonts\install.ps1

Install-Module -Name PSReadLine -Force -SkipPublisherCheck
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force

Install-Module -Name PowerShellForGitHub -Force
Install-Module posh-git -Force
Install-Module oh-my-posh -Force

Set-Theme Paradox

nvm install node@13.12.0
