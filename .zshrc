# Created by newuser for 5.0.6
# なるべくbashの設定を利用
source ~/.bashrc

# colorコードの読み込み
if [ ! -e "${HOME}/.zsh/colorcode" ]; then
    ~/.zsh/gen-256colorlib.sh -z > ${HOME}/.zsh/colorcode
fi
. ${HOME}/.zsh/colorcode

autoload -U compinit
compinit

# historyの設定
HISTFILE=$HOME/.zsh-history
HISTSIZE=100000
SAVEHIST=100000

# LS_COLORS関係
eval `dircolors -b`

# 補完でカラーを使用する
autoload colors
zstyle ':completion:*' verbose yes
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# プロンプト関係
colors
local HOST_COLOR=$'%{\e[38;5;'"$(printf "%d\n" 0x$(hostname|md5sum|cut -c1-2))"'m%}'
PROMPT=" ${COLOR_FG_AFFF00}%~${STYLE_DEFAULT}
 ${COLOR_FG_5FD7FF}%(!.#.$)${STYLE_DEFAULT} "
# 右側に表示
RPROMPT="${HOST_COLOR}[%m]${STYLE_DEFAULT}"

# キーバインド設定
# create a zkbd compatible hash;
# to add other keys to this hash, see: man 5 terminfo
typeset -A key

key[Home]=${terminfo[khome]}
key[End]=${terminfo[kend]}
key[Insert]=${terminfo[kich1]}
key[Delete]=${terminfo[kdch1]}
key[Up]=${terminfo[kcuu1]}
key[Down]=${terminfo[kcud1]}
key[Left]=${terminfo[kcub1]}
key[Right]=${terminfo[kcuf1]}
key[PageUp]=${terminfo[kpp]}
key[PageDown]=${terminfo[knp]}

# setup key accordingly
[[ -n "${key[Home]}"     ]]  && bindkey  "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}"      ]]  && bindkey  "${key[End]}"      end-of-line
[[ -n "${key[Insert]}"   ]]  && bindkey  "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}"   ]]  && bindkey  "${key[Delete]}"   delete-char
[[ -n "${key[Up]}"       ]]  && bindkey  "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}"     ]]  && bindkey  "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}"     ]]  && bindkey  "${key[Left]}"     backward-char
[[ -n "${key[Right]}"    ]]  && bindkey  "${key[Right]}"    forward-char
[[ -n "${key[PageUp]}"   ]]  && bindkey  "${key[PageUp]}"   beginning-of-buffer-or-history
[[ -n "${key[PageDown]}" ]]  && bindkey  "${key[PageDown]}" end-of-buffer-or-history

# word
bindkey "\e[1;5C" forward-word
bindkey "\e[1;5D" backward-word

# Finally, make sure the terminal is in application mode, when zle is
# active. Only then are the values from $terminfo valid.
if (( ${+terminfo[smkx]} )) && (( ${+terminfo[rmkx]} )); then
  function zle-line-init () {
    printf '%s' "${terminfo[smkx]}"
  }
  function zle-line-finish () {
    printf '%s' "${terminfo[rmkx]}"
  }
  zle -N zle-line-init
  zle -N zle-line-finish
fi

# 識別マーク
unsetopt list_types

# screenでのコマンド共有
# シェルを横断して.zshhistoryに記録
setopt inc_append_history
# ヒストリを共有
setopt share_history
