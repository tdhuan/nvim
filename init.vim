set number

call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-haml'
" Fancy UI
Plug 'vim-airline/vim-airline'
Plug 'morhetz/gruvbox'
Plug 'ryanoasis/vim-devicons'
"-----------------------------------
"Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

"-----------------------------------
Plug 'tpope/vim-endwise'

" Autocomplete
Plug 'reasonml-editor/vim-reason-plus'
Plug 'wokalski/autocomplete-flow'
Plug 'terryma/vim-multiple-cursors'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"LanguageServer
Plug 'elixir-lsp/coc-elixir', {'do': 'yarn install && yarn prepack'}

"Snippet
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'
Plug 'jiangmiao/auto-pairs'

" JavaScript {{{4
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'

" Ruby {{{4
Plug 'vim-ruby/vim-ruby',                 { 'for': 'ruby' }
Plug 'tpope/vim-rails'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Navigation
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin indent on    " required

"----------------------------------------------------------
"General settings
"----------------------------------------------------------
set termguicolors
set encoding=UTF-8
colorscheme gruvbox
set background=dark                      " Setting dark mode

set nowrap

"search option
set hlsearch
set ignorecase
set smartcase

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif
let g:gruvbox_contrast_dark = 'hard'
let g:gruvbox_hls_cursor = 'yellow'

syntax enable
scriptencoding utf-8
set mouse=a                              "highlight the current line for the cursor
set cursorline
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫

"Indention
set tabstop=2     "tabs are at proper location
set shiftwidth=2  "indenting is 2 spaces
set softtabstop=2
set expandtab     "don't use actual tab character (ctrl-v)
set shiftround
set autoindent    "turns it on

set smartindent   "does the right thing (mostly) in programs
set smarttab

"Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'
"configure whether close button should be shown: >
let g:airline#extensions#tabline#show_close_button = 1

"configure symbol used to represent close button >
let g:airline#extensions#tabline#close_symbol = 'X'
let g:airline#extensions#ale#enabled = 1


 if !exists('g:airline_symbols')
   let g:airline_symbols = {}
 endif
"powerline symbols
 let g:airline_left_sep = ''
 let g:airline_left_alt_sep = ''
 let g:airline_right_sep = ''
 let g:airline_right_alt_sep = ''
 let g:airline_symbols.branch = ''
 let g:airline_symbols.readonly = ''
 let g:airline_symbols.linenr = '☰'
 let g:airline_symbols.maxlinenr = ''
 let g:airline_symbols.dirty='⚡'
if has('unnamedplus')
   set clipboard=unnamed,unnamedplus
endif

map <Leader>nt :NERDTreeToggle<CR>
map <Leader>nr :NERDTreeFind<CR>

map ; :Files<CR>

"===============================

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"================================

"Switch tabs
nnoremap H gT
nnoremap L gt
nnoremap tn :tabnew<CR>

"ale
"let g:ale_linters = {
"\   'javascript': ['eslint'],
"\   'ruby': ['rubocop'],
"\   'go': ['gopls'],
"\}
set completeopt+=noinsert
set completeopt+=preview
set completeopt+=menuone

"let g:ale_completion_enabled = 1
"let g:ale_completion_maix_suggestions = 50
"let g:ale_fixers = {}
"let g:ale_fixers['javascript'] = ['eslint']
"let g:ale_fixers['re'] = ['prettier']
"let g:ale_ruby_rubocop_options = ' --only Style/StringLiterals'
"let g:ale_sign_error = '●' " Less aggressive than the default '>>'
"let g:ale_sign_warning = '⚠'
"let g:ale_lint_on_enter = 0 " Less distracting when opening a new file
"let g:ale_lint_on_text_changed = 1
"nmap <leader>d <Plug>(ale_fix)


"deoplete
" Disable deoplete when in multi cursor mode
function! Multiple_cursors_before()
 'go': ['gopls']
endfunction
set completeopt+=noinsert
set completeopt+=preview
set completeopt+=menuone

"let g:ale_completion_enabled = 1
"let g:ale_completion_maix_suggestions = 100
"let g:ale_fixers = {}

"Switch tabs
nnoremap H gT
nnoremap L gt
nnoremap tn :tabnew<CR>

"ale

"===============================

"Split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"================================

"Switch tabs
nnoremap H gT
nnoremap L gt
nnoremap tn :tabnew<CR>


"let g:deoplete#enable_smart_case = 1
"let g:deoplete#enable_camel_case = 1
"let g:deoplete#enable_ignore_case = 1
"let g:deoplete#enable_refresh_always = 1

"let g:LanguageClient_autoStart = 1
"call deoplete#custom#source('LanguageClient',
"           \ 'min_pattern_length',
"           \ 2)

""autocmd BufEnter  *  call ncm2#enable_for_buffer()
"autocmd FileType javascript setlocal omnifunc=LanguageClient#complete
" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
" neosnippet

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1

let g:autocomplete_flow#insert_paren_after_function = 1

---------------------------------------------------

"go
let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
nmap gr :GoRun<CR>

"auto import
let g:go_fmt_command = "goimports"

"highlight
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1

"higlight the same variables
let g:go_auto_sameids = 1

"Show type information in status line
let g:go_auto_type_info = 1

"Go to definition
au FileType go nmap <F12> <Plug>(go-def)
"(When I need to get back I press C-t)

"Go Add Tags
let g:go_addtags_transform = "snakecase"
nmap gat :GoAddTags <CR>

"Go Remove Tags
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>
nmap <Leader>grm :GoRemoveTag <CR>

"Enable neosnippet in Go
let g:go_snippet_engine = "neosnippet"

"----------------------------------------------
" Language: Golang
"----------------------------------------------
au FileType go set noexpandtab
au FileType go set shiftwidth=4
au FileType go set softtabstop=4
au FileType go set tabstop=4
"----------------------------------------------

"----------------------------------------------
" Language: CSS
"----------------------------------------------
au FileType css set expandtab
au FileType css set shiftwidth=2
au FileType css set softtabstop=2
au FileType css set tabstop=2


"----------------------------------------------
" Language: HTML
"----------------------------------------------
au FileType html set expandtab
au FileType html set shiftwidth=2
au FileType html set softtabstop=2
au FileType html set tabstop=2

"----------------------------------------------
" Language: JavaScript
"----------------------------------------------
au filetype javascript set expandtab
au filetype javascript set shiftwidth=2
au filetype javascript set softtabstop=2
au filetype javascript set tabstop=2

"----------------------------------------------
" Language: JSON
"----------------------------------------------
au FileType json set expandtab
au FileType json set shiftwidth=2
au FileType json set softtabstop=2
au FileType json set tabstop=2


" Language: JavaScriptReact
"----------------------------------------------
autocmd FileType javascriptreact set expandtab
autocmd FileType javascriptreact set shiftwidth=2
autocmd FileType javascriptreact set softtabstop=2
autocmd FileType javascriptreact set tabstop=2

"----------------------------------------------
" Plugin: 'terryma/vim-multiple-cursors'
"----------------------------------------------
let g:multi_cursor_next_key='<C-n>'

" Plugin devicons
let g:webdevicons_enable = 1
let g:webdevicons_enable_airline_tabline = 1

"coc-prettier
command! -nargs=0 Prettier :CocCommand prettier.formatFile
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"coc.nvim
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-tsserver']


