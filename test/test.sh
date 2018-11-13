#!/bin/bash

errors=()

while IFS= read -r -d '' f
do
    if shellcheck "$f"
    then
        echo "[OK]: $f"
    else
        errors+=("$f")
    fi
done < <(find ./ -type d -name ".git" -prune -o -type f -name "*.sh" -print0)

if zsh -n ~/.zshrc
then
    echo "[OK]: ~/.zshrc"
else
    errors+=(~/.zshrc)
fi

if bash -n ~/.bashrc
then
    echo "[OK]: ~/.bashrc"
else
    errors+=(~/.bashrc)
fi

if [ ! ${#errors[@]} -eq 0 ]; then
    echo "These files failed check: ${errors[*]}"
    exit 1
fi
