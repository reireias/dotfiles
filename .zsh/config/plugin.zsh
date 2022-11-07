# shellcheck disable=SC2034
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    # shellcheck disable=SC2015
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

# shellcheck disable=SC1091
source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
# shellcheck disable=SC2154
(( ${+_comps} )) && _comps[zinit]=_zinit

# zsh-completions
fpath=(~/.local/share/zinit/plugins/zsh-users---zsh-completions/src ~/.zsh/completion "${fpath[@]}")

# zinit
zinit light "zsh-users/zsh-syntax-highlighting"
zinit ice wait lucid
zinit light "b4b4r07/zsh-vimode-visual"
zinit ice wait lucid
zinit light "zsh-users/zsh-completions"
zinit ice wait'!0'
zinit light "b4b4r07/enhancd"
zinit ice wait lucid
zinit light "zsh-users/zsh-autosuggestions"
zinit ice depth=1
zinit light "romkatv/powerlevel10k"
setopt nonomatch
if [[ ${#ZSH_HIGHLIGHT_STYLES[@]} -ne 0 ]]; then
    export ZSH_HIGHLIGHT_STYLES['path']='fg=081'
fi

# powerlevel10k
typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir dir_writable)
typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs newline asdf aws)
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

typeset -g POWERLEVEL9K_RBENV_FOREGROUND='red'
typeset -g POWERLEVEL9K_RBENV_BACKGROUND='none'

typeset -g POWERLEVEL9K_ASDF_FOREGROUND='purple'
typeset -g POWERLEVEL9K_ASDF_BACKGROUND='none'

typeset -g POWERLEVEL9K_AWS_FOREGROUND='yellow'
typeset -g POWERLEVEL9K_AWS_BACKGROUND='none'

# enhancd
export ENHANCD_FILTER=peco
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1

# functions
function zsh-startuptime() {
    local total_msec=0
    local msec
    local i
    for i in $(seq 1 5); do
        msec=$( (TIMEFMT='%mE'; time zsh -i -c exit) 2>/dev/stdout >/dev/null)
        msec=$(echo "$msec" | tr -d "ms")
        echo " ${i}: ${msec} [ms]"
        total_msec=$(( total_msec + msec ))
    done
    local average_msec
    average_msec=$(( total_msec / 5 ))
    echo -e "\naverage: ${average_msec} [ms]"
}

function zsh-profiler() {
    ZSHRC_PROFILE=1 zsh -i -c zprof
}
