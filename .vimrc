" General {{{
" Indent
set tabstop=4
set shiftwidth=4

set title
set number
set noshowmode

" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" Clipboard
set clipboard=unnamed,unnamedplus
" }}}


" Color {{{
" Color Scheme
colorscheme molokai
let g:rehash256 = 1

syntax on
set cursorline
hi clear CursorLine
" }}}


" File Types {{{
augroup vimrc_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 fdm=marker
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType xml setlocal shiftwidth=2 tabstop=2
augroup END
" }}}


" KeyMap {{{
let mapleader = "\<Space>"

" Home / End
noremap <Leader>h ^
noremap <Leader>l $

" Move to next window
nnoremap <Leader><Tab> <C-w>w

" Unhighlight search result
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" Show outline
nnoremap <Leader>o :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>
" }}}


" Plugin {{{
if has('vim_starting')
  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'vim-airline/vim-airline'
NeoBundle 'vim-airline/vim-airline-themes'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'dhruvasagar/vim-table-mode'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'miyakogi/seiya.vim'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'reireias/previm'
NeoBundle 'Align'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'simeji/winresizer'
NeoBundle 'cocopon/vaffle.vim'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'tpope/vim-fugitive'
NeoBundleLazy 'vim-scripts/SQLUtilities', {'autoload':{'filetypes':['sql']}}
NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}
NeoBundleLazy 'davidhalter/jedi-vim', {'autoload':{'filetypes':['python']}}
NeoBundleLazy 'fs111/pydoc.vim', {'autoload':{'filetypes':['python']}}
NeoBundleLazy 'tmhedberg/SimpylFold', {'autoload':{'filetypes':['python']}}

call neobundle#end()

" airline
let g:airline_theme = 'wombat'
set laststatus=2
" Show branch name
let g:airline#extensions#branch#enabled = 1
" Show buffer's filename
let g:airline#extensions#tabline#enabled = 1
let g:airline_section_z = '%3p%% %4l/%L:%3v'
" Check whitespace at end of line
let g:airline#extensions#whitespace#enabled = 1

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
let g:neocomplcache_enable_caching_message = 0

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

" Previm
let g:previm_open_cmd = ''
let g:previm_show_header = 0
let g:previm_custom_css_path = '~/.vim/bundle/previm/preview/css/dark.css'

" vim-quickrun
let g:quickrun_config = {
\   "_": {
\       "outputter/buffer/close_on_empty": 1,
\       "outputter/buffer/append": 1
\   }
\}

" winresizer
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1

" unite-outline
" Display at bottom or right
let g:unite_split_rule = 'botright'

" jedi-vim
"   needs python3 and 'pip3 install neovim'
" python version
let g:jedi#force_py_version = 3
" hide docstring
set completeopt=menu,menuone
" Show function signature on command line (need 'set noshowmode')
let g:jedi#show_call_signatures = 2
" Go to definitions
let g:jedi#goto_definitions_command = "<C-d>"
" Remove show document command
let g:jedi#documentation_command = "None"
" Remove rename command (for vim-quickrun)
let g:jedi#rename_command = "None"

" pydoc
let g:pydoc_cmd = '/usr/bin/pydoc3'

" Load plugin/indent settings when filetype changed
filetype plugin indent on

NeoBundleCheck
" }}}


" Environment {{{
" neovim
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

" Load local settings
if filereadable(expand($HOME.'/.vimrc_local'))
    source $HOME/.vimrc_local
endif
" }}}
