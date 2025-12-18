# TODO

## NeoVim

### 移行状況サマリー

#### 完了 (19項目)
- 基本設定: LSP, Formatter, UI, Completion, File Finder, Yank History
- プラグイン: nvim-cmp, telescope.nvim, lualine.nvim, conform.nvim 等
- github/copilot.vim → copilot.lua (zbirenbaum/copilot.lua)
- CopilotChat.nvim → CopilotChat.nvim (Lua版: CopilotC-Nvim/CopilotChat.nvim)
- alvan/vim-closetag → nvim-ts-autotag (windwp/nvim-ts-autotag)
- tpope/vim-endwise → nvim-autopairs (windwp/nvim-autopairs) で代替
- tpope/vim-fugitive (Git操作)
- tpope/vim-rhubarb (GitHub連携、fugitiveと併用)
- simeji/winresizer (ウィンドウリサイズ)
- iamcco/markdown-preview.nvim (Markdownプレビュー)
- thinca/vim-quickrun (コード実行)

#### 未着手 (8項目)

##### editor.lua に追加すべきもの (6項目)
- kassio/neoterm → toggleterm.nvim (akinsho/toggleterm.nvim)

#### 不要 (8項目)
- Neovim本体に統合済み: vim-surround, vim-commentary, editorconfig
- Tree-sitter/LSPで代替: typescript-vim等の言語別プラグイン
- 旧パッケージマネージャー: dein.vim, vimproc.vim
- その他: open-browser.vim, lsp-format.nvim

---

### 詳細一覧

元のプラグイン                 判定・Neovim 0.11での扱い  推奨される移行先 / ステータス
neovim/nvim-lspconfig          移行済み (lsp.lua)         Neovim LSPの標準設定ツール
mason.nvim / mason-lspconfig   移行済み (lsp.lua)         LSP/Linterサーバー管理
w0rp/ale                       移行済み (lsp.lua)         Neovim標準の Diagnostic に移行
prettier/vim-prettier          移行済み (formatter.lua)   conform.nvim で制御
reireias/molokai               移行済み (ui.lua)          そのまま継続（Molokai2）
miyakogi/seiya.vim             移行済み (ui.lua)          本体 highlight 設定による背景透過で対応
vim-airline / themes           移行済み (ui.lua)          lualine.nvim へ移行
kana/vim-operator-replace      移行済み (editor.lua)      そのまま継続（依存関係含む）
machakann/vim-highlightedyank  移行済み (autocmds.lua)    vim.highlight.on_yank で実装
tpope/vim-surround             不要                       Neovim 0.10+ で標準搭載（削除済み）
tpope/vim-commentary           不要                       Neovim 0.10+ で gc 等が標準搭載
editorconfig/editorconfig-vim  不要                       Neovim 0.9+ で標準搭載
shougo/dein.vim                不要                       lazy.nvim へ移行済み
shougo/denite / unite / fzf    移行済み (editor.lua)      telescope.nvim へ移行
neomru.vim / neoyank.vim       移行済み (editor.lua)      yanky.nvim (telescope拡張) へ移行
ddc.vim / ddc-* 関連一式       移行済み (coding.lua)      nvim-cmp + LuaSnip へ移行完了
github/copilot.vim             未着手                     copilot.lua (Lua版) への移行が推奨
CopilotChat.nvim               未着手                     そのまま継続可能 or CopilotChat.nvim (Lua版)
tpope/vim-fugitive / rhubarb   未着手                     Git操作の定番としてそのまま継続推奨
tpope/vim-endwise              未着手                     nvim-autopairs 等で代替可能だが継続も可
simeji/winresizer              未着手                     代替がないためそのまま継続推奨
alvan/vim-closetag             未着手                     nvim-ts-autotag (Tree-sitter利用) が強力
nvim-treesitter                移行済み (editor.lua)      Tree-sitter本体 + 各種パーサー導入済み
leafgarland/typescript-vim等   不要                       Tree-sitter により構文解析は本体で完結
rcmdnk/vim-markdown            移行済み (editor.lua)      ft=markdownで遅延読み込み
iamcco/markdown-preview.nvim   未着手                     Markdownプレビューとして継続推奨
thinca/vim-quickrun            未着手                     そのまま継続可能
tyru/open-browser.vim          不要                       gx でのブラウザ起動が標準搭載
ryanoasis/vim-devicons         移行済み (ui.lua)          nvim-web-devicons へ移行完了
kassio/neoterm                 未着手                     toggleterm.nvim 等が現代的
lukas-reineke/lsp-format.nvim  不要                       conform.nvim (導入済み) で完結
shougo/vimproc.vim             不要                       Neovimの非同期Job APIによりほぼ不要
各言語別プラグイン             不要/部分移行              Tree-sitter + LSP で大半代替可能
