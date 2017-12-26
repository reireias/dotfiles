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
ln -s ~/dev/src/github.com/reireias/dotfiles/vim/snippets snippets
ln -s ~/dev/src/github.com/reireias/dotfiles/vim/template template


# font
# Ricty
if ! which fontforge > /dev/null 2>&1; then
    sudo apt-get install -y fontforge
fi
mkdir -p ~/.fonts
curl -L http://levien.com/type/myfonts/Inconsolata.otf > ~/.fonts/Inconsolata.otf
tmp=/tmp/dotfiles
mkdir -p "$tmp"
curl -L "https://ja.osdn.net/frs/redir.php?m=iij&f=%2Fmix-mplus-ipa%2F63545%2Fmigu-1m-20150712.zip" > "$tmp"/migu-1m-20150712.zip
unzip "$tmp"/migu-1m-20150712.zip -d "$tmp"
cp "$tmp"/migu-1m-20150712/migu-1m-regular.ttf ~/.fonts
cp "$tmp"/migu-1m-20150712/migu-1m-bold.ttf ~/.fonts
curl -L raw.github.com/metalefty/Ricty/master/ricty_generator.sh > "$tmp"/ricty_generator.sh
chmod +x "$tmp"/ricty_generator.sh
"$tmp"/ricty_generator.sh ~/.fonts/Inconsolata.otf ~/.fonts/migu-1m-regular.ttf ~/.fonts/migu-1m-bold.ttf
mv Ricty-Bold.ttf Ricty-Regular.ttf .fonts

# NERD
git clone --depth=1 https://github.com/ryanoasis/nerd-fonts.git "$tmp"/nerd-fonts
fontforge -script "$tmp"/nerd-fonts/font-patcher ~/.fonts/Ricty-Regular.ttf --fontawesome --fontlinux --octicons --pomicons --powerline --powerlineextra --no-progressbars --quiet
mv Ricty*.ttf Ricty-Regular-nerd.ttf

# vim-powerline
git clone --depth=1 https://github.com/Lokaltog/vim-powerline.git "$tmp"/vim-powerline
fontforge -lang=py -script "$tmp"/vim-powerline/fontpatcher/fontpatcher Ricty-Regular-nerd.ttf
mv Ricty*.ttf ~/.fonts/

rm -rf "$tmp"
fc-cache -vf
