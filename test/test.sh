#!/bin/bash

errors=()

while IFS= read -r -d '' f
do
    shellcheck "$f" && echo "[OK]: $f"

    if [ $? -ne 0 ]; then
        errors+=("$f")
    fi
done < <(find ./ -type d -name ".git" -prune -o -type f -name "*.sh" -print0)

if [ ! ${#errors[@]} -eq 0 ]; then
    echo "These files failed shellcheck: ${errors[*]}"
    exit 1
fi
