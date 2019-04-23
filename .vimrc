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

set cursorline
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

" search
set inccommand=split

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
  autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType xml setlocal shiftwidth=2 tabstop=2
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType vue setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType json setlocal shiftwidth=2 tabstop=2
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
  autocmd BufRead,BufNewFile *.jenkinsfile set filetype=groovy
augroup END
" }}}


" KeyMap {{{
let g:mapleader = "\<Space>"

" jj is Esc
inoremap <silent> jj <ESC>

" Home / End
noremap <Leader>h ^
noremap <Leader>H 0
noremap <Leader>l $

" Move windows
nnoremap <Leader><Tab> <C-w>w
nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

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

" scroll
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" paste
map R <Plug>(operator-replace)

" Denite
nnoremap [denite] <Nop>
nmap <Leader>d [denite]
nnoremap <silent> [denite]f :<C-u>Denite file/rec<CR>
" }}}


" Plugin {{{
" plugins {{{
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('Xuyuanp/nerdtree-git-plugin')
call dein#add('alvan/vim-closetag')
call dein#add('basyura/TweetVim')
call dein#add('basyura/twibill.vim')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('fatih/molokai')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('junegunn/fzf', { 'build': './install --all --no-bash', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('junegunn/gv.vim')
call dein#add('kana/vim-operator-replace')
call dein#add('kana/vim-operator-user')
call dein#add('kassio/neoterm')
call dein#add('leafgarland/typescript-vim')
call dein#add('mattn/sonictemplate-vim')
call dein#add('miyakogi/seiya.vim')
call dein#add('prettier/vim-prettier')
call dein#add('reireias/vim-cheatsheet')
if filereadable(expand('~/.fonts/Ricty-Regular-nerd-Powerline.ttf'))
  call dein#add('ryanoasis/vim-devicons')
endif
call dein#add('scrooloose/nerdtree')
call dein#add('simeji/winresizer')
call dein#add('thinca/vim-localrc')
call dein#add('thinca/vim-quickrun')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-surround')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('w0rp/ale')
call dein#add('yuttie/comfortable-motion.vim')

if has('nvim')
  call dein#add('Shougo/deoplete.nvim')
endif

" lazy load
" ansible
call dein#add('pearofducks/ansible-vim', {'on_ft' : 'yaml.ansible'})
" go
call dein#add('fatih/vim-go', {'on_ft' : 'go'})
" js
call dein#add('pangloss/vim-javascript', {'on_ft' : 'javascript'})
" markdonw
call dein#add('rcmdnk/vim-markdown', {'on_ft' : 'markdown'})
call dein#add('kannokanno/previm', {'on_ft' : 'markdown'})
" nginx
call dein#add('chr4/nginx.vim', {'on_ft' : 'nginx'})
" plantuml
call dein#add('aklt/plantuml-syntax', {'on_ft' : 'plantuml'})
" python
call dein#add('davidhalter/jedi-vim', {'on_ft' : 'python'})
call dein#add('fs111/pydoc.vim', {'on_ft' : 'python'})
call dein#add('tmhedberg/SimpylFold', {'on_ft' : 'python'})
" ruby
call dein#add('uplus/deoplete-solargraph', {'on_ft' : 'ruby'})
call dein#add('thinca/vim-ref', {'on_ft' : 'ruby'})
call dein#add('itmammoth/run-rspec.vim', {'on_ft' : 'ruby'})
call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})
call dein#add('rlue/vim-fold-rspec', {'on_ft' : 'ruby'})
" sql
call dein#add('vim-scripts/SQLUtilities', {'on_ft' : 'sql'})
" stylus
call dein#add('wavded/vim-stylus', {'on_ft' : 'stylus'})
" terraform
call dein#add('hashivim/vim-terraform', {'on_ft' : 'tf'})
" vue
call dein#add('posva/vim-vue', {'on_ft' : 'vue'})

call dein#end()
" }}}

" Shougo/dein.vim {{{
let g:dein#install_process_timeout = 300
" }}}

" Shougo/denite.nvim {{{
call denite#custom#var('file/rec', 'command',
    \ ['ag', '--follow', '--nocolor', '--nogroup', '-g', ''])
