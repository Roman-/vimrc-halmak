let g:sonokai_style = 'espresso'
let g:nv_search_paths = ['/home/lo/cloud/notes']

set shiftwidth=4 tabstop=4 smarttab expandtab
let g:vimwiki_conceallevel=0
let g:vimwiki_autowriteall=1
set concealcursor=n
set nocursorcolumn

let g:vimwiki_key_mappings = { 'all_maps': 0, }
nnoremap y <Plug>VimwikiListo
nnoremap z <Plug>VimwikiListO
nnoremap ± :execute 'edit ' . system('ls *.md \| shuf -n 1')<cr>

augroup unmap_gl
autocmd!
    autocmd BufWinEnter,BufNewFile * call UnmapGl()
augroup END

" These mappings are set within `vimwiki_key_mappings`; but if I unset 'lists', lists will stop working altogether
function! UnmapGl()
    silent! nunmap <buffer> gl
    silent! nunmap <buffer> gll
    silent! unmap <buffer> gl1
    silent! unmap <buffer> gl-
    silent! unmap <buffer> gl1
    silent! unmap <buffer> gl+
    silent! unmap <buffer> gl*
    silent! nunmap <buffer> glr
    silent! nunmap <buffer> glh
    silent! nunmap <buffer> glp
    silent! vunmap <buffer> glp
    silent! nunmap <buffer> gln
    silent! vunmap <buffer> gln
    silent! nunmap <buffer> glx
    silent! vunmap <buffer> glx
    silent! nunmap <buffer> <bs>
    silent! iunmap <buffer> <C-R><Tab>
endfun

" omnicompletion chooses c-o
inoremap <c-o> <c-x><c-o>

nnoremap <silent> <S-Tab> :VimwikiPrevLink<cr>
nnoremap <silent> <Tab> :VimwikiNextLink<cr>

nnoremap <f2> :w<cr>:VimwikiRenameFile<cr>y<cr>
nnoremap + :VimwikiGoto scratch<cr>ggVG"_s
nnoremap <space>u :VimwikiGoto 
autocmd FileType vimwiki nnoremap <silent><script><buffer> gt :VimwikiFollowLink<cr>
" resize window after start
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"
" save buffers when switching between them
autocmd BufWinLeave * silent! w
" <c-l> = BLUE+n = surround with [[]]
nnoremap <c-l> "xciw[[<c-r>x]]<esc>f]l
inoremap <c-l> [[]]<left><left>
vnoremap <c-l> "xc[[<c-r>x]]<esc>f]l
nnoremap <space>x :call CloseAllButIndex()<cr>

nmap <space>b :DisplayBacklinks<cr>
nnoremap ` o```<cr>```<up>

" use ripgrep to find backlinks for current note
function! GrepBacklinks(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --fixed-strings -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang DisplayBacklinks call GrepBacklinks("[[" . expand("%:t:r") . "]]", <bang>0)

function! CloseAllButIndex()
    wa
    edit /home/lo/cloud/notes/index.md
    call DeleteHiddenBuffers()
endfunction

" Delete Hidden buffer, usefull to clean. Stolen from https://stackoverflow.com/a/8459043/2544873
function DeleteHiddenBuffers()
    let tpbl=[]
    call map(range(1, tabpagenr('$')), 'extend(tpbl, tabpagebuflist(v:val))')
    for buf in filter(range(1, bufnr('$')), 'bufexists(v:val) && index(tpbl, v:val)==-1')
        silent execute 'bwipeout' buf
    endfor
endfunction

