" common .vimrc to be included in all .vimrcs (Terminal Vim, Qt Fakevim, IdeaVIM).
" Red/blue rog halmak keyboard layout: https://github.com/Roman-/redblue
filetype plugin indent on
syntax on
" line numbers on the left
set nomodeline
set number
set relativenumber
set nocompatible
set ignorecase
set incsearch
set hlsearch
set shiftwidth=4 tabstop=4 softtabstop=4 smarttab expandtab
" insert from system clipboard
set clipboard^=unnamed,unnamedplus
set viewoptions-=options
set cpoptions+=n
" cursor line and column -> sniper scope
set cursorline
set cursorcolumn
set copyindent
" never enable foldings
set nofoldenable

" ==================================================== layer 0 =================================================
 " row#1
 noremap w b
 noremap W <nop>
 noremap l r
 noremap L R
 noremap r e
 noremap R <nop>
 noremap b w
 noremap B <nop>
 noremap z O
 noremap Z <nop>
 noremap ☺ <nop>
 noremap ☻ <nop>
 noremap q t
 noremap Q <nop>
"noremap u u
 noremap U <C-r>
"noremap d d
 noremap D "_d
 noremap j f
 noremap J F
 noremap ' `a
 noremap ¤ `b
 "noremap \ A //
 noremap ¥ <nop>

 " row#2
nnoremap <esc> zz:noh<cr>
 noremap s c
 noremap S <nop>
 noremap h i
 noremap H <nop>
     map n gr
 noremap N <nop>
 noremap T <nop>
 noremap t a
 noremap , V
 noremap ° F
 noremap . n
 noremap … N
 noremap a h
 noremap A <nop>
 noremap e j
 " noremap E o//
 noremap o k
 " noremap O O//
 noremap I <nop>
 noremap i l
 noremap - ;
 noremap – ,

 " row#3
 noremap f .
 noremap F <nop>
 noremap m ma
 noremap M mb
 noremap v <c-6>
 noremap V viw
 noremap c v
xnoremap c <c-v>
 noremap C <nop>
"noremap / /
 noremap ÷ <nop>
"noremap g g
 noremap G <nop>
"noremap p p
"noremap P P
"noremap x x
 noremap X "_x
 noremap k y
 noremap K <nop>
 noremap y o
 noremap Y <nop>

" ==================================================== disable default double-taps =================================================
nnoremap ss <nop>
" nnoremap kk <nop>
nnoremap dd <nop>
nnoremap nn <nop>
" ==================================================== leader + layer 0 =================================================
 noremap <space><space> <nop>
 noremap <space><esc> <nop>

 " leader + row#1
 noremap <space><Tab> :qa!<cr>
 "noremap <space>w ZQ
 noremap <space>r :wa<cr>:qa!<cr>
 noremap <space>z mx"9yy"9P`xk
 noremap <space>u :e
 noremap <space>j J

 " leader + row#2
 noremap <space>h :w<cr>
 noremap <space>H :wa<cr>
 noremap <space>, V
 noremap <space>. n
 noremap <space>a ^
 noremap <space><left> 0
 noremap <space>e ztkj
 noremap <space>o zbjk
 noremap <space>i $
xnoremap <space>i g_
 noremap <space><right> $
 noremap <space>- zz

 " leader + row#3
 noremap <space>m q
 nmap    <space>/ <space>yo!
 nmap    <space>÷ <space>y!oo
 noremap <space>p o<c-r><c-o>+<esc>
 noremap <space>> O<c-r><c-o>+<esc>
 noremap <space>y mx"9yy"9p`xj

" ==================================================== go-layer0 =================================================
 "noremap gw ge
 noremap gj :%!jq .<enter>
 noremap gs <c-o>
 noremap gn ^W
 noremap g- ^W
 noremap gt <c-]>
 noremap g, <c-i>
 noremap ge G
 noremap go gg
 noremap ga gg0
 noremap gi G$
 noremap gc ga
 noremap g/ 0/\/\/<cr>:noh<cr>W

" ==================================================== RED =================================================
 " RED row#1
 noremap & B
 noremap @ @m
 noremap # E
 noremap [ W
nnoremap ^ mxO<esc>`x
 noremap ] T
"noremap ? ?
"noremap * *
 noremap 0 F

 " RED row#2
 "noremap ! mxI// <esc>`x
 noremap + :e /tmp/scratch.txt<cr>ggVG"_s
nnoremap = V=
nnoremap ≈ mxggVG=`xzz
 noremap ( {
 noremap { [{
 noremap } ]}
 noremap ) }
 noremap _ #
"noremap : :
 noremap ; mxA;<esc>`x
 noremap — ,

 " RED row#3
 noremap ` o```<cr>```<up>
nnoremap < <<
nnoremap > P
nnoremap № >>
vnoremap № >
 noremap \| gM
nnoremap $ mxo<esc>`x

