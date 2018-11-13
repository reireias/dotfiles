#!/bin/bash -e

IGNORE_PATTERN="^\.(git|travis)"

echo "Create dotfile links."
for dotfile in .??*; do
    [[ $dotfile =~ $IGNORE_PATTERN ]] && continue
    if [[ -d $dotfile ]]; then
        # create directory and link file if file is directory
        find "$dotfile" -type f \
            -exec sh -c '[ -e "$HOME/$(dirname "$1")" ] || mkdir -p "$HOME/$(dirname "$1")"' _ {} \; \
            -exec sh -c 'ln -snfv "$(pwd)/$1" "${HOME}/$1"' _ {} \;
    else
        # link file
        ln -snfv "$(pwd)/$dotfile" "$HOME/$dotfile"
    fi
done
echo -e "\033[32mSuccess\033[0m"
