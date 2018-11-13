[![Build Status](https://travis-ci.org/reireias/dotfiles.svg?branch=master)](https://travis-ci.org/reireias/dotfiles)

# dotfiles

reireias's dotfiles.

## Deploy
Deploy dotfiles to your home directory.

```sh
cd /path/to/dotfiles
./deploy.sh
```

## Initialize
Install packages and fonts.

```sh
cd /path/to/dotfiles
./initialize.sh
```


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

