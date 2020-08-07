set-executionpolicy unrestricted -s cu

iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

scoop install sudo
scoop bucket add nerd-fonts
scoop install 7zip curl sudo git openssh coreutils grep sed less python ruby go nodejs --global

