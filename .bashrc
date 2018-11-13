#                         _               _              
#                        | |__   __ _ ___| |__  _ __ ___ 
#                        | '_ \ / _` / __| '_ \| '__/ __|
#                       _| |_) | (_| \__ \ | | | | | (__ 
#                      (_)_.__/ \__,_|___/_| |_|_|  \___|
#

# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# less
export LESS='-R'

# Load local setting
if [ -e ~/.bashrc_local ]; then
    source ~/.bashrc_local
fi
