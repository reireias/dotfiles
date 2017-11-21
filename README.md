[![Build Status](https://travis-ci.org/reireias/dotfiles.svg?branch=master)](https://travis-ci.org/reireias/dotfiles)

# dotfiles

## Install

### dotfiles

```sh
$ curl -L raw.github.com/reireias/dotfiles/master/install.sh | bash
```

## Initialize

- Initialize tasks set up zsh and neovim

```sh
$ ~/.dotfiles/initialize.sh
```

### fonts

- Download your base font. (ex:Ricty)

- Install fontforge
```sh
$ sudo add-apt-repository ppa:fontforge/fontforge
$ sudo apt-get update
$ sudo apt-get install fontforge
```

- Clone nerd-fonts
```sh
$ git clone https://github.com/ryanoasis/nerd-fonts.git
```

- Apply font patch
```sh
$ fontforge -script ./font-patcher ~/.fonts/Ricty-Regular.ttf --fontawesome --fontlinux --octicons --pomicons --powerline --powerlineextra
$ mv ./<created font> ~/.fonts/Ricty-Regular-nerd.ttf
```

- Clone vim-powerline
```sh
$ git clone https://github.com/Lokaltog/vim-powerline.git
```

- Apply font patch
```sh
$ fontforge -lang=py -script tmp/vim-powerline/fontpatcher/fontpatcher .fonts/Ricty-Regular-nerd.ttf
$ mv ./<created font> ~/.fonts/Ricty-Regular-nerd-Powerline.ttf
```

- Load font
```sh
$ fc-cache -vf
```
