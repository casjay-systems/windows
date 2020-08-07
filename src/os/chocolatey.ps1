
Set-ExecutionPolicy Bypass -Scope Process -Force
iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
choco install -y chocolateygui cascadiacodepl firacodepl --params "ALLUSERS=1"
choco install -y 7zip curl sudo git openssh coreutils grep sed less python ruby go nodejs --params "ALLUSERS=1"
