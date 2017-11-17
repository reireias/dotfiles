# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

export LANG=ja_JP.utf8 

# ls color settings
eval `dircolors ${HOME}/.dircolors`

# less
export LESS='-R'

# Load local setting
if [ -e ~/.env/.bashrc ]; then
    source ~/.env/.bashrc
fi
