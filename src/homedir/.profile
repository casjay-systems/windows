#  -*- shell-script -*-

# set umask

#umask 022

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# disable blank screen

xset s off >/dev/null 2>&1
xset -dpms >/dev/null 2>&1
xset s off -dpms >/dev/null 2>&1

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# create dirs

mkdir -p "$HOME/.local/bin"
mkdir -p "$HOME/.local/share/nvm"
mkdir -p "$HOME/.local/log"
mkdir -p "$(ruby -r rubygems -e 'puts Gem.user_dir')/bin"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set profile as sourced

export SRCPROFILERC="$HOME/.profile"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# ensure .gitconfig exists

if [ -f ~/.config/local/gitconfig.local ] && [ ! -f ~/.gitconfig ]; then
    cp -f ~/.config/local/gitconfig.local ~/.gitconfig
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set user completion dir

export BASH_COMPLETION_USER_DIR="$HOME/.local/share/bash-completion/completions"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ignore commands that start with spaces and duplicates.

export HISTCONTROL=ignoreboth

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Increase the maximum number of lines of history
# persisted in the history file (default value is 500).

export HISTFILESIZE=10000

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don't add certain commands to the history file.

export HISTIGNORE="&:[bf]g:c:clear:history:exit:q:pwd:* --help"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Increase the maximum number of commands recorded
# in the command history (default value is 500).

export HISTSIZE=10000

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Sudo prompt