" ==================================================== BLUE layer =================================================
 noremap <c-PageDown> :bn<cr>
    imap <c-PageDown> <esc><c-PageDown>
 "noremap <c-w> :q<cr>
"nnoremap <c-s-t> <c-o>
 noremap <c-PageUp> :bp<cr>
    imap <c-PageUp> <esc><c-PageUp>
    " these don't work but could be remapped in IdeaVimrc
 noremap <c-1> :bfirst<cr>
    imap <c-1> <esc><c-1>
 noremap <c-9> :blast<cr>
    imap <c-9> <esc><c-9>
 noremap <Home> I
 noremap <PageUp> 25k
 noremap <End> A
nnoremap <del> "_dd
xnoremap <del> "_d
 noremap <bs> gE
    "#nmap <cr> l<cr>=
nnoremap <cr> a<backspace><cr><esc>
xnoremap <cr> "_c<cr>
     map <Left> 15a
 noremap <Down> 5j
 noremap <Up> 5k
     map <Right> 15i
   "nmap <c-a> gacgi " I use it for "increment number" more often than "select all"
    imap <c-a> <Esc>gacgi
    "nmap <c-x> d
    "imap <c-x> d
inoremap <c-v> <c-r>*
cnoremap <c-v> <c-r>*
inoremap <c-c> <c-v>
 noremap <PageDown> 25j

