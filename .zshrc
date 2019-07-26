#                                     _              
#                             _______| |__  _ __ ___ 
#                            |_  / __| '_ \| '__/ __|
#                           _ / /\__ \ | | | | | (__ 
#                          (_)___|___/_| |_|_|  \___|
#

# INPORTS {{{
source ~/.bashrc
source ~/.zplug/init.zsh
# }}}


# PLUGINS {{{
# zsh-completions
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src ~/.zsh/completion $fpath)

# zplug
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "zsh-users/zsh-completions"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
zplug load
setopt nonomatch
export ZSH_HIGHLIGHT_STYLES[path]='fg=081'

# powerlevel10k
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs newline pyenv rbenv aws)
typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=''
typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX=' %F{cyan}$ '
typeset -g POWERLEVEL9K_PROMPT_ON_NEWLINE=true
typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0B1' # 
typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0B3 ' # 
typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=$'\uE0B3 ' # 

typeset -g POWERLEVEL9K_MODE='nerdfont-fontconfig'

typeset -g POWERLEVEL9K_DIR_FOREGROUND='green'
typeset -g POWERLEVEL9K_DIR_BACKGROUND='none'
typeset -g POWERLEVEL9K_HOME_ICON=$'\uF015 '     # 
typeset -g POWERLEVEL9K_HOME_SUB_ICON=$'\uF07C ' # 
typeset -g POWERLEVEL9K_FOLDER_ICON=$'\uF115 '   # 
typeset -g POWERLEVEL9K_ETC_ICON=$'\uF013 '      # 

typeset -g POWERLEVEL9K_DIR_WRITABLE_FOREGROUND='black'
typeset -g POWERLEVEL9K_DIR_WRITABLE_VISUAL_IDENTIFIER_COLOR='red'
typeset -g POWERLEVEL9K_DIR_WRITABLE_BACKGROUND='none'
typeset -g POWERLEVEL9K_LOCK_ICON=$'\UF023 ' # 

typeset -g POWERLEVEL9K_VCS_{CLEAN,UNTRACKED,MODIFIED,LOADING}_BACKGROUND='none'
typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND='green'
typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='yellow'
typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='red'
typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND='blue'
typeset -g POWERLEVEL9K_VCS_STAGEDFORMAT_FOREGROUND='green'
typeset -g POWERLEVEL9K_VCS_UNSTAGEDFORMAT_FOREGROUND='red'
typeset -g POWERLEVEL9K_VCS_STASHFORMAT_FOREGROUND='cyan'
typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGESFORMAT_FOREGROUND='cyan'
typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGESFORMAT_FOREGROUND='magenta'
typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED}_MAX_NUM=99
typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON=$'\uF059 ' # 
typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uF06A ' # 
typeset -g POWERLEVEL9K_VCS_STAGED_ICON=$'\uF055 ' # 

typeset -g POWERLEVEL9K_PYENV_FOREGROUND='deepskyblue4'
typeset -g POWERLEVEL9K_PYENV_BACKGROUND='none'
typeset -g POWERLEVEL9K_PYTHON_ICON=$'\uE606' # 

typeset -g POWERLEVEL9K_RBENV_FOREGROUND='red3'
typeset -g POWERLEVEL9K_RBENV_BACKGROUND='none'

typeset -g POWERLEVEL9K_AWS_FOREGROUND='orange1'
typeset -g POWERLEVEL9K_AWS_BACKGROUND='none'
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


# ALIAS {{{
# general
alias caddy='ruby /opt/caddy/caddy/caddy.rb'
alias du='du -shc * | sort -h'
alias h='tldr'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -l'
alias ls='ls -h --color=always'
alias m='mkdir'
alias open='gnome-open'
alias pscp='parallel-scp'
alias reload='source ~/.zshrc'
alias ssh='TERM=xterm ssh'
alias sudo='sudo '
alias terminal='gnome-terminal --hide-menubar'
alias tf='terraform'
alias tm='terminal'
alias vdir='ls --color=auto --format=long'

# cd
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# vim
alias vi='nvim'
alias nvi='nvim'
alias vimdiff='nvim -d'

# dotfiles
alias dot='cd ~/dev/src/github.com/reireias/dotfiles'
alias zshconfig='nvim ~/.zshrc'
alias vimconfig='nvim ~/.vimrc'

# grep
alias g='grep --color=always'
alias grep='grep --color=always'
alias jgrep='grep --include="*.java"'
alias jsgrep='grep --include="*.js"'
alias fgrep='find ./ | grep'
alias ngrep='grep --exclude-dir={node_modules,.nuxt}'
alias ag='ag --color-match "1;31" --color-line-number "0;32" --color-path "0;35"'

# git
alias g='git'
alias gb='git branch'
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(magenta)%ci%Creset%n%C(cyan)%an <%ae>%Creset%n%B"'
alias glp='git log -p'
alias glg='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(magenta)%ci%Creset%n%C(cyan)%an <%ae>%Creset%n%B"'
alias gco='git checkout'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gds='git diff --stat'
alias gdt='git difftool'
alias gst='git status'
alias gp='git pull'

# docker
alias d='docker'
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
alias dc='docker-compose'
alias kc='kubectl'

# scripts
alias molokai='open http://monokai.9x4.net/'
alias nuxt-init='~/.scripts/nuxt-init.sh'
# }}}


# KEY {{{
# key bind
bindkey -e
typeset -A key

