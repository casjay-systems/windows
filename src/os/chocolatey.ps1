
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y chocolateygui cascadiacodepl cascadia-code-nerd-font --params "ALLUSERS=1"
choco install -y 7zip curl sudo openssh grep sed less --params "ALLUSERS=1"
