#                                     _              
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#

# INPORTS {{{
source ~/.bashrc
# }}}


# HISTORY {{{
# history
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history

# cdr
if [[ -n $(echo ${^fpath}/chpwd_recent_dirs(N)) && -n $(echo ${^fpath}/cdr(N)) ]]; then
    autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
    add-zsh-hook chpwd chpwd_recent_dirs
    zstyle ':completion:*' recent-dirs-insert both
    zstyle ':chpwd:*' recent-dirs-default true
    zstyle ':chpwd:*' recent-dirs-max 1000
    zstyle ':chpwd:*' recent-dirs-file "$HOME/.cache/chpwd-recent-dirs"
fi
# }}}


# COLOR {{{
# LS_COLORS
if [[ -z "$SHELL" ]]; then
    export SHELL="$(which zsh)"
fi
eval `dircolors -b`
eval `dircolors ${HOME}/.dircolors`

# remove file mark
unsetopt list_types

# color at completion
autoload -Uz colors
colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# less
export LESS='-R'

# man
export MANPAGER='less -R'
man() {
    env \
        LESS_TERMCAP_mb=$(printf "\e[1;33m") \
        LESS_TERMCAP_md=$(printf "\e[1;36m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
# }}}


# FUNCTION {{{
function pr-open {
    local url=$(hub pr list -h $(git symbolic-ref --short HEAD) -f "%U")
    if [ -z "$url" ]; then
        echo "The PR based this branch not found."
        return 1
    fi
    open $url
}
# }}}


# FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}


# DEVELOPMENT {{{
# asdf-vm
if [[ -e ${HOME}/.asdf ]]; then
    source ${HOME}/.asdf/asdf.sh
fi
# }}}


# OTHER {{{
# neovim
export XDG_CONFIG_HOME=~/.config
export BUNDLER_EDITOR=vi

# golang
export GOPATH=$HOME/dev
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
# }}}


# SUB FILES {{{
# plugin
source ~/.zsh/config/plugin.zsh

# key
source ~/.zsh/config/key.zsh

# alias
source ~/.zsh/config/alias.zsh

# completion
source ~/.zsh/config/completion.zsh

# peco
source ~/.zsh/config/search.zsh

# local setting
if [ -e ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
# }}}
