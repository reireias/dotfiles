#                                     _              
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#

# INPORTS {{{
# profile
if [ "$ZSHRC_PROFILE" != "" ]; then
  zmodload zsh/zprof && zprof > /dev/null
fi

source ~/.bashrc

# plugin
source ~/.zsh/config/plugin.zsh
export ENHANCD_ENABLE_DOUBLE_DOT=false
export ENHANCD_ENABLE_HOME=false
# }}}

# HISTORY {{{
# history
export HISTFILE=~/.zsh-history
export HISTSIZE=100000
export SAVEHIST=1000000

# share .zshhistory
setopt inc_append_history
setopt share_history

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':completion:*' recent-dirs-insert both
zstyle ':chpwd:*' recent-dirs-default true
zstyle ':chpwd:*' recent-dirs-max 1000
zstyle ':chpwd:*' recent-dirs-file ~/.cache/chpwd-recent-dirs
# }}}


# COLOR {{{
# LS_COLORS
if [[ -z "$SHELL" ]]; then
    SHELL="$(command -v zsh)"
    export SHELL
fi
eval "$(dircolors -b)"
eval "$(dircolors ~/.dircolors)"

# remove file mark
unsetopt list_types

# color at completion
autoload -Uz colors
colors
zstyle ':completion:*' verbose yes
# shellcheck disable=SC2296
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# less
export LESS='-R'

# man
export MANPAGER="sh -c 'col -bx | bat -l man -p'"

# bat
export BAT_THEME="Monokai Extended Bright"
# }}}


# FUNCTION {{{
function pr-open {
    local url
    url=$(hub pr list -h "$(git symbolic-ref --short HEAD)" -f "%U")
    if [[ -z $url ]]; then
        echo "The PR based this branch not found."
        return 1
    fi
    open "$url"
}
# }}}


# FZF {{{
if [[ -f ~/.fzf.zsh ]]; then
    source ~/.fzf.zsh
fi
# }}}


# DEVELOPMENT {{{
# asdf-vm
if [[ -e ~/.asdf ]]; then
    source ~/.asdf/asdf.sh
fi
# }}}


# OTHER {{{
# neovim
export XDG_CONFIG_HOME=~/.config
export BUNDLER_EDITOR=vi

# golang
export GOPATH=$HOME/dev
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# rust
export PATH=$PATH:$HOME/.cargo/bin

# tmux
autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git svn
# }}}


# SUB FILES {{{
# key
source ~/.zsh/config/key.zsh

# alias
source ~/.zsh/config/alias.zsh

# completion
source ~/.zsh/config/completion.zsh

# peco
source ~/.zsh/config/search.zsh

# local setting
if [[ -e ~/.zshrc_local ]]; then
    source ~/.zshrc_local
fi
# }}}