call denite#custom#filter('matcher/ignore_globs', 'ignore_globs',
    \ [ '.git/', '.ropeproject/', '__pycache__/',
    \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/'])
" Ag command on grep source
call denite#custom#var('grep', 'command', ['ag'])
call denite#custom#var('grep', 'default_opts', ['-i', '--vimgrep'])
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', [])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])
" grep
command! Dgrep execute(":Denite grep -buffer-name=grep-buffer-denite")
" show Denite grep results
command! Dresume execute(":Denite -resume -buffer-name=grep-buffer-denite")
" next Denite grep result
command! Dnext execute(":Denite -resume -buffer-name=grep-buffer-denite -select=+1 -immediately")
" previous Denite grep result
command! Dprev execute(":Denite -resume -buffer-name=grep-buffer-denite -select=-1 -immediately")
" keymap
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" }}}

" Shougo/deoplete.nvim {{{
" Use deoplete
let g:deoplete#enable_at_startup = 1
" Set minimum syntax keyword length.
let g:deoplete#auto_complete_start_length = 3
call deoplete#custom#var('omni', 'input_patterns', {
    \ 'ruby': ['[^. *\t]\.\w*', '[a-zA-Z_]\w*::'],
\})
" Define dictionary.
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<Up>" : "\<S-TAB>"
" }}}

" Shougo/neosnippet {{{
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
let g:neosnippet#snippets_directory = [
      \'~/.vim/snippets',
      \'~/.vim/dein/repos/github.com/fatih/vim-go/gosnippets/snippets'
      \]
" }}}

" alvan/vim-closetag {{{
let g:closetag_filenames = '*.html,*.vue'
" }}}

" chr4/nginx.vim {{{
command Nginx set filetype=nginx
" }}}

" davidhalter/jedi-vim {{{
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

" dhruvasagar/vim-table-mode {{{
let g:table_mode_corner = '|'
let g:table_mode_auto_align = 0
" }}}

" fatih/vim-go {{{
let g:go_def_mapping_enabled = 0
let g:go_fmt_autosave = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
" }}}

" fs111/pydoc.vim {{{
let g:pydoc_cmd = '/usr/bin/pydoc3'
" }}}

" kassio/neoterm {{{
let g:neoterm_autoinsert = 1
let g:neoterm_autoscroll = 1
let g:neoterm_default_mod = 'belowright'
let g:neoterm_use_relative_path = 1
" }}}

" mattn/sonictemplate-vim {{{
let g:sonictemplate_vim_template_dir = ['~/.vim/template']
" }}}

" miyakogi/seiya.vim {{{
let g:seiya_auto_enable=1
" }}}

" rcmdnk/vim-markdown {{{
let g:vim_markdown_folding_level = 6
set conceallevel=0
" }}}

" reireias/vim-cheatsheet {{{
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
" }}}

" simeji/winresizer {{{
let g:winresizer_vert_resize = 1
let g:winresizer_horiz_resize = 1
" }}}

" thinca/vim-quickrun {{{
let g:quickrun_config = get(g:, 'quickrun_config', {})
let g:quickrun_config._ = {
      \ 'runner'    : 'vimproc',
      \ 'runner/vimproc/updatetime' : 60,
      \ 'outputter' : 'error',
      \ 'outputter/error/success' : 'buffer',
      \ 'outputter/error/error'   : 'buffer',
      \ 'outputter/buffer/close_on_empty' : 1,
      \ }
nnoremap <Leader>q :<C-u>bw! \[quickrun\ output\]<CR>
" }}}

" vim-airline/vim-airline {{{
let g:airline_theme = 'wombat'
set laststatus=2
" Show branch name
let g:airline#extensions#branch#enabled = 1
" Show buffer's filename
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
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

" w0rp/ale {{{
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
let g:ale_fixers = {
      \'javascript': ['eslint']
      \}
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
  " change list symbol color
  autocmd ColorScheme * highlight link mkdListItem Statement
  " change header color
  autocmd ColorScheme * highlight link htmlH1 PreProc
  " change search result color
  autocmd ColorScheme * highlight Search ctermfg=255 ctermbg=24
augroup END

" Color Scheme
colorscheme molokai
let g:rehash256 = 1

" finally
syntax on
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
