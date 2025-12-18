# shellcheck disable=SC2034
export FZF_DEFAULT_OPTS='--no-height --reverse --ansi'

function is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}


# Ctrl + R = history search
function fzf-history-selection() {
    BUFFER=$(history -n 1 | tac  | awk '!a[$0]++' | fzf --no-sort --preview=)
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
        if [[ "$TERM_PROGRAM" == "tmux" ]]; then
            tmux rename-window "$(basename "$selected_dir")"
        fi
        zle accept-line
    fi
}
zle -N fzf-ghq-look
bindkey '^G' fzf-ghq-look


# Ctrl + F = find and vim
function fzf-find () {
    local selected
    if is_in_git_repo; then
        selected=$(git ls-files --cached --others --exclude-standard | fzf -m)
    else
        selected=$(ag -g "" | fzf -m)
    fi
    if [ -n "$selected" ]; then
        BUFFER="vi ${selected//$'\n'/ }"
        zle accept-line
    fi
}
zle -N fzf-find
bindkey '^F' fzf-find


function fgs() {
  local branches branch
  branches=$(git --no-pager branch -vv --color=always) &&
  branch=$(echo "$branches" | fzf --preview=) &&
  git switch "$(echo "$branch" | awk '{print $1}' | sed "s/.* //")"
}
