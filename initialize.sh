#!/bin/bash -e

usage() {
    echo "${0} [--zsh]"
    echo "  no_option  install all"
    echo "  --zsh      install zsh, zplug, plugins"
    echo "  --neovim   install neovim"
}

print_white_bold() {
    echo -e "\e[1m${1}\e[0m"
}

apt_install() {
    if [[ "$(whoami)" = "root" ]]; then
        apt install -y "$@"
    else
        sudo apt install -y "$@"
    fi
}

pip_install() {
    if [[ "$(whoami)" = "root" ]]; then
        pip install "$@"
    else
        sudo -E -H pip install "$@"
    fi
}

if [[ $# -eq 0 ]]; then
    flag_zsh=true
    flag_font=true
    flag_neovim=true
else
    for arg in "$@"; do
        case "$arg" in
            --help)
                usage
                exit 0
                ;;
            --zsh)
                flag_zsh=true
                ;;
            --font)
                flag_font=true
                ;;
            --neovim)
                flag_neovim=true
                ;;
            *)
                usage
                exit 1
                ;;
        esac
    done
fi

if $flag_zsh; then
    print_white_bold "Install zsh"
    # chek LANG and LANGUAGE
    if [[ ! $LANG =~ ^(ja_JP|en_US)\.(utf8|UTF-8) ]] || [[ ! $LANGUAGE =~ ^(ja_JP|en_US)\.(utf8|UTF-8) ]]; then
        echo "LANG and LANGUAGE must be 'ja_JP.utf8' or 'en_US.utf8'."
        exit 1
    fi
    apt_install zsh curl gawk
    mkdir -p "${HOME}/.cache"

    print_white_bold "Install zplug"
    if [[ ! -e ${HOME}/.zplug ]]; then
        curl -sL --proto-redir -all,https \
            https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
    fi

    print_white_bold "Install plugins"
    # check instaled
    if ! zsh -c 'source ~/.zshrc; zplug check'; then
        zsh -c 'source ~/.zshrc; zplug install'
        if [[ -e ~/.zcompdump ]]; then
            rm ~/.zcompdump
        fi
        if [[ -e ~/.zplug/zcompdump ]]; then
            rm ~/.zplug/zcompdump
        fi
        zsh -c 'source ~/.zshrc; compinit'
    fi
fi

if $flag_font; then
    print_white_bold "Install font"
    apt_install fontforge python-pip unzip
    pip_install configparser
    # Ricty
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
    mv Ricty-Bold.ttf Ricty-Regular.ttf ~/.fonts

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
fi

if $flag_neovim; then
    print_white_bold "Install neovim"
    mkdir -p ~/.vim/dein/repos/github.com/Shougo/dein.vim
    git clone https://github.com/Shougo/dein.vim.git ~/.vim/dein/repos/github.com/Shougo/dein.vim
    sudo add-apt-repository -y ppa:neovim-ppa/unstable
    sudo apt-get update -q
    apt_install vim neovim
    ln -s ~/.vim ~/.config/nvim
    ln -s ~/.vimrc ~/.config/nvim/init.vim
fi
