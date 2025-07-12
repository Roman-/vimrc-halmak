" .vimrc for terminal vim. Includes common.vim - most mappings/options are described there.

" plugins
filetype off                  " required (vundle)
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'machakann/vim-highlightedyank'
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plugin 'junegunn/fzf.vim' " search though: files, history (recently opened files), content (ag)
Plugin 'vimwiki/vimwiki'
Plugin 'sainnhe/sonokai'
Plugin 'svban/YankAssassin.vim'
Plugin 'kana/vim-textobj-user'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'AndrewRadev/sideways.vim'
Plugin 'preservim/nerdcommenter'
Plugin 'supermaven-inc/supermaven-nvim'

 "All of your Plugins must be added before the following line
call vundle#end()            " required (vundle)
filetype plugin indent on    " required (vundle)

let g:sonokai_style = 'maia'
let g:sonokai_better_performance = 1
let g:airline_theme = 'sonokai'

" allows to close netrw TODO google for it
let g:netrw_fastbrowse = 0

if has('termguicolors')
    set termguicolors
endif

source /home/lo/cloud/coding/configs/vim/rog_halmak/common.vim
source /home/lo/cloud/coding/configs/vim/rog_halmak/cyrillic.vim

" snipmate
let g:snipMate = { 'snippet_version' : 1 }
let g:snips_author = 'Roman Strakhov'
inoremap <S-Tab> <Plug>snipMateTrigger

set path=.,,
autocmd BufWinLeave,BufWrite ?* silent! mkview
autocmd BufWinEnter ?* silent! loadview
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set viewoptions-=options
" no tilda on the left of buffer end
set fillchars=eob:\ 

filetype plugin on " required for vimwiki

autocmd BufNewFile,BufRead * if expand('%:t') !~ '\.' | endif
" remove line number margin for wide lines
set cpoptions+=n
" ...and to avoid delays, unmap brackets when entering buffers
augroup unmap_brackets
autocmd!
    autocmd BufWinEnter,BufNewFile * call UnmapBrackets()
augroup END

"save all and exit gracefully when receive SIGUSR1
autocmd Signal SIGUSR1 :wq!

" these aren't needed as I don't use brackets anymore
function! UnmapBrackets()
    silent! unmap <buffer> [[
    silent! nunmap <buffer> [%
    silent! nunmap <buffer> ]%
    silent! unmap <buffer> ["
    silent! unmap <buffer> []
    silent! unmap <buffer> ][
    silent! unmap <buffer> ]"
    silent! unmap <buffer> ]]
endfun

