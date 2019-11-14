[![Build Status](https://travis-ci.org/reireias/dotfiles.svg?branch=master)](https://travis-ci.org/reireias/dotfiles)

# dotfiles

reireias's dotfiles.

## Screenshot
### zsh
![dotfiles-zsh](https://user-images.githubusercontent.com/24800246/59350904-29d56480-8d58-11e9-9aa7-f943aa470bb9.png)

### vim
![dotfiles-vim](https://user-images.githubusercontent.com/24800246/59351009-686b1f00-8d58-11e9-8b0a-585e65a4a31c.png)

## deploy dotfiles
Create symbolic link dotfiles to your home directory.

```console
$ make dotfiles
```

## install dependencies
Install packages and fonts.

- Ricty + Nerd Font + powerline font
- neovim
- zsh and zsh plugins
- some packages to use .zshrc

```console
$ make dependencies
```

## for developer
Run lint (shellcheck, ansible-lint, vint)

```console
$ make lint
```

Test .bashrc and .zshrc, check zsh plugin installed.

```console
$ make test
```
