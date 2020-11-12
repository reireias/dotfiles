export FZF_DEFAULT_OPTS='--no-height --reverse'

# shellcheck disable=SC2034
function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}


# Ctrl + R = history search
function fzf-history-selection() {
    BUFFER=$(history -n 1 | tac  | awk '!a[$0]++' | fzf --sort --preview=)
    CURSOR=$#BUFFER
    zle reset-prompt
}
zle -N fzf-history-selection
bindkey '^R' fzf-history-selection


# Ctrl + G = ghq list
function fzf-ghq-look () {
    local selected_dir
    # shellcheck disable=SC2153
    selected_dir=$(ghq list | fzf --preview=)
    if [ -n "$selected_dir" ]; then
        BUFFER="cd $(ghq list --full-path | grep --color=never -E "/$selected_dir$")"
        zle accept-line
    fi
}
zle -N fzf-ghq-look
bindkey '^G' fzf-ghq-look


# Ctrl + F = find and vim
function fzf-find () {
    local selected
    if is_in_git_repo; then
        selected=$(git ls-files | fzf)
    else
        selected=$(ag -g "" | fzf)
    fi
    if [ -n "$selected" ]; then
        BUFFER="vi ${selected}"
        zle accept-line
    fi
}
zle -N fzf-find
bindkey '^F' fzf-find
