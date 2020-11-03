# shellcheck disable=SC2034
# Ctrl + R = history search
function peco-history-selection() {
    BUFFER=$(history -n 1 | tac  | awk '!a[$0]++' | peco)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection


# Ctrl + G = ghq list
function peco-ghq-look () {
    local selected_dir
    # shellcheck disable=SC2153
    selected_dir=$(ghq list | peco --prompt="cd-ghq >" --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq list --full-path | grep --color=never -E "/$selected_dir$")"
        zle accept-line
    fi
}
zle -N peco-ghq-look
bindkey '^G' peco-ghq-look


# Ctrl + E = cdr
function peco-cdr () {
    local selected_dir
    selected_dir="$(cdr -l | sed 's/^[0-9]\+ \+//' | peco --prompt="cdr >" --query "$LBUFFER")"
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
}
zle -N peco-cdr
# bindkey '^E' peco-cdr


# Ctrl + F = find and open
function peco-find () {
    local base="."
    if [[ -n "$LBUFFER" ]] && [[ ! "$LBUFFER" =~ " $" ]]; then
        local last_path
        # shellcheck disable=SC2001
        last_path="$(echo "$LBUFFER" | sed -e 's/^.*\ //g')"
        if [ -d "$last_path" ]; then
            base="$last_path"
        fi
    fi
    local filepath
    filepath="$(find "$base" | grep -v '/\.' | peco --prompt 'PATH>')"
    [[ -z "$filepath" ]] && return
    if [ -n "$LBUFFER" ]; then
        if [[ "$base" = "." ]]; then
            BUFFER="$LBUFFER$filepath"
        else
            # shellcheck disable=SC2001
            BUFFER="$(echo "$LBUFFER" | sed -e "s#${base}\$##g")$filepath"
        fi
    else
        if [[ -d "$filepath" ]]; then
            BUFFER="cd $filepath"
        elif [[ -f "$filepath" ]]; then
            BUFFER="vi $filepath"
        fi
        zle accept-line
    fi
    CURSOR=$#BUFFER
}
zle -N peco-find
bindkey '^F' peco-find
