# asdf-vm
if [[ -e ~/.asdf ]]; then
    # shellcheck disable=SC2206
    fpath=(~/.asdf/completions "${fpath[@]}")
fi

# aws
if type aws > /dev/null 2>&1; then
    aws () {
        unset -f aws
        # lazy load
        source $(asdf which aws_zsh_completer.sh)
        aws "$@"
    }
fi

# pip (generated by `pip completion --zsh`)
# shellcheck disable=SC1087,SC2086,SC2162,SC2207,SC2211,SC2034
function _pip_completion {
  local words cword
  read -Ac words
  read -cn cword
  reply=( $( COMP_WORDS="$words[*]" \
             COMP_CWORD=$(( cword-1 )) \
             PIP_AUTO_COMPLETE=1 $words[1] 2>/dev/null ))
}
compctl -K _pip_completion pip
