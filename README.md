[![Build Status](https://travis-ci.org/reireias/dotfiles.svg?branch=master)](https://travis-ci.org/reireias/dotfiles)

# dotfiles

## Install

```sh
$ curl -L raw.github.com/reireias/dotfiles/master/install.sh | bash
```

or

```sh
for f in .??*; do [[ $f =~ ^\.(git|travis) ]] && continue; ln -snfv "$(pwd)/$f" "$HOME/$f" ; done
```

## Initialize

```sh
$ ~/.dotfiles/initialize.sh
```

