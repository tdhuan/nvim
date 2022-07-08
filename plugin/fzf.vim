let $FZF_DEFAULT_COMMAND = 'rg --files  --hidden --follow --glob "!{.git, node_modules}"'
function! s:build_quickfix_list(lines)
  call setqflist(map(copy(a:lines), '{ "filename": v:val }'))
  copen
  cc
endfunction

let g:fzf_action = {
  \ 'ctrl-q': function('s:build_quickfix_list'),
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,70%' }
else
  let g:fzf_layout = { 'window': { 'width': 1, 'height': 0.9 } }
endif

let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
" let g:fzf_commands_expect = 'alt-enter,ctrl-x'

command! -bang ProjectFiles call fzf#vim#files('~/projects', <bang>0)

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': []}), <bang>0)

nnoremap <leader>; :Files<CR>
nnoremap <leader>. :Files <C-r>=expand("%:h")<CR>/<CR>
nnoremap <leader>gf :GFiles?<CR>

function! FzfAutoRefreshRipgrep(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --smart-case --hidden --color=always --glob "!{.git, node_modules}" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction
command! -nargs=* -bang RG call FzfAutoRefreshRipgrep(<q-args>, <bang>0)
nnoremap <silent> <leader>rg <ESC>:RG<CR>

nnoremap <slient> <leader>t <ESC>:BTags<CR>
nnoremap <c-]> <ESC>:call fzf#vim#tags('^' . expand('<cword>'), {'options': '--exact +i'})<CR>
nnoremap <silent> <leader>mm <ESC>:Commands<CR>
nnoremap <silent> <leader>? :History<CR>
nnoremap <silent> <leader>A :Windows<CR>
nnoremap <silent> <leader>B :Buffers<CR>

function! FzfVisualSearch(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --fixed-strings --smart-case --hidden --color=always --glob "!{.git, node_modules}" -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(), a:fullscreen)
endfunction

function! FzfVisualSearchRange() range
  let old_reg = getreg('"')
  let old_regtype = getregtype('"')
  let old_clipboard = &clipboard
  set clipboard&
  normal! ""gvy
  let selection = getreg('"')
  call setreg('"', old_reg, old_regtype)
  let &clipboard = old_clipboard
  call FzfVisualSearch(selection, 0)
endfunction
nnoremap <silent> E :call FzfVisualSearch(expand('<cword>'), 0)<CR>
vnoremap <silent> E :call FzfVisualSearchRange()<CR>
