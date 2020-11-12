[![Actions Status](https://github.com/reireias/dotfiles/workflows/install/badge.svg)](https://github.com/reireias/dotfiles/actions) [![Actions Status](https://github.com/reireias/dotfiles/workflows/lint/badge.svg)](https://github.com/reireias/dotfiles/actions) [![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

# dotfiles

reireias's dotfiles.

## Screenshot
![terminal](https://user-images.githubusercontent.com/24800246/98963316-d4a01280-254a-11eb-962a-42fa758e44b5.png)

## Quick Start

- clone this repository
- `make dotfiles && make dependencies`

## deploy dotfiles
Create symbolic link dotfiles to your home directory.

```console
$ make dotfiles
```

## install dependencies
Install packages and fonts.

- Ricty + Nerd Font + powerline font
- neovim + coc.nvim
- zsh and zsh plugins
- asdf-vm
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
