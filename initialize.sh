#!/bin/sh

if ! which git > /dev/null 2>&1; then
    sudo apt-get install -y git
fi

# zsh
sudo apt-get install -y zsh
chsh -s /usr/bin/zsh


# zplug
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
zsh -c 'source ~/.zshrc; zplug install'
if [ -e ~/.zcompdump ]; then
    rm ~/.zcompdump
fi
if [ -e ~/.zplug/zcompdump ]; then
    rm ~/.zplug/zcompdump
fi
zsh -c 'source ~/.zshrc; compinit'


# neovim
sudo apt-get install -y vim
mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get update -q
sudo apt-get install -y neovim
ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

