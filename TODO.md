# TODO

## NeoVim

元のプラグイン                 判定・Neovim 0.11での扱い  推奨される移行先 / ステータス
neovim/nvim-lspconfig          移行済み (lsp.lua)         Neovim LSPの標準設定ツール
mason.nvim / mason-lspconfig   移行済み (lsp.lua)         LSP/Linterサーバー管理
w0rp/ale                       移行済み (lsp.lua)         Neovim標準の Diagnostic に移行
prettier/vim-prettier          移行済み (formatter.lua)   conform.nvim で制御
reireias/molokai               移行済み (ui.lua)          そのまま継続（Molokai2）
miyakogi/seiya.vim             移行済み (ui.lua)          本体 highlight 設定による背景透過で対応
vim-airline / themes           移行済み (ui.lua)          lualine.nvim へ移行
kana/vim-operator-replace      移行済み (editor.lua)      そのまま継続（依存関係含む）
machakann/vim-highlightedyank  本体実装済み               移行済み (autocmds.lua) vim.highlight.on_yank
tpope/vim-surround             移行完了 (editor.lua)      廃止
tpope/vim-commentary           本体実装済み               Neovim 0.10+ で gc 等が標準搭載
editorconfig/editorconfig-vim  本体実装済み               Neovim 0.9+ で標準搭載
shougo/dein.vim                不要                       lazy.nvim へ移行済み
shougo/denite / unite / fzf    移行済み                   telescope.nvim (完了)
neomru.vim / neoyank.vim       移行済み                   telescope.nvim へ移行(neoyankのみ)
ddc.vim / ddc-* 関連一式       置換推奨                   nvim-cmp へ移行 (coding.lua / 未着手)
github/copilot.vim             継続または置換             copilot.lua (Lua版) への移行が一般的
CopilotChat.nvim               継続                       そのまま継続可能 (coding.lua / 未着手)
tpope/vim-fugitive / rhubarb   継続                       Git操作の定番としてそのまま継続推奨
tpope/vim-endwise              継続または置換             nvim-autopairs 等で代替可能だが継続も可
simeji/winresizer              継続                       代替がないためそのまま継続推奨 (未着手)
alvan/vim-closetag             置換推奨                   nvim-ts-autotag (Tree-sitter利用) が強力
leafgarland/typescript-vim等   本体機能で十分             Tree-sitter により構文解析は本体で完結
iamcco/markdown-preview.nvim   継続                       Markdownプレビューとして継続
thinca/vim-quickrun            継続                       そのまま継続可能
tyru/open-browser.vim          本体実装済み               gx でのブラウザ起動が標準搭載
ryanoasis/vim-devicons         置換推奨                   nvim-web-devicons (Lua版) へ移行
kassio/neoterm                 置換推奨                   toggleterm.nvim 等が現代的
lukas-reineke/lsp-format.nvim  不要                       conform.nvim (導入済み) で完結
shougo/vimproc.vim             不要                       Neovimの非同期Job APIによりほぼ不要
各言語別プラグイン             不要                       Tree-sitter と LSP でほぼ代替可能
