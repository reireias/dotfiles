" 画面上でタブ文字が占める幅
set tabstop=4
" 自動インデントでずれる幅
set shiftwidth=4
" 連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
set softtabstop=1

" 挿入時のカーソルの形を指定
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" キーマップを変更
let mapleader = ","
set number
set backspace=indent,eol,start
syntax on
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932
set clipboard=unnamed,autoselect,unnamedplus

" カラースキーマに関する設定
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

" 環境によっては以下のruntimepathの設定を書き換える必要があるかも
if has('vim_starting')
  " Required:
  set runtimepath+=~/.bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))


NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'dhruvasagar/vim-table-mode'
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
" フォントによっては以下のセパレータが表示されない
" let g:airline_left_sep = '⮀'
" let g:airline_right_sep = '⮂'

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
" 補完のプレビューウィンドウを下に表示にする
set splitbelow

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

