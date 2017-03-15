" 256色対応
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

" 行番号の表示
set number

" モードを非表示
set noshowmode

" キーマップを変更
let mapleader = ","
set t_ut=
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set clipboard=unnamed,unnamedplus


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
NeoBundle 'reireias/previm'
NeoBundle 'Align'
NeoBundleLazy 'vim-scripts/SQLUtilities', {'autoload':{'filetypes':['sql']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}}

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
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 4
" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<Up>" : "\<S-TAB>"
" 
let g:neocomplcache_enable_caching_message = 0

" jedi-vim
"   python or python3が必要
"   neovimの場合はpip3 install neovimを行う
" pythonのバージョンを固定
let g:jedi#force_py_version = 3
" docstringを非表示
autocmd FileType python setlocal completeopt-=preview
" 関数のシグネチャをコマンドラインに表示(set noshowmodeが必要)
let g:jedi#show_call_signatures = 2
" 定義へ移動
let g:jedi#goto_definitions_command = "<C-d>"

" vim-table-mode
let g:table_mode_corner="|"

" syntastic
let g:syntastic_javascript_checkers = ['gjslint']
let g:syntastic_javascript_gjslint_args = '--disable 0110,0120,0213'
let g:syntastic_go_checkers = ['go', 'golint']
set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_save = 1
let g:syntastic_mode_map = { 'passive_filetypes': ['python'] }

" seiya
let g:seiya_auto_enable=1

" SimpyFold

" Previm
let g:previm_open_cmd = ''
let g:previm_show_header = 0
let g:previm_custom_css_path = '~/.vim/bundle/previm/preview/css/dark.css'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" neovim固有設定
if has('nvim')
  " terminal modeからESCでcommand modeに移行
  tnoremap <silent> <ESC> <C-\><C-n>
endif

" 環境固有の設定の読み込み
if filereadable(expand($HOME.'/.vimrc_local'))
    source $HOME/.vimrc_local
endif
