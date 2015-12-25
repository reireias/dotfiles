"screenで256色表示する
if $TERM == 'screen-bce' || $TERM == 'screen'
    set t_Co=256
endif
set expandtab "タブ入力を複数の空白入力に置き換える
set tabstop=4 "画面上でタブ文字が占める幅
set shiftwidth=4 "自動インデントでずれる幅
set softtabstop=1 "連続した空白に対してタブキーやバックスペースキーでカーソルが動く幅
"set autoindent "改行時に前の行のインデントを継続する
"set smartindent "改行時に入力された行の末尾に合わせて次の行のインデントを増減する

"screen用と通常用に設定を分割
if $TERM == 'screen-bce'
    let &t_ti.="\eP\e[1 q\e\\" "カーソルを調整
    let &t_SI.="\eP\e[5 q\e\\" "カーソルを調整
    let &t_EI.="\eP\e[1 q\e\\" "カーソルを調整
    let &t_te.="\eP\e[0 q\e\\" "カーソルを調整
else
    let &t_ti.="\e[1 q" "カーソルを調整
    let &t_SI.="\e[5 q" "カーソルを調整
    let &t_EI.="\e[1 q" "カーソルを調整
    let &t_te.="\e[0 q" "カーソルを調整
endif

let mapleader = ","

set number
set backspace=indent,eol,start "Backspaceを調整
colorscheme molokai
syntax on
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark
set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8
set clipboard=unnamed,autoselect,unnamedplus

" markdownのハイライトを有効にする
set syntax=markdown
au BufRead,BufNewFile *.md set filetype=markdown

" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

" 環境によっては以下のruntimepathの設定を書き換える必要があるかも
if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'bling/vim-airline'
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
  "let g:airline_left_sep = ''

NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

NeoBundle 'Shougo/neocomplcache'
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

NeoBundle 'dhruvasagar/vim-table-mode'

" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

