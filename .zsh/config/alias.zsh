# general
alias au='awsume -u'
alias caddy='ruby /opt/caddy/caddy/caddy.rb'
alias du='du -shc * | sort -h'
alias fzf='fzf --preview "bat  --color=always --style=header,grid --line-range :100 {}"'
alias h='tldr'
alias m='mkdir'
alias open='gnome-open'
alias pscp='parallel-scp'
alias reload='source ~/.zshrc'
alias ssh='TERM=xterm ssh'
alias sudo='sudo '
alias terminal='gnome-terminal --hide-menubar'
alias tf='terraform'
alias tm='terminal'
alias vdir='ls --color=auto --format=long'

# ls
if type "exa" > /dev/null 2>&1; then
    alias ls='exa'
    alias l='exa -F'
    alias la='exa -a'
    alias ll='exa -l'
else
    alias ls='ls -h --color=always'
    alias l='ls -CF'
    alias la='ls -A'
    alias ll='ls -l'
fi

# cd
alias ..2='cd ../..'
alias ..3='cd ../../..'
alias ..4='cd ../../../..'

# vim
alias vi='nvim'
alias nvi='nvim'
alias vimdiff='nvim -d'

# dotfiles
alias dot='cd ~/dev/src/github.com/reireias/dotfiles'
alias zshconfig='nvim $(readlink -f ~/.zshrc)'
alias vimconfig='nvim $(readlink -f ~/.vimrc)'

# grep
alias g='grep --color=always'
alias grep='grep --color=always'
alias jgrep='grep --include="*.java"'
alias jsgrep='grep --include="*.js"'
alias fgrep='find ./ | grep'
alias ngrep='grep --exclude-dir={node_modules,.nuxt}'
alias ag='ag --color-match "1;31" --color-line-number "0;32" --color-path "0;35"'
alias agn='ag --nogroup --color-match "1;31" --color-line-number "0;32" --color-path "0;35"'

# git
alias g='git'
alias gb='git branch'
alias gl='git log --pretty=format:"%C(yellow)%h%Creset %C(magenta)%ci%Creset%n%C(cyan)%an <%ae>%Creset%n%B"'
alias glp='git log -p'
alias glg='git log --graph --pretty=format:"%C(yellow)%h%Creset %C(magenta)%ci%Creset%n%C(cyan)%an <%ae>%Creset%n%B"'
alias gco='git checkout'
alias gd='git diff'
alias gdh='git diff HEAD'
alias gds='git diff --stat'
alias gdt='git difftool'
alias gst='git status'
alias gp='git pull'
alias gf='git fetch'
alias gs='git switch'
alias gm='git merge'
alias gr='git restore'

# docker
alias d='docker'
alias dps='docker ps --format "table {{.Names}}\t{{.Image}}\t{{.Ports}}\t{{.Status}}"'
alias dc='docker-compose'
alias kc='kubectl'

# scripts
alias molokai='open http://monokai.9x4.net/'
alias nuxt-init='~/.scripts/nuxt-init.sh'

# atcoder
alias acc-n='acc new -c next --template node'
alias acc-a='acc add -c next --template node'
alias acc-t='oj test -c "node main.js" -d tests'
alias acc-s='acc s main.js -- -y'