if [[ -n "${terminfo}" ]]; then
    key[Home]="${terminfo[khome]}"
    key[End]="${terminfo[kend]}"
    key[Insert]="${terminfo[kich1]}"
    key[Delete]="${terminfo[kdch1]}"
    key[Up]="${terminfo[kcuu1]}"
    key[Down]="${terminfo[kcud1]}"
    key[Left]="${terminfo[kcub1]}"
    key[Right]="${terminfo[kcuf1]}"
    key[PageUp]="${terminfo[kpp]}"
    key[PageDown]="${terminfo[knp]}"

    # setup key accordingly
    [[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
    [[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
    [[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
    [[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
    [[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
    [[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
    [[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
    [[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
    [[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
    [[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history
fi

# word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word
WORDCHARS='*?_-.[]~=&;!#$%^(){}<>'

if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
    function zle-line-init () {
        printf '%s' "${terminfo[smkx]}"
    }
    function zle-line-finish () {
        printf '%s' "${terminfo[rmkx]}"
    }
    zle -N zle-line-init
    zle -N zle-line-finish
fi
# }}}

# FZF {{{
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# }}}

# PECO {{{
# peco
function peco-history-selection() {
    BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

function peco-ghq-look () {
    local ghq_roots="$(git config --path --get-all ghq.root)"
    local selected_dir=$(ghq list --full-path | \
        xargs -I{} ls -dl --time-style=+%s {}/.git | sed 's/.*\([0-9]\{10\}\)/\1/' | sort -nr | \
        sed "s,.*\(${ghq_roots/$'\n'/\|}\)/,," | \
        sed 's/\/.git//' | \
        peco --prompt="cd-ghq >" --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq list --full-path | grep --color=never -E "/$selected_dir$")"
        zle accept-line
    fi
}
zle -N peco-ghq-look
bindkey '^G' peco-ghq-look

function peco-cdr () {
    local selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
bindkey '^E' peco-cdr

function peco-find () {
    local base="."
    if [ -n "$LBUFFER" ] && [[ ! "$LBUFFER" =~ " $" ]]; then
        local last_path="$(echo $LBUFFER | sed -e 's/^.*\ //g')"
        if [ -d "$last_path" ]; then
            base="$last_path"
        fi
    fi
    local filepath="$(find $base | grep -v '/\.' | peco --prompt 'PATH>')"
    [ -z "$filepath" ] && return
    if [ -n "$LBUFFER" ]; then
        if [ "$base" = "." ]; then
            BUFFER="$LBUFFER$filepath"
        else
            BUFFER="$(echo $LBUFFER | sed -e "s#${base}\$##g")$filepath"
        fi
    else
        if [ -d "$filepath" ]; then
            BUFFER="cd $filepath"
        elif [ -f "$filepath" ]; then
            BUFFER="vi $filepath"
        fi
        zle accept-line
    fi
    CURSOR=$#BUFFER
}
zle -N peco-find
bindkey '^F' peco-find
# }}}

# COMPLETION {{{
# pip
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] ) )
}
compctl -K _pip_completion pip3

# npm
if type complete &>/dev/null; then
    _npm_completion () {
        local words cword
        if type _get_comp_words_by_ref &>/dev/null; then
            _get_comp_words_by_ref -n = -n @ -n : -w words -i cword
        else
            cword="$COMP_CWORD"
            words=("${COMP_WORDS[@]}")
        fi

        local si="$IFS"
        IFS=$'\n' COMPREPLY=($(COMP_CWORD="$cword" \
            COMP_LINE="$COMP_LINE" \
            COMP_POINT="$COMP_POINT" \
            npm completion -- "${words[@]}" \
            2>/dev/null)) || return $?
        IFS="$si"
        if type __ltrim_colon_completions &>/dev/null; then
            __ltrim_colon_completions "${words[cword]}"
        fi
    }
    complete -o default -F _npm_completion npm
elif type compdef &>/dev/null; then
    _npm_completion() {
        local si=$IFS
        compadd -- $(COMP_CWORD=$((CURRENT-1)) \
            COMP_LINE=$BUFFER \
            COMP_POINT=0 \
            npm completion -- "${words[@]}" \
            2>/dev/null)
        IFS=$si
    }
    compdef _npm_completion npm
elif type compctl &>/dev/null; then
    _npm_completion () {
        local cword line point words si
        read -Ac words
        read -cn cword
        let cword-=1
        read -l line
        read -ln point
        si="$IFS"
        IFS=$'\n' reply=($(COMP_CWORD="$cword" \
            COMP_LINE="$line" \
            COMP_POINT="$point" \
            npm completion -- "${words[@]}" \
            2>/dev/null)) || return $?
        IFS="$si"
    }
    compctl -K _npm_completion npm
fi
# }}}


# OTHER {{{
# pandoc
pandoc_git () {
    pandoc -s --self-contained -t html5 -c ~/.pandoc/github.css $@
}

# neovim
export XDG_CONFIG_HOME=~/.config

# golang
export GOROOT=/usr/lib/go
export GOPATH=$HOME/dev
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# travis
[ -f /home/fx30079/.travis/travis.sh ] && source /home/fx30079/.travis/travis.sh

# enhancd
export ENHANCD_FILTER=peco
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1

# hub
function pr-open {
    local url=$(hub pr list -h $(git symbolic-ref --short HEAD) -f "%U")
    if [ -z "$url" ]; then
        echo "The PR based this branch not found."
        return 1
    fi
    open $url
}
# }}}

# LOCAL {{{
# Load local setting
if [ -e ~/.zshrc_local ]; then
    source ~/.zshrc_local
fi
# }}}
