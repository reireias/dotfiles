" General {{{
" Indent
set tabstop=4
set shiftwidth=4
set expandtab

set title
set number
set noshowmode
set list
set listchars=tab:»-

" Encoding
set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" Clipboard
set clipboard=unnamed,unnamedplus
" }}}

" File Types {{{
augroup vimrc_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 fdm=marker
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType xml setlocal shiftwidth=2 tabstop=2
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
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
if &compatible
  set nocompatible
endif
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('tomasr/molokai')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('Shougo/neocomplcache')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('scrooloose/syntastic')
call dein#add('miyakogi/seiya.vim')
call dein#add('tyru/open-browser.vim')
call dein#add('reireias/previm')
call dein#add('vim-scripts/Align')
call dein#add('thinca/vim-quickrun')
call dein#add('simeji/winresizer')
call dein#add('cocopon/vaffle.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/unite-outline')
call dein#add('tpope/vim-fugitive')
call dein#add('pearofducks/ansible-vim')
call dein#add('leafgarland/typescript-vim')
call dein#add('ryym/vim-riot')

" lazy load
call dein#add('vim-scripts/SQLUtilities', {'on_ft' : 'sql'})
call dein#add('jelera/vim-javascript-syntax', {'on_ft' : 'javascript'})
call dein#add('davidhalter/jedi-vim', {'on_ft' : 'python'})
call dein#add('fs111/pydoc.vim', {'on_ft' : 'python'})
call dein#add('tmhedberg/SimpylFold', {'on_ft' : 'python'})
call dein#add('fatih/vim-go', {'on_ft' : 'go'})

call dein#end()

" dein
let g:dein#install_process_timeout = 300

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
let g:table_mode_auto_align = 0

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

" vim-go
let g:go_fmt_autosave = 1

" Load plugin/indent settings when filetype changed
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
" }}}


" Color {{{
" Color Scheme
colorscheme molokai
let g:rehash256 = 1

syntax on
set cursorline
hi clear CursorLine
" }}}


" Environment {{{
" neovim
if has('nvim')
  tnoremap <silent> <ESC> <C-\><C-n>
endif

" Load local settings
if filereadable(expand($HOME.'/.env/.vimrc'))
    source $HOME/.env/.vimrc
endif
" }}}
