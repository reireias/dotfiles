#!/bin/sh

DOTPATH=~/.dotfiles
GITHUB_URL="https://github.com/reireias/dotfiles.git"

if type git; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
elif type curl || type wget; then
    tarball="https://github.com/reireias/dotfiles/archive/master.tar.gz"

    if type curl; then
        curl -L "$tarball" | tar xvzf -

    elif type wget; then
        wget -O - "$tarball" | tar xvzf -
    fi

    mv -f dotfiles-master "$DOTPATH"
else
    echo "git or curl or wget required"
    exit 1
fi

if [ -d ~/.dotfiles ]; then
    cd ~/.dotfiles
    if [ $? -ne 0 ]; then
        die "not found: $DOTPATH"
    fi

    for f in .??*
    do
        [ "$f" = ".git" ] && continue

        ln -snfv "$DOTPATH/$f" "$HOME/$f"
    done
fi

