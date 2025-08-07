" idea-ported plugins: https://github.com/JetBrains/ideavim/wiki/Emulated-plugins
" commands/actions: https://github.com/JetBrains/intellij-community/blob/master/platform/platform-resources-en/src/messages/ActionsBundle.properties
Plug 'machakann/vim-highlightedyank'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'vim-scripts/argtextobj.vim'
let g:highlightedyank_highlight_duration = "150"
let g:argtextobj_pairs="(:),{:},<:>,[:]"
" Source my .vimrc (no plugins)
source /home/lo/cloud/coding/configs/vim/vimscript/common.vim
source /home/lo/cloud/coding/configs/vim/vimscript/cyrillic.vim
" set trackactionids - set this to track actions and assign them to Vim keys

" Idea autocompletes random things so the behavior is different when do stuff like this:
nnoremap <space>{ $t {<Enter>
" also different behavior
inoremap <home> <esc>I
" strangely different bookmark behavior
noremap <space>z mx"9yy"9P`x
noremap <space>p o<c-r>*<esc>
noremap <space>> O<c-r>*<esc>

nnoremap <esc> zz
nnoremap <s-esc> :noh<cr>

" Consistent shortcuts: (Idea/Clion, web browsers, file browsers have these for tab switch)
noremap <c-PageDown> gt
noremap <c-PageUp> gT

" get rid of the pesky bell: http://jason-stillwell.com/blog/2013/04/11/ideavim/
set visualbell
set noerrorbells
" when renaming and stuff, don't enter the pesky select mode
set idearefactormode=keep

nmap <F2> <Action>(RenameFile)
nmap T <Action>(ExpandCollapseToggleAction)
vmap T <Action>(CollapseSelection)
nmap F <Action>(ReformatCode)
vmap F <Action>(ReformatCode)
"nmap ≈ <Action>(AutoIndentLines)
nmap <space>T <Action>(ExpandAllRegions)

" because in my .vimrc it's handled differently
nnoremap <c-w> :bd<Enter>

" IDEA actions
nmap k~ <Action>(CopyFileName)
nmap kf <Action>(CopyAbsolutePath)
nmap <c-c> <Action>(CopyFileContentAction)
" should've been just /path/to/directory but idea doesn't have this option
" nmap kd <Action>(CopyAbsolutePath)

" :w needed for WebStorm
nmap <space>h :w<cr><Action>(Build)
nmap <space>n <Action>(Run)
nmap <space>, <Action>(RunConfiguration)
nmap <space>c <Action>(CheckinProject)
nmap A <Action>(Annotate)
nmap <space>b <Action>(SelectInProjectView)
"nmap £ <Action>(GotoAction)
nmap R <Action>(Refactorings.QuickListPopupAction)
nmap <space>r <Action>(RenameElement)
nmap <space>g <Action>(CloseAllEditorsButActive)
nmap <space>w <Action>(ShowErrorDescription)

" navigation
nmap gs <Action>(Back)
nmap g, <Action>(Forward)
nmap gu <Action>(VcsShowPrevChangeMarker)
nmap gp <Action>(VcsShowNextChangeMarker)
nmap ! <Action>(CommentByLineComment)
vmap ! <Action>(CommentByBlockComment)
noremap E o//<space>
noremap O O//<space>
noremap \ A // 
nmap + <Action>(NewScratchBuffer)
nmap <space>+ <Action>(NewScratchFile)
" Setting Tab to GotoNextError in IDE settings because then we can set it to 'NextDifference' in git view. (doesn't work...)
nmap <Tab> <Action>(GotoNextError)
nmap <S-Tab> <Action>(GotoPreviousError)
"nmap gh <Action>(GotoRelated)
nmap gh <Action>(CIDR.Lang.SwitchHeaderSource)
nmap gt <Action>(GotoDeclaration)
nmap <space>q <Action>(QuickImplementations)
"nmap <space>_ <Action>(ExpressionTypeInfo)
" freaking gM doesn't work there
" noremap \| 60\|

nmap <space>t <Action>(GotoFile)
nmap <space>. <Action>(RecentFiles)
nmap <space>s <Action>(FindInPath)
nmap <space>S <Action>(ReplaceInPath)
nmap <c-d> <Action>($LRU)
"nmap <space>O <Action>(OpenFile)
nmap <space>l <Action>(ShowIntentionActions)

" helper funcs for preserving cursor in recursive mappings
noremap ¨ mx
noremap § `x

" arg-text-object: mapped through plugin sources
" d behavior: delete argument (with comma), but only keep Inner in register
onoremap , <Plug>InnerArgument
onoremap ° <Plug>OuterArgument
vnoremap , <Plug>InnerArgument
vnoremap ° <Plug>OuterArgument
nmap d, k<Plug>InnerArgumentD<Plug>OuterArgument
nmap D, D<Plug>OuterArgument
nmap k, ¨k<Plug>InnerArgument§
nmap s, s<Plug>InnerArgument
nmap n, n<Plug>InnerArgument

" emulate yank-assassin (yanking without moving cursor) for text-objects
nnoremap kw mxyb`x
nnoremap k& mxyB`x
nnoremap kr mxye`x
nnoremap k# mxyE`x
nnoremap kb mxyiw`x
nnoremap kl mxyiW`x
nnoremap k( mxyi(`x
nnoremap k) mxya)`x
nnoremap k[ mxyi[`x
nnoremap k] mxya[`x
nnoremap k< mxyi<`x
nnoremap k> mxya<`x
nnoremap k{ mxyi{`x
nnoremap k} mxya{`x
nnoremap kt mxyy`x
nnoremap k" mxyi"`x
nnoremap k' mxyi'`x
nnoremap k` mxyi``x
nnoremap kh mx^yg_`x
nnoremap ko mxyk`x
nnoremap ke mxyj`x
nnoremap kp mxyip`x
nnoremap k<space>a mxy^`x
nnoremap k<space>i mxy$`x

" argtextobj - these unmappings don't work: https://youtrack.jetbrains.com/issue/VIM-2797?replyTo=27-6652577
unmap aa
unmap ia
