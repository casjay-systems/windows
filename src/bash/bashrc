#!/usr/bin/env bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# If not running interactively, don't do anything
[[ $- != *i*  ]] && return

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Source System Bash

#Fedora/Redhat/CentOS
if [ -f /.bashrc ]; then
    source /etc/bashrc
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# source all others
if [ -f "$HOME/.config/bash/rc" ]; then
    source "$HOME/.config/bash/rc"
fi

#Local file
if [ -f "$HOME/.config/local/bash.local" ]; then
    source "$HOME/.config/local/bash.local"
fi

#System specific
if [ -f "$HOME/.config/local/bash."$(hostname)".local" ]; then
    source "$HOME/.config/local/bash."$(hostname)".local"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Source additional bash scripts


test -r $HOME/.dircolors && eval "$(dircolors $HOME/.dircolors)"

# Set mouse type - changes to blinking bar

echo -e -n "\x1b[\x35 q"
echo -e -n "\x6b[\x35 q"
echo -e -n "\e]12;white\a"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set variable for other scripts

export SRCBASHRC="$HOME/.bashrc"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

#/* vim set expandtab ts=4 noai :
