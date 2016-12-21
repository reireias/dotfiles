set t_Co=256
" タブ入力を複数の空白入力に置き換える
set expandtab 
" 画面上でタブ文字が占める幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=1
" ターミナルのタイトルにファイル名を表示
set title

set number

" キーマップを変更
let mapleader = ","
set t_ut=
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set clipboard=unnamed,unnamedplus

" terminal modeからESCでcommand modeに移行
tnoremap <silent> <ESC> <C-\><C-n>

" カラースキーマに関する設定
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

" ------------------------
"  NeoBundle
" ------------------------

" 環境によっては以下のruntimepathの設定を書き換える必要があるかも
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'tmhedberg/SimpylFold'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'kannokanno/previm'
NeoBundle 'Align'
NeoBundleLazy 'vim-scripts/SQLUtilities', {'autoload':{'filetypes':['sql']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

" airline
let g:airline_theme = 'wombat'
set laststatus=2
let g:airline_enable_branch = 0
let g:airline_section_b = "%t %M"
let g:airline_section_c = ''
let s:sep = " %{get(g:, 'airline_right_alt_sep', '')} "
let g:airline_section_x =
            \ "%{strlen(&fileformat)?&fileformat:''}".s:sep.
            \ "%{strlen(&fenc)?&fenc:&enc}".s:sep.
            \ "%{strlen(&filetype)?&filetype:'no ft'}"
let g:airline_section_y = '%3p%%'
let g:airline_section_z = get(g:, 'airline_linecolumn_prefix', '').'%3l:%-2v'
let g:airline#extensions#whitespace#enabled = 0

" neocomplcache
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" " Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" " Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" " Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" jedi-vim
" Disable AutoComplPop.
" let g:acp_enableAtStartup = 0
autocmd FileType python setlocal omnifunc=jedi#completions
let g:jedi#auto_vim_configuration = 0
let g:jedi#completions_enabled = 1
" 補完のプレビューウィンドウを下に表示にする
set splitbelow
" 補完の最初の項目が選択された状態だと使いにくいためオフにする
let g:jedi#popup_select_first = 0


" syntastic
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_javascript_gjslint_args = '--disable 0110,0120,0213'
let g:syntastic_go_checkers = ['go', 'golint']
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" seiya
let g:seiya_auto_enable=1

" SimpyFold

" Previm
let g:previm_open_cmd = ''

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" 環境固有の設定の読み込み
if filereadable(expand($HOME.'/.vimrc_local'))
    source $HOME/.vimrc_local
endif
