# tmux: window 名を「リポジトリ名 / ディレクトリ名」に自動設定する。
# 実処理は ~/.scripts/tmux-title に集約 (Claude Code の hook からも同じスクリプトを使う)。
# tmux 外 / ヘルパー未配置(make dotfiles 前や未対応環境)では何もしない。
if [[ -n "$TMUX" && -x ~/.scripts/tmux-title ]]; then
  autoload -Uz add-zsh-hook
  _tmux_title_chpwd() { ~/.scripts/tmux-title keep refresh; }
  add-zsh-hook chpwd _tmux_title_chpwd
  # 起動時は set しない (cd したときだけ更新)
fi
