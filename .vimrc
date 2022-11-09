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

" Search
if has('nvim')
  set inccommand=split
endif

" Clipboard
set clipboard=unnamed,unnamedplus

" Other
set cursorline
set title
set number
set noshowmode
set mouse=
" }}}

" Commands {{{
command! VimShowHlGroup echo synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
command! VimShowHlItem echo synIDattr(synID(line('.'), col('.'), 1), 'name')
" command! CocFmt :call CocAction('format')
" }}}


" File Types {{{
augroup vimrc_filetype
  autocmd!
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile *.jenkinsfile set filetype=groovy
  autocmd BufRead,BufNewFile *.css,*.scss,*.less setlocal foldmethod=marker foldmarker={,}

  autocmd FileType go :highlight goErr ctermfg=208
  autocmd FileType go :match goErr /\<err\>/
  autocmd FileType html setlocal shiftwidth=2 tabstop=2
  autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
  autocmd FileType json setlocal shiftwidth=2 tabstop=2
  autocmd FileType ruby setlocal shiftwidth=2 tabstop=2
  autocmd FileType vim setlocal shiftwidth=2 tabstop=2 foldmethod=marker
  autocmd FileType vim :highlight link FoldComment SpecialComment
  autocmd FileType vim :match FoldComment /^".*\({{{\|}}}\)/
  autocmd FileType vue setlocal shiftwidth=2 tabstop=2
  autocmd FileType vue syntax sync fromstart
  autocmd FileType xml setlocal shiftwidth=2 tabstop=2
  autocmd FileType yaml setlocal shiftwidth=2 tabstop=2
  autocmd FileType zsh setlocal foldmethod=marker
  autocmd FileType zsh :highlight link FoldComment SpecialComment
  autocmd FileType zsh :match FoldComment /^#.*\({{{\|}}}\)/
  " disable ALE for lsp
  autocmd FileType python ALEDisable
  autocmd FileType yaml ALEDisable
  autocmd FileType typescript ALEDisable
  autocmd FileType cpp ALEDisable
  " disable coc
  autocmd FileType denite-filter let b:coc_suggest_disable = 1
augroup END
" }}}


" KeyMap {{{
let g:mapleader = "\<Space>"

" jj is Esc
inoremap <silent> jj <ESC>

" save
nnoremap <Leader>w :w<CR>

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
nnoremap st <C-w>t
nnoremap sb <C-w>b

" <TAB>: completion.
" inoremap <silent><expr> <TAB>  coc#pum#visible() ? coc#pum#next(1) : "\<TAB>"
" inoremap <silent><expr> <S-TAB>  coc#pum#visible() ? coc#pum#prev(1) : "\<S-TAB>"
" inoremap <silent><expr> <down> coc#pum#visible() ? coc#pum#next(1) : "\<down>"
" inoremap <silent><expr> <up> coc#pum#visible() ? coc#pum#prev(1) : "\<up>"
" inoremap <silent><expr> <CR>  coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

" snippets
" imap <C-k> <Plug>(coc-snippets-expand-jump)

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

" scroll
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>

" select
snoremap <CR> <BS>i

" paste
map R <Plug>(operator-replace)

" Denite
nnoremap [denite] <Nop>
nmap <Leader>d [denite]
nnoremap <silent> [denite]f :<C-u>Denite file/rec<CR>
nnoremap <silent> [denite]b :<C-u>Denite buffer<CR>

" Go
augroup key_map
  autocmd!
  autocmd FileType go nmap <Leader>gb <Plug>(go-build)
  autocmd FileType go nmap <Leader>gr <Plug>(go-run)
  autocmd FileType go nmap <Leader>gt <Plug>(go-test)
  autocmd FileType go nmap <Leader>gtf <Plug>(go-test-func)
  autocmd FileType go nmap <Leader>gc <Plug>(go-coverage-toggle)
  autocmd FileType go nmap <Leader>gi <Plug>(go-info)
augroup END

" coc.nvim
" nmap <silent> <Leader>cd <Plug>(coc-definition)
" nmap <silent> <Leader>cr <Plug>(coc-references)
" nmap <silent> <Leader>cre <Plug>(coc-rename)

if has('nvim')
  " terminal
  tnoremap <silent> <ESC> <C-\><C-n>
endif
" }}}


" Plugin {{{
" plugins {{{
set runtimepath+=~/.vim/dein/repos/github.com/Shougo/dein.vim

call dein#begin(expand('~/.vim/dein'))

