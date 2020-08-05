#!/usr/bin/env bash

# // TODO: Add the ability to specify custom git repo

# Detect the platform (similar to $OSTYPE)
OS="`uname`"
case $OS in
  'Linux')
    OS='Linux'
    if [ -z $UPDATE ]; then
    echo "Detected os is $OS"
    echo "Running the installer" && sleep 3 && bash -c "$(curl -LsS https://github.com/casjay-dotfiles/desktops/raw/master/src/os/linux_setup.sh)"
    else
    echo "Detected os is $OS"
    echo "Running the Updater" && sleep 3 && UPDATE=yes bash -c "$(curl -LsS https://github.com/casjay-dotfiles/desktops/raw/master/src/os/linux_setup.sh)"
    fi
    ;;
  'Darwin')
    OS='Mac'
    if [ -z $UPDATE ]; then
    echo "Detected os is $OS"
    echo "Running the installer" && sleep 3 && bash -c "$(curl -LsS https://github.com/casjay-systems/macos/raw/master/src/os/mac_setup.sh)"
    else
    echo "Detected os is $OS"
    echo "Running the Updater" && sleep 3 && UPDATE=yes bash -c "$(curl -LsS https://github.com/casjay-systems/macos/raw/master/src/os/mac_setup.sh)"
    fi
    ;;
  'WindowsNT')
    OS='Windows'
    @"%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe" -NoProfile -InputFormat None -ExecutionPolicy Bypass -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin"    ;;
  'FreeBSD')
    OS='FreeBSD'
    echo "Not Supported"
    ;;
  'SunOS')
    OS='Solaris'
    echo "Not Supported"
    ;;
  'MING*')
    OS='Windows'
    echo "Not Supported"
    ;;
  'AIX') ;;
  *)
  echo "Unknown"
  ;;
esac
