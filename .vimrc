"                                _                    
"                         __   _(_)_ __ ___  _ __ ___ 
"                         \ \ / / | '_ ` _ \| '__/ __|
"                          \ V /| | | | | | | | | (__ 
"                         (_)_/ |_|_| |_| |_|_|  \___|
"

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

" Fold
set foldlevel=100

" Encoding
set encoding=utf-8
scriptencoding utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

" Font
set guifont=Ricty-Regular-nerd-Powerline\ 11

" Clipboard
set clipboard=unnamed,unnamedplus
" }}}


" File Types {{{
augroup vimrc_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 foldmethod=marker
  autocmd FileType vim :highlight link FoldComment SpecialComment
  autocmd FileType vim :match FoldComment /^".*\({{{\|}}}\)/
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType xml setlocal shiftwidth=2 tabstop=2
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType zsh setlocal foldmethod=marker
  autocmd FileType zsh :highlight link FoldComment SpecialComment
  autocmd FileType zsh :match FoldComment /^#.*\({{{\|}}}\)/
  autocmd FileType go nmap <leader>b <Plug>(go-build)
  autocmd FileType go nmap <leader>r <Plug>(go-run)
  autocmd FileType go nmap <leader>t <Plug>(go-test)
  autocmd FileType go nmap <leader>tf <Plug>(go-test-func)
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <leader>i <Plug>(go-info)
  autocmd FileType go :highlight goErr ctermfg=208
  autocmd FileType go :match goErr /\<err\>/
augroup END
" }}}


" KeyMap {{{
let g:mapleader = "\<Space>"

" Home / End
noremap <Leader>h ^
noremap <Leader>l $

" Move to next window
nnoremap <Leader><Tab> <C-w>w

" Unhighlight search result
nnoremap <Esc><Esc> :<C-u>nohlsearch<CR>

" Show outline
nnoremap <Leader>o :<C-u>Unite -vertical -winwidth=30 -no-quit outline<CR>

" Buffer
nnoremap <Leader>bp :bprevious<CR>
nnoremap <Leader>bn :bnext<CR>
nnoremap <Leader>bb :b#<CR>
nnoremap <Leader>bd :bdelete<CR>

" QuickFix
noremap <C-n> :cnext<CR>
noremap <C-p> :cprevious<CR>

" snippets
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
xmap <C-k> <Plug>(neosnippet_expand_target)

" NERDTree
noremap <C-t> :NERDTreeToggle<CR>
" }}}


" Plugin {{{
" plugins {{{
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/unite-outline')
call dein#add('Shougo/unite.vim')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('fatih/molokai')
call dein#add('janko-m/vim-test')
call dein#add('leafgarland/typescript-vim')
call dein#add('mattn/sonictemplate-vim')
call dein#add('miyakogi/seiya.vim')
call dein#add('pearofducks/ansible-vim')
call dein#add('reireias/vim-cheatsheet')
call dein#add('ryanoasis/vim-devicons')
call dein#add('ryym/vim-riot')
call dein#add('scrooloose/nerdtree')
call dein#add('simeji/winresizer')
call dein#add('thinca/vim-quickrun')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('tpope/vim-dispatch')
call dein#add('tpope/vim-fugitive')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('w0rp/ale')

if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
endif

" lazy load
" sql
call dein#add('vim-scripts/SQLUtilities', {'on_ft' : 'sql'})
" js
call dein#add('jelera/vim-javascript-syntax', {'on_ft' : 'javascript'})
" python
call dein#add('davidhalter/jedi-vim', {'on_ft' : 'python'})
call dein#add('fs111/pydoc.vim', {'on_ft' : 'python'})
call dein#add('tmhedberg/SimpylFold', {'on_ft' : 'python'})
" go
call dein#add('fatih/vim-go', {'on_ft' : 'go'})
" markdonw
call dein#add('rcmdnk/vim-markdown', {'on_ft' : 'markdown'})
call dein#add('suan/vim-instant-markdown', {'on_ft' : 'markdown'})
" vue
call dein#add('posva/vim-vue', {'on_ft' : 'vue'})