export SUDO_PROMPT="$(printf "\t\t\033[1;36m")[sudo]$(printf "\033[0m") password for %p: "

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# basher

if [ -d "$HOME/.local/share/bash/basher" ]; then
  export BASHER_ROOT="$HOME/.local/share/bash/basher"
  export PATH="$HOME/.local/share/bash/basher/bin:$PATH"
  eval "$(basher init -)"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# export gpg tty

export GPG_TTY="$(tty)"
export SSH_AUTH_SOCK="/run/user/$(id -u)/gnupg/S.gpg-agent.ssh"
eval $(gpg-agent --daemon 2>/dev/null)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Use custom `less` colors for `man` pages.

# Start blinking
export LESS_TERMCAP_mb=$(tput bold; tput setaf 2) # green
# Start bold
export LESS_TERMCAP_md=$(tput bold; tput setaf 2) # green
# Start stand out
export LESS_TERMCAP_so=$(tput bold; tput setaf 3) # yellow
# End standout
export LESS_TERMCAP_se=$(tput rmso; tput sgr0)
# Start underline
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 1) # red
# End Underline
export LESS_TERMCAP_ue=$(tput sgr0)
# End bold, blinking, standout, underline
export LESS_TERMCAP_me=$(tput sgr0)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Don't clear the screen after quitting a `man` page.

export MANPAGER="less -X"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# add emacs to bin

if [ -d $HOME/.emacs.d/bin ]; then
    export PATH="$HOME/.emacs.d/bin:$PATH"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# use vim as editor

export EDITOR="vim"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set lang

export LANG="en_US"
export LC_ALL="en_US.UTF-8"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# rpm devel

export QA_RPATHS="$[ 0x0001|0x0010 ]"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# mpd name

export MPDSERVER="$(hostname)"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# create a banner

export BANNER="echo"
if [ -n "$(command -v banner 2>/dev/null)" ]; then
    export BANNER="banner"
elif [ -n "$(command -v figlet 2>/dev/null)" ]; then
    export BANNER="figlet -f banner"
elif [ -n "$(command -v toilet 2>/dev/null)" ]; then
    export BANNER="toilet -f mono9.tlf"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Ruby Version Manager

export GEM_HOME="$HOME/.local/share/gem"
export PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$GEM_HOME/bin:$PATH"
export rvm_ignore_gemrc_issues=1
export rvm_silence_path_mismatch_check_flag=1

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# node version manager

export NO_UPDATE_NOTIFIER="true"
export NVM_BIN="$HOME/.local/bin"
export NVM_DIR="$HOME/.local/share/nvm"
export NODE_REPL_HISTORY_SIZE=10000
if [ ! -d $HOME/.local/share/nvm ]; then mkdir -p $HOME/.local/share/nvm ; fi
if [ -s "$NVM_DIR/nvm.sh" ]; then . "$NVM_DIR/nvm.sh" ; fi
if [ -s "$NVM_DIR/bash_completion" ]; then . "$NVM_DIR"/bash_completion ; fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# export editor

if [ -f "$(command -v vim 2>/dev/null)" ]; then
  EDITOR="$(command -v vim 2>/dev/null)"
elif [ -f "$(command -v nvim 2>/dev/null)" ]; then
  EDITOR="$(command -v nvim 2>/dev/null)"
elif [ -f "$(command -v geany 2>/dev/null)" ]; then
  EDITOR="$(command -v geany 2>/dev/null)"
elif [ -f "$(command -v gedit 2>/dev/null)" ]; then
  EDITOR="$(command -v gedit 2>/dev/null)"
elif [ -f "$(command -v vscode 2>/dev/null)" ]; then
  EDITOR="$(command -v vscode 2>/dev/null)"
elif [ -f "$(command -v atom 2>/dev/null)" ]; then
  EDITOR="$(command -v atom 2>/dev/null)"
elif [ -f "$(command -v brackets 2>/dev/null)" ]; then
  EDITOR="$(command -v brackets 2>/dev/null)"
elif [ -f "$(command -v emacs 2>/dev/null)" ]; then
  EDITOR="$(command -v emacs 2>/dev/null)"
elif [ -f "$(command -v mousepad 2>/dev/null)" ]; then
  EDITOR="$(command -v mousepad 2>/dev/null)"
elif [ -f "$(command -v nano 2>/dev/null)" ]; then
  EDITOR="$(command -v nano 2>/dev/null)"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# export color

if [ -f "$HOME/.dircolors" ]; then
    export DIRCOLOR="$HOME"/.dircolors
else
    export DIRCOLOR="$HOME"/.config/dircolors/dracula
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set term type

export TERM=xterm-256color

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Setting the temp directory for vim

if [ -z $TEMP ]; then
    export TEMP=/tmp
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# logging

export LOGDIR="$HOME/.local/log"
export DEFAULT_LOG_DIR="$LOGDIR"
export DEFAULT_LOG="scripts"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME"/.local/bin ]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "$HOME"/.local/share/scripts/bin ]; then
    export PATH="$HOME/.local/share/scripts/bin:$PATH"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# cheat.sh settings

if [ ! -d "$HOME/.config/cheat.sh" ]; then
    mkdir -p "$HOME/.config/cheat.sh"
fi

export CHTSH_HOME="$HOME/.config/cheat.sh"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# passmgr default settings - copy to your bash.local and change for your setup

if [ -f "$HOME/.config/secure/passmgr.txt" ]; then
    . "$HOME/.config/secure/passmgr.txt"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# github default settings - copy to your bash.local and change for your setup

if [ -f "$HOME/.config/secure/github.txt" ]; then
    . "$HOME/.config/secure/github.txt"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# gitlab default settings - copy to your bash.local and change for your setup

if [ -f "$HOME/.config/secure/gitlab.txt" ]; then
    . "$HOME/.config/secure/gitlab.txt"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# your private git - copy to your bash.local and change for your setup

if [ -f "$HOME/.config/secure/gitpriv.txt" ]; then
    . "$HOME/.config/secure/gitpriv.txt"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Dotfiles base repo  - copy to your bash.local and change for your setup

if [ -f "$HOME/.config/secure/personal.txt" ]; then
    . "$HOME/.config/secure/personal.txt"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# APIKEYS  - copy to your bash.local and change for your setup

if [ -f "$HOME/.config/secure/apikeys.txt" ]; then
    . "$HOME/.config/secure/apikeys.txt"
fi

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# cursor

echo -e -n "\x1b[\x35 q"
echo -e -n "\e]12;white\a"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# set variable for other scripts


# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