call dein#add('Shougo/context_filetype.vim')
call dein#add('Shougo/ddc-matcher_head')
call dein#add('Shougo/ddc-sorter_rank')
call dein#add('Shougo/ddc-source-around')
call dein#add('Shougo/ddc-source-nvim-lsp')
call dein#add('Shougo/ddc-ui-native')
call dein#add('Shougo/ddc.vim')
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/denite.nvim')
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/neoyank.vim')
call dein#add('Shougo/unite.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})
call dein#add('alvan/vim-closetag')
call dein#add('basyura/TweetVim')
call dein#add('basyura/twibill.vim')
call dein#add('dhruvasagar/vim-table-mode')
call dein#add('editorconfig/editorconfig-vim')
call dein#add('hashivim/vim-terraform')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('junegunn/fzf', { 'build': './install --all --no-bash', 'merged': 0 })
call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })
call dein#add('junegunn/gv.vim')
call dein#add('kana/vim-operator-replace')
call dein#add('kana/vim-operator-user')
call dein#add('kassio/neoterm')
call dein#add('leafgarland/typescript-vim')
call dein#add('machakann/vim-highlightedyank')
call dein#add('matsui54/denops-popup-preview.vim')
call dein#add('mattn/sonictemplate-vim')
call dein#add('miyakogi/seiya.vim')
call dein#add('neovim/nvim-lspconfig')
" call dein#add('neoclide/coc.nvim', {'branch': 'release'})
call dein#add('prettier/vim-prettier')
call dein#add('reireias/molokai')
call dein#add('reireias/vim-cheatsheet')
call dein#add('reireias/vim-tfsec')
if filereadable(expand('~/.fonts/Ricty-Regular-nerd-Powerline.ttf'))
  call dein#add('ryanoasis/vim-devicons')
endif
call dein#add('simeji/winresizer')
call dein#add('thinca/vim-localrc')
call dein#add('thinca/vim-quickrun')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-endwise')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-rhubarb')
call dein#add('tpope/vim-surround')
call dein#add('tyru/open-browser.vim')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('vim-denops/denops.vim')
call dein#add('vim-jp/vimdoc-ja')
call dein#add('w0rp/ale')
call dein#add('williamboman/mason.nvim')
call dein#add('williamboman/mason-lspconfig.nvim')
call dein#add('yuttie/comfortable-motion.vim')

" lazy load
" ansible
call dein#add('pearofducks/ansible-vim', {'on_ft' : 'yaml.ansible'})
" go
call dein#add('fatih/vim-go', {'on_ft' : 'go'})
" js
call dein#add('pangloss/vim-javascript', {'on_ft' : ['javascript', 'vue']})
" markdonw
call dein#add('rcmdnk/vim-markdown', {'on_ft' : 'markdown'})
call dein#add('kannokanno/previm', {'on_ft' : 'markdown'})
" nginx
call dein#add('chr4/nginx.vim', {'on_ft' : 'nginx'})
" plantuml
call dein#add('aklt/plantuml-syntax', {'on_ft' : 'plantuml'})
" python
call dein#add('tmhedberg/SimpylFold', {'on_ft' : 'python'})
" ruby
call dein#add('itmammoth/run-rspec.vim', {'on_ft' : 'ruby'})
call dein#add('tpope/vim-rails', {'on_ft' : 'ruby'})
call dein#add('rlue/vim-fold-rspec', {'on_ft' : 'ruby'})
" sql
call dein#add('vim-scripts/SQLUtilities', {'on_ft' : 'sql'})
" stylus
call dein#add('wavded/vim-stylus', {'on_ft' : 'stylus'})
" vue
call dein#add('posva/vim-vue', {'on_ft' : 'vue'})
call dein#add('digitaltoad/vim-pug', {'on_ft' : 'vue'})
" cpp
call dein#add('rhysd/vim-clang-format', { 'on_ft' : 'cpp' })

call dein#end()
" }}}

" Shougo/dein.vim {{{
let g:dein#install_process_timeout = 300
" }}}

" Shougo/denite.nvim {{{
augroup denite_filter
  autocmd FileType denite call s:denite_my_settings()
  function! s:denite_my_settings() abort
    nnoremap <silent><buffer><expr> <CR>
    \ denite#do_map('do_action')
    nnoremap <silent><buffer><expr> d
    \ denite#do_map('do_action', 'delete')
    nnoremap <silent><buffer><expr> p
    \ denite#do_map('do_action', 'preview')
    nnoremap <silent><buffer><expr> q
    \ denite#do_map('quit')
    nnoremap <silent><buffer><expr> i
    \ denite#do_map('open_filter_buffer')
    nnoremap <silent><buffer><expr> <Space>
    \ denite#do_map('toggle_select').'j'
  endfunction
augroup END
" use floating
let s:denite_win_width_percent = 0.85
let s:denite_win_height_percent = 0.7
let s:denite_default_options = {
    \ 'split': 'floating',
    \ 'winwidth': float2nr(&columns * s:denite_win_width_percent),
    \ 'wincol': float2nr((&columns - (&columns * s:denite_win_width_percent)) / 2),
    \ 'winheight': float2nr(&lines * s:denite_win_height_percent),
    \ 'winrow': float2nr((&lines - (&lines * s:denite_win_height_percent)) / 2),
    \ 'highlight_filter_background': 'DeniteFilter',
    \ 'prompt': '$ ',
    \ 'start_filter': v:true,
    \ }
