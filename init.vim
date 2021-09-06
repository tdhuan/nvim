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
Plug 'dracula/vim', { 'as': 'dracula' }
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

"Rescript
Plug 'rescript-lang/vim-rescript'

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"Navigation
Plug 'tpope/vim-surround'
call plug#end()

filetype plugin indent on    " required

"----------------------------------------------------------
"General settings
"----------------------------------------------------------
set number
set termguicolors
set encoding=UTF-8

colorscheme gruvbox
set background=dark                      " Setting dark mode

"resize window
nnoremap + :vertical resize +5<CR>
nnoremap _ :vertical resize -5<CR>

set nowrap
set splitright 
set splitbelow

"search option
set hlsearch
set ignorecase
set smartcase

if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

let g:gruvbox_contrast_dark = 'hard'

syntax enable
scriptencoding utf-8
set mouse=a                              "highlight the current line for the cursor
set cursorline
set list                          " show trailing whitespace
set listchars=tab:\|\ ,trail:▫

set modifiable  "Allow hit "a" key to create a new file

"Indention
set tabstop=2     "tabs are at proper location
set shiftwidth=2  "indenting is 2 spaces
set softtabstop=2
set expandtab     "don't use actual tab character (ctrl-v)
set shiftround
set autoindent    "turns it on

set smartindent   "does the right thing (mostly) in programs
set smarttab

"turn off highlight search
nnoremap <Leader>nhl :nohls<CR>

noremap <Leader>s :.,$s/foo/bar/g
nnoremap <leader>sp :vsplit<cr>

"Map :bd (buffer delete)
nnoremap bd :bd<cr>

"Quick save / quit
noremap <leader>w :w<cr>
noremap <leader>q :q<cr>


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

"FZF
map ; :Files<CR>

"show files change with git
noremap gf :GFiles?<CR> 
noremap <leader>gb :Gblame<cr>

"The silver searcher (find all)
nnoremap <silent> <Leader>F :Ag<CR>
let g:ackprg = 'ag --vimgrep'

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

set completeopt+=noinsert
set completeopt+=preview
set completeopt+=menuone

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

" Run gofmt on save
autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()
" neosnippet

let g:neosnippet#enable_completed_snippet = 1
let g:neosnippet#enable_snipmate_compatibility = 1

let g:autocomplete_flow#insert_paren_after_function = 1

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
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-css', 'coc-tsserver', 'coc-snippets', 'coc-pairs']
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible()  

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')

  "autocmd FileType ruby, call CocActionAsync('formatOnSaveFiletypes')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)
" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

