#!/bin/sh

DOTPATH=~/.dotfiles
GITHUB_URL="https://github.com/reireias/dotfiles.git"
TARBALL="https://github.com/reireias/dotfiles/archive/master.tar.gz"

if which git > /dev/null 2>&1; then
    git clone --recursive "$GITHUB_URL" "$DOTPATH"
elif which curl > /dev/null 2>&1; then
    curl -L "$TARBALL" | tar xvzf -
    mv -f dotfiles-master "$DOTPATH"
elif which wget > /dev/null 2>&1; then
    wget -O - "$TARBALL" | tar xvzf -
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