set tags=./tags,tags;$HOME
set wildignore+=**/_deps/**

nnoremap <c-g> :echom expand('%:p')<Enter>
" execute current bash script
nnoremap <F9> :w<Enter>:!%:p<Enter>

set shada=!,'2000,<150,s10,h

" add braces
set hidden " allow to switch tabs when buffer is modified
function! CloseBuffer()
    if (&mod == 1)
        if (&ft=='vimwiki')
            w
        else
            echom 'file has unsaved changes'
            return -1
        endif
    endif
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        if expand("%:p:h") == "/home/lo/cloud/notes"
            edit /home/lo/cloud/notes/index.md
            " delete all buffers, edit last buffer, delete [no name] buffer
            %bd|e#|bd#
        else
            bd
            quit
        endif
    else
        bd
    endif
endfunction

function! SaveAndCloseBuffer()
    if (&mod == 1)
        write
    endif
    :call CloseBuffer()
endfunction

function! DiscardAndQuit()
    if len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
        bd!
        quit
    else
        bd!
    endif
endfunction

" Delete current file to trash
function MoveToTrash()
  w
  let val = input('Move "'.expand('%').' to trash? " [y]es/[N]o? ')
  if val !~? '^y'
    return
  endif
  let fname = expand('%:p')

  sav! /tmp/deleted_buffer.txt
  "!rm #
  call delete(fname)
  "silent execute '!rm #'
  silent execute 'bwipeout' fname
  silent execute 'bd'

  " silent execute 'bwipeout'
  echomsg 'file moved to /tmp/deleted_buffer.txt'
endfunction

" dealing with hard line breaks
nnoremap <expr> e v:count ? 'j' : 'g<down>'
nnoremap <expr> o v:count ? 'k' : 'g<up>'
map <down> 5e
map <up> 5o

nnoremap <c-w> :call SaveAndCloseBuffer()<cr>
inoremap <c-w> <esc>:call SaveAndCloseBuffer()<cr>
"nnoremap <space>w :call DiscardAndQuit()<cr>
nnoremap <space>w echomsg 'use space-w instead'<CR>
nnoremap <space>r :silent! wa<cr>:qa!<cr>
"nnoremap <space><Tab> :qa!<cr>
nnoremap <space>w :qa!<cr>
nnoremap <space>d :w<cr>:call MoveToTrash()<cr>

" comment maps
let g:NERDCreateDefaultMappings = 0
noremap <silent> ! mxV:call nerdcommenter#Comment('x', 'toggle')<CR>`xj
nmap <silent> <space>/ <space>yo!
nmap <silent> <space>÷ <space>y!oo

" yank path (copy current filename to clipboard)
nnoremap k~ :let @+=expand("%:t:r")<CR>:echom expand("%:t:r")<CR>
" yank dir (copy current file directory to clipboard)
"nnoremap kd :let @+=expand("%:p:h")<CR>:echom expand("%:p:h")<CR>
" yank filename without extension
nnoremap kf :let @+=expand("%:p")<CR>:echom expand("%:p")<CR>

if has('persistent_undo')
    set undofile
    set undolevels=100          " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
    set undodir=$HOME/.vim/undo
endif

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#buffer_min_count = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_skip_empty_sections = 1
"let g:airline_section_y = '{…}%3{codeium#GetStatusString()}'
let g:airline_section_y = ''
let g:airline#extensions#default#layout = [ [ 'a', 'b', 'c' ], [ 'x', 'y', 'z', 'error' ] ]
let g:airline_experimental=1

let g:vimwiki_list = [{'path': '/home/lo/cloud/notes',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0

" machakann/vim-highlightedyank
let g:highlightedyank_highlight_duration = 150
set conceallevel=0

augroup bufclosetrack
  au!
  autocmd BufWinLeave * let g:lastWinName = @%
augroup END
function! LastWindow()
  exe "find " . g:lastWinName
endfunction
" command -nargs=0 LastWindow call LastWindow()
" C-S-t opens recently closed tab in browser; keeping consistent behavior. Unfortunately, vim only processes it as c-t
nnoremap <c-s-t> :call LastWindow()<cr>
nnoremap <c-t> :call LastWindow()<cr>

" Consistent shortcuts: (Idea/Clion, web browsers, file browsers have these for tab switch)
" Those are remapped on BLUE+z/c on my keyboard
noremap <c-PageDown> :bn<CR>
noremap <c-PageUp> :bp<CR>
vnoremap <c-PageDown> <esc>:bn<CR>
vnoremap <c-PageUp> <esc>:bp<CR>

" Consistently "delete prev word": mapping Ctrl-Backspace does not work in terminal Vim. Following is a workaround.
noremap! <C-BS> <C-w>
noremap! <C-h> <C-w>
imap <C-w> <esc><c-w>

" arg-text-object
nnoremap d, d<Plug>SidewaysArgumentTextobjA
nnoremap k, y<Plug>SidewaysArgumentTextobjI
nnoremap s, c<Plug>SidewaysArgumentTextobjI

set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:. " Highlight problematic whitespace
set nojoinspaces
:au InsertEnter * set nolist
:au InsertLeave * set list

" web: launch chrome
command! I !google-chrome --allow-file-access-from-files --allow-file-access index.html
" H for help, launch in fullscreen
command! -nargs=1 -complete=help H help <args> | silent only

" fzf shortcuts
nnoremap <Space>s :Ag<cr>
nnoremap <Space>S :Ag <c-r><c-w><cr>
nmap <Space>t :Files %:p:h<cr>
nmap <space>. :History<cr>
noremap <c-r> :History:<cr>
noremap <space>: :History:<cr>
"noremap £ :Lines<cr>

"nmap <Space>c :cclose<CR>:tabc<CR>

" misc
hi link markdownError Normal

" scratch file: in vimnotes, it's a different function
nnoremap + :e /tmp/scratch.txt<cr>ggVGc

" Idea's 'focus editor', where editor is IDE on workspace 2
nnoremap <silent> <c-r> :!i3-msg "workspace number 2"<cr><cr>

" vimwiki-specific config overrides common
if expand("%:p") == "/home/lo/cloud/notes/index.md"
    source /home/lo/cloud/coding/configs/vim/vimscript/vimwiki.vim
endif
colorscheme sonokai

 "transparent bg
highlight Normal guibg=none
highlight NonText guibg=none
highlight EndOfBuffer guibg=none
