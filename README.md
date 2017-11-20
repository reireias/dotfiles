# dotfiles

## Install

### dotfiles

```sh
$ curl -L raw.github.com/reireias/dotfiles/master/install.sh | bash
```

### zsh
```sh
$ sudo apt-get install zsh
$ chsh -s /usr/bin/zsh
```

### zplug
- requires git and zsh
- Downlo and install
```sh
$ curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
$ zplug install
```

- clear zcompdump
```sh
$ rm ~/.zcompdump ~/.zplug/zcompdump && compinit
```

### dein.vim
```sh
$ mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
$ git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
```

### neovim
```sh
$ sudo apt-get install neovim
$ ln -s ~/.vim ~/.config/nvim
$ ln -s ~/.vimrc ~/.config/nvim/init.vim
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