" ==================================================== Text objects =================================================
onoremap I i
xnoremap I i
onoremap A a
onoremap & B
onoremap l iW
nnoremap dl daW
nnoremap Dl "_daW
onoremap # E
onoremap b iw
nnoremap db daw
nnoremap Db "_daw
onoremap [ i[
onoremap ] a[
onoremap ( i(
onoremap ) a(
onoremap < i<
onoremap > a<
onoremap { i{
onoremap } a{
onoremap ' i'
onoremap " i"
onoremap ¤ a'
"onoremap g i" - doesn't work as `g` expects motion
onoremap 😱 a"
onoremap . as
onoremap a ^
onoremap i $
onoremap p ip
nnoremap dp dap
nnoremap Dp "_dap
onoremap c l
onoremap y it
onoremap <PageUp> {
onoremap <PageDown> }
onoremap v i`

" ==================================================== Text objects - simulated (s, n, k, d, D) =================================================
" helper funcs for preserving cursor in recursive mappings
noremap ¨ mx
noremap § `x

" this one's a bit tricky because `nr` maps to `grr` which is replace-line-with-register, but we need it to behave like replace-till-word-end
nmap nr crn

" habit breakers
nnoremap k` "echom "use kv instead, this saves a keypress"
nnoremap d` "echom "use dv instead, this saves a keypress"
nnoremap D` "echom "use Dv instead, this saves a keypress"
nnoremap n` "echom "use nv instead, this saves a keypress"
nnoremap s` "echom "use sv instead, this saves a keypress"

" prev word
nnoremap s<Home> geciw
nnoremap d<Home> mxgedaw`x
nnoremap D<Home> mxge"_daw`x
nnoremap k<Home> mxgeyiw`x
    nmap n<Home> ¨gwgrIw§

" prev WORD
nnoremap s<S-Home> gEciW
nnoremap d<S-Home> mxgEdaW`x
nnoremap D<S-Home> mxgE"_daW`x
nnoremap k<S-Home> mxgEyiW`x
    nmap n<S-Home> ¨g<Tab>grIW§

" next word
nnoremap s<End> wciw
nnoremap d<End> mxwdaw`x
nnoremap D<End> mxw"_daw`x
nnoremap k<End> mxwyiw`x
    nmap n<End> ¨bgrIw§

" next WORD
nnoremap s<S-End> WciW
nnoremap d<S-End> mxWdaW`x
nnoremap D<S-End> mxW"_daW`x
nnoremap k<S-End> mxWyiW`x
    nmap n<S-End> ¨bgrIw§

" this and prev word
nnoremap sz viwobc
nnoremap dz ge2daw
nnoremap Dz ge2"_daw
nnoremap kz mxviwoby`x
    nmap nz ¨cIwywgr§

" this and prev WORD
nnoremap s^ viWoBc
nnoremap d^ gE2daW
nnoremap D^ gE2"_daW
nnoremap k^ mxviWoBy`x
    nmap n^ ¨cIWy&gr§

" this and next word
nnoremap s☺ viwec
nnoremap d☺ 2daw
nnoremap D☺ 2"_daw
nnoremap k☺ mxviwey`x
    nmap n☺ ¨cIwrgr§

" this and next WORD
nnoremap s1 viWEc
nnoremap d1 2daW
nnoremap D1 2"_daW
nnoremap k1 mxviWEy`x
    nmap n1 ¨cIwrg#§

" simulating 'entire' text object, but without hardcoded 'ie' and 'ae'
nnoremap su ggVGc
nnoremap du ggdG
nnoremap Du gg"_dG
nnoremap ku mxggVGy`x
    nmap nu go,gegr

" two lines at a time, because neovim handles it differently for some reason
nnoremap do Vkd
nnoremap de Vjd
nnoremap Do Vk"_d
nnoremap De Vj"_d
    nmap no ,on
    nmap ne ,en

" soft line (h). Delete soft line = delete entire line, but only keep 'soft line' in register
nnoremap sh S
nnoremap dh ^vg_y"_dd
nnoremap kh mx^vg_y`x
    nmap nh ¨<space>agr<space>i§

" hard line (h)
nnoremap st S
nnoremap dt dd
nnoremap Dt "_dd
nnoremap kt mxyy`x
    nmap nt grr<space>i
nnoremap ko mxyk`x
nnoremap ke mxyj`x

" after = sign
nnoremap s= ^f=wC
nnoremap d= mx^f=wD`x
nnoremap D= mx^f=w"_D`x
nnoremap k= mx^f=wy$`x
    nmap n= ¨<space>aj=bgr<space>i§

" after first word
nnoremap s- ^WC
nnoremap d- mx^WD"_x`x
nnoremap D- mx^W"_D"_x`x
nnoremap k- mx^Wyg_`x
    nmap n- ¨<space>a[gr<space>i§

" one symbol right
nnoremap s<right> vlc
nnoremap d<right> vld
nnoremap D<right> vl"_d
nnoremap k<right> mxvly`x
    nmap n<right> ¨cigr§

" one symbol left
nnoremap s<left> vhc
nnoremap d<left> vhd
nnoremap D<left> vh"_d
nnoremap k<left> mxvhy`x
    nmap n<left> ¨cagr§

" comment. When deleting, only delete the comment content (without the slashes)
nnoremap D/ mx$2F/gel"_D`x
nnoremap k/ mx$2F/wyg_`x
nnoremap s/ $2F/wcg_
    nmap d/ k/D/
    nmap n/ ¨<space>i2J/bgr<space>i§

" `ClassName::`
nnoremap s: viwo<esc>c2f:
nnoremap d: mxviwo<esc>d2f:`x
nnoremap D: mxviwo<esc>"_d2f:`x
nnoremap k: mxviwo<esc>y2f:`x
    nmap n: ¨cIwiin§

" ==================================================== search-and-replace =================================================
vnoremap S y:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap Sb viwy:%s/\<<c-R>*\>/<c-R>*/g<left><left>
nnoremap Sl viWy:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap S( vi(y:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap S< vi<y:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap S[ vi[y:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap S{ vi{y:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap S" vi"y:%s/<c-R>*/<c-R>*/g<left><left>
nnoremap S' vi'y:%s/<c-R>*/<c-R>*/g<left><left>

" ==================================================== Surround =================================================
vnoremap ☺<space> mx"xs <c-R>x <esc>`xl
nmap ☺<space> c☺<space>
vnoremap ☺" mx"xs"<c-R>x"<esc>`xl
nmap ☺" c☺"
vnoremap ☺/ mx"xs/<c-R>x/<esc>`xl
nmap ☺/ c☺/
vnoremap ☺' mx"xs'<c-R>x'<esc>`xl
nmap ☺' c☺'
vnoremap ☺` mx"xs`<c-R>x`<esc>`xl
nmap ☺` c☺`
" TODO move cursor before the opening bracket as that is why you want to surround it: data -> int(data)
vnoremap ☺( mx"xs(<c-R>x)<esc>`xl
nmap ☺( c☺(
vnoremap ☺) mx"xs( <c-R>x )<esc>`xl
nmap ☺) c☺)
vnoremap ☺{ mx"xs{<c-R>x}<esc>`xl
nmap ☺{ c☺{
vnoremap ☺} mx"xs{{<c-R>x}}<esc>`xll
nmap ☺} c☺}
vnoremap ☺[ mx"xs[<c-R>x]<esc>`xl
nmap ☺[ c☺[
vnoremap ☺] mx"xs[ <c-R>x ]<esc>`xl
nmap ☺] c☺]
vnoremap ☺< mx"xs<<c-R>x><esc>`xl
nmap ☺< c☺<
vnoremap ☺> mx"xs< <c-R>x ><esc>`xl
nmap ☺> c☺>
nnoremap ☺f "xca"fmt::format(<c-R>x, )<left>