call dein#end()
" }}}

" dein {{{
let g:dein#install_process_timeout = 300
" }}}

" airline {{{
let g:airline_theme = 'wombat'
set laststatus=2
" Show branch name
let g:airline#extensions#branch#enabled = 1
" Show buffer's filename
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#wordcount#enabled = 0
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'y', 'z']]
let g:airline_section_c = '%t'
let g:airline_section_x = '%{&filetype}'
let g:airline_section_z = '%3l:%2v %{airline#extensions#ale#get_warning()} %{airline#extensions#ale#get_error()}'
let g:airline#extensions#ale#error_symbol = ' '
let g:airline#extensions#ale#warning_symbol = ' '
let g:airline#extensions#default#section_truncate_width = {}
" Check whitespace at end of line
let g:airline#extensions#whitespace#enabled = 1
" }}}

" deoplete {{{
" Use deoplete
let g:deoplete#enable_at_startup = 1
" Set minimum syntax keyword length.
let g:deoplete#auto_complete_start_length = 3
" Define dictionary.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<Up>" : "\<S-TAB>"
" }}}

" neosnippet {{{
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/dein/repos/github.com/fatih/vim-go/gosnippets/snippets'
      \]
" }}}

" vim-table-mode {{{
let g:table_mode_corner = '|'
let g:table_mode_auto_align = 0
" }}}

" ale {{{
let g:ale_lint_on_text_changed = 0
let g:ale_sign_error = ''
let g:ale_sign_warning = ''
let g:airline#extensions#ale#open_lnum_symbol = '('
let g:airline#extensions#ale#close_lnum_symbol = ')'
let g:ale_echo_msg_format = '[%linter%]%code: %%s'
highlight link ALEErrorSign Tag
highlight link ALEWarningSign StorageClass
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
" }}}

" seiya {{{
let g:seiya_auto_enable=1
" }}}

" vim-instant-markdown {{{
let g:instant_markdown_autostart = 0
" }}}

" vim-quickrun {{{
let g:quickrun_config = {
      \   '_': {
      \       'outputter/buffer/close_on_empty': 1,
      \       'outputter/buffer/append': 1
      \   }
      \}
" }}}

" winresizer {{{
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
" }}}

" unite-outline {{{
let g:unite_split_rule = 'botright'
" }}}

" jedi-vim {{{
" needs python3 and 'pip3 install neovim'
" python version
let g:jedi#force_py_version = 3
" hide docstring
set completeopt=menu,menuone
" Show function signature on command line (need 'set noshowmode')
let g:jedi#show_call_signatures = 2
" Go to definitions
let g:jedi#goto_definitions_command = 'None'
command PyDef call jedi#goto_definitions()
" Remove show document command
let g:jedi#documentation_command = 'None'
" Remove rename command (for vim-quickrun)
let g:jedi#rename_command = 'None'
command PyRename call jedi#rename()
" }}}

" pydoc {{{
let g:pydoc_cmd = '/usr/bin/pydoc3'
" }}}

" vim-go {{{
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" }}}

" vim-markdown {{{
let g:vim_markdown_folding_level = 6
set conceallevel=0
" }}}

" vim-cheatsheet {{{
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
" }}}

" sonictemplate {{{
let g:sonictemplate_vim_template_dir = ['~/.vim/template']
" }}}

" vim-test {{{
let g:test#strategy = 'dispatch'

function! test#python#pyunit#executable() abort
  return 'python3 -m unittest'
endfunction
" }}}

" finally {{{
" Load plugin/indent settings when filetype changed
filetype plugin indent on

if dein#check_install()
  call dein#install()
endif
" }}}
" }}}


" Color {{{
" Custom
augroup color_scheme
  autocmd!
  autocmd ColorScheme * highlight link mkdListItem Statement
  autocmd ColorScheme * highlight link htmlH1 PreProc
augroup END

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
if filereadable(expand($HOME.'/.vimrc_local'))
  source $HOME/.vimrc_local
endif
" }}}