let s:denite_option_array = []
for [s:key, s:value] in items(s:denite_default_options)
  call add(s:denite_option_array, '-'.s:key.'='.s:value)
endfor
call denite#custom#option('default', s:denite_default_options)

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
command! -nargs=? Dgrep call s:Dgrep(<f-args>)
function s:Dgrep(...)
  if a:0 > 0
    execute(':Denite -buffer-name=grep-buffer-denite grep -path='.a:1)
  else
    execute(':Denite -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').' grep')
  endif
endfunction
" show Denite grep results
command! Dresume execute(':Denite -resume -buffer-name=grep-buffer-denite '.join(s:denite_option_array, ' ').'')
" next Denite grep result
command! Dnext execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=+1 -immediately '.join(s:denite_option_array, ' ').'')
" previous Denite grep result
command! Dprev execute(':Denite -resume -buffer-name=grep-buffer-denite -cursor-pos=-1 -immediately '.join(s:denite_option_array, ' ').'')
" keymap
call denite#custom#map('insert', '<C-n>', '<denite:move_to_next_line>', 'noremap')
call denite#custom#map('insert', '<C-p>', '<denite:move_to_previous_line>', 'noremap')
" }}}

" alvan/vim-closetag {{{
let g:closetag_filenames = '*.html,*.vue,*.html.erb'
" }}}

" chr4/nginx.vim {{{
command! Nginx set filetype=nginx
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

" neoclide/coc.nvim {{{
" let g:coc_global_extensions = [
"       \ 'coc-yaml',
"       \ 'coc-jedi',
"       \ 'coc-vetur',
"       \ 'coc-solargraph',
"       \ 'coc-json',
"       \ 'coc-css',
"       \ 'coc-tsserver',
"       \ 'coc-tslint-plugin',
"       \ 'coc-snippets'
"       \]
" }}}

" rcmdnk/vim-markdown {{{
let g:vim_markdown_folding_level = 6
set conceallevel=0
" }}}

" reireias/vim-cheatsheet {{{
let g:cheatsheet#cheat_file = '~/.cheatsheet.md'
let g:cheatsheet#float_window = 1
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
let g:airline#extensions#tabline#buffer_nr_show = 1
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
let g:ale_linters = {
      \ 'ruby': ['rubocop', 'ruby', 'solargraph'],
      \ 'zsh': ['shellcheck']
      \ }
let g:ale_fixers = {
      \ 'javascript': ['eslint']
      \ }
" }}}

" TODO
lua <<EOF
  require'mason'.setup{}
  require'mason-lspconfig'.setup{}
  require'lspconfig'.terraformls.setup{}
  require'lspconfig'.tsserver.setup{}
  require'lspconfig'.yamlls.setup{}
  require'lspconfig'.jedi_language_server.setup{}
  require'lspconfig'.vuels.setup{}
  require'lspconfig'.solargraph.setup{}
  require'lspconfig'.jsonls.setup{}
  require'lspconfig'.cssls.setup{}
  require'lspconfig'.denols.setup{}
EOF

call ddc#custom#patch_global('ui', 'native')
call ddc#custom#patch_global('sources', ['nvim-lsp', 'around'])
call ddc#custom#patch_global('sourceOptions', {
      \ '_': {
      \   'matchers': ['matcher_head'],
      \   'sorters': ['sorter_rank']},
      \ 'nvim-lsp': {
      \   'mark': 'L',
      \   'forceCompletionPattern': '\.\w*|:\w*|->\w*' },
      \ })
call ddc#custom#patch_global('sourceOptions', {
      \ 'around': {'mark': 'A'},
      \ })
call ddc#custom#patch_global('sourceParams', {
      \ 'around': {'maxSize': 500},
      \ })

inoremap <silent><expr> <TAB>  pumvisible() ? '<Down>' : "\<TAB>"
inoremap <silent><expr> <S-TAB>  pumvisible() ? '<Up>' : "\<S-TAB>"
inoremap <silent><expr> <CR>  pumvisible() ? '<C-y>' : "\<CR>"
" set completeopt=menuone,preview,noinsert,noselect
set completeopt-=preview

call ddc#enable()
call popup_preview#enable()

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
  " vim-highlightedyank
  autocmd ColorScheme * highlight link HighlightedyankRegion Search
  " Coc completion color
  " autocmd ColorScheme * highlight link CocMenuSel PmenuSel
augroup END

" Color Scheme
let g:rehash256 = 1
colorscheme molokai2

" finally
syntax on
" }}}


" Environment {{{
" Load local settings
if filereadable(expand($HOME.'/.vimrc_local'))
  source $HOME/.vimrc_local
endif
" }}}
