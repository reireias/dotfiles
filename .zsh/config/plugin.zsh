# shellcheck disable=SC2034
source ~/.zplug/init.zsh

# zsh-completions
fpath=(~/.zplug/repos/zsh-users/zsh-completions/src ~/.zsh/completion "${fpath[@]}")

# zplug
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "b4b4r07/zsh-vimode-visual", defer:3
zplug "zsh-users/zsh-completions"
zplug "b4b4r07/enhancd", use:init.sh
zplug "zsh-users/zsh-autosuggestions"
zplug "romkatv/powerlevel10k", use:powerlevel10k.zsh-theme
zplug load
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

typeset -g POWERLEVEL9K_RBENV_FOREGROUND='red3'
typeset -g POWERLEVEL9K_RBENV_BACKGROUND='none'

typeset -g POWERLEVEL9K_ASDF_FOREGROUND='red3'
typeset -g POWERLEVEL9K_ASDF_BACKGROUND='none'

typeset -g POWERLEVEL9K_AWS_FOREGROUND='orange1'
typeset -g POWERLEVEL9K_AWS_BACKGROUND='none'

# enhancd
export ENHANCD_FILTER=peco
export ENHANCD_DISABLE_DOT=1
export ENHANCD_DISABLE_HOME=1
