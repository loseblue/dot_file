"=============================================================================
"     FileName: _vimrc
"         Desc: 
"       Author: loseblue
"        Email: loseblue[a]163.com
"      Version: 2.0.0
"   LastChange: 2018-05-16 18:18:37
"      History:
"=============================================================================
" Platform
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
    let g:isMac = 0
    let g:isLinux = 0
elseif has("mac") || has("macunix")
    let g:iswindows = 0
    let g:isMac = 1
    let g:isLinux = 0
else
    let g:iswindows = 0
    let g:isMac = 0
    let g:isLinux = 1
endif

if has("gui") || has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif
"}}}

"=========================== Vundle start ================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.vim/plugged')

" Enhanced
Plug 'haya14busa/incsearch.vim'
Plug 'MattesGroeger/vim-bookmarks'
Plug 'ihacklog/Mark'
Plug 'loseblue/AuthorInfo', {'on': 'AuthorInfoDetect'}
Plug 'yonchu/accelerated-smooth-scroll'
Plug 'Lokaltog/vim-easymotion'
Plug 'terryma/vim-multiple-cursors'
Plug 'vim-scripts/matchit.zip'

" file
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'hjwp/vim-asciidoc', { 'for': 'asciidoc' }
Plug 'vim-scripts/autohotkey-ahk', { 'for': 'ahk' }
Plug 'aklt/plantuml-syntax', { 'for': 'plantuml' }

" c
Plug 'tpope/vim-projectionist', {'for': ['c', 'cpp']}
Plug 'Yggdroot/indentLine' , {'for': ['c', 'cpp']}
Plug 'jsfaint/gen_tags.vim' , {'for': ['c', 'cpp']}
Plug 'majutsushi/tagbar', {'for': ['c', 'cpp']}
Plug 'NLKNguyen/c-syntax.vim', {'for': ['c', 'cpp']}

Plug 'vim-scripts/VisIncr'
Plug 'Yggdroot/LeaderF'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'godlygeek/tabular'
Plug 'osyo-manga/vim-over', {'on': 'OverCommandLine'}
Plug 'dyng/ctrlsf.vim'
Plug 'rking/ag.vim'
Plug 'sjl/gundo.vim', {'on': 'UndotreeToggle'}

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'Konfekt/FastFold'

" show
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'drmikehenry/vim-fontsize'
Plug 'morhetz/gruvbox'

call plug#end()
" filetype Plug indent on    " required

" {{{colorscheme
syntax enable

" set background=light
" set background=dark
colorscheme gruvbox
" colorscheme Wombat
" colorscheme monokai


set nobackup               " cloese backup
set display=lastline
set iskeyword+=_,$,@,%,#,-
set backspace=2            " backspace can be used
set nu!                    " show line number
set relativenumber         " relative line number
set autoread               " Set to auto read when a file is changed from the outside
set fdm=syntax             " floader lines
set cursorcolumn           " high light cursor column
set cursorline             " high light cursor line
set synmaxcol=300          " speedup long line
set linespace=-1           " set line high space
set lines=25 columns=120   " init UI size
set cc=100                 " colorcolumn 100
set linebreak              " Do not cut words between lines, USELESS!
set clipboard=unnamed      " yank and paste with the system clipboard
set lazyredraw             " Don't redraw while executing macros
set noerrorbells visualbell t_vb= " shut down error ringBell
set vb t_vb=
set novisualbell

set term=xterm
set autochdir
autocmd BufEnter * silent! lcd %:p:h:gs/ /\\ /
set encoding=utf-8 " file encoding setting
set langmenu=zh_CN.UTF-8
language message zh_CN.UTF-8
set fileencodings=utf-8,gbk,ucs-bom,cp936 "redad file orders 
set fenc=utf-8 "create new file encoding 
if g:iswindows 
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim
    language messages zh_CN.utf-8
endif
set nobomb
set list
set listchars=tab:\|-
set tabpagemax=15 
set showtabline=0
set paste
set noshowmode 


" status bar
set laststatus=2

" Ignore compiled files
set wildignore=*.o,*.a,*~,*.pyc
if g:iswindows 
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
    set wildignore+=*\\.git\\*,*\\.hg\\*,*\\.svn\\*  " Windows ('noshellslash')
else
    set wildignore+=.git\*,.hg\*,.svn\*,GRTAGS,GTAGS
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*        " Linux/MacOSX
endif

"Set mapleader
let mapleader = ","
let g:mapleader = ","
set ignorecase smartcase nowrapscan "search smart cease, no wrap, incrase, highlight

" VIM font setting
if (g:isMac)
    set guifont=Monaco:h12
elseif (g:isLinux)
    set guifont=Monaco
else
    set guifont=yaheiInconsolata:h11
endif

" C setting
set sm        " bracket mactch
set tabstop=4       " set width of tab
set shiftwidth=4    " set with of assignment blank num = 4
set softtabstop=4   " set 4 blanks as tab 
set et              " set exchange tab to 4 blanks
set cindent   " c style cindent
set cinoptions={0,1s,t0,(0,
nnoremap zz zt9k9j

" window jump in VIM Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ctrl+c ctrl+v ctrl+x
set clipboard+=unnamed
map <C-c> "+y
smap <C-c> "+y
imap <C-v> <ESC>"+p
map <C-v> "+p

" file code type
set ffs=dos,unix
nmap <leader>fd :se ff=dos<CR>
nmap <leader>fu :se ff=unix<CR>

" incsearch  {
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
set hlsearch
let g:incsearch#auto_nohlsearch = 1
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
" }

" Gundo  {
nnoremap <Leader>u :GundoToggle<CR>
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=100 "maximum number of changes that can be undone
" }

" matchIt {
let loaded_matchit = 1
" }

" easy motion {
let g:EasyMotion_do_shade = 0
" }

" ctrlsf.vim {
let g:ctrlsf_auto_close = 0
let g:ctrlsf_ackprg = 'ag'
let g:ctrlsf_case_sensitive = 'smart'
let g:ctrlsf_indent = 2
let g:ctrlsf_context = '-B 5 -A 3'
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_winsize = '30%'
let g:ctrlsf_position = 'right'
let g:ctrlsf_mapping = {
            \ "next": "n",
            \ "prev": "N",
            \ }
let g:ctrlsf_ignore_dir = ["node_modules"]	
" }

" tagbar {
let g:tagbar_left = 1
let g:tagbar_singleclick = 0
let g:tagbar_width = 30
let g:tagbar_sort = 0

if (g:isMac)
    let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
else
    let g:tagbar_ctags_bin = 'ctags'
endif

let g:tagbar_type_asciidoc = {
            \ 'ctagstype' : 'asciidoc',
            \ 'kinds' : [
            \ 'h:table of contents',
            \ 'a:anchors:1',
            \ 't:titles:1',
            \ 'n:includes:1',
            \ 'i:images:1',
            \ 'I:inline images:1'
            \ ],
            \ 'sort' : 0
            \ }
" }

" accelerated-smooth-scroll{
let g:ac_smooth_scroll_no_default_key_mappings=1
let g:ac_smooth_scroll_min_limit_msec = 20
let g:ac_smooth_scroll_fb_sleep_time_msec=1
lte g:ac_smooth_scroll_max_limit_msec=100

if (g:isGUI)
    if (g:isMac)
        nmap <silent> <D-k> <Plug>(ac-smooth-scroll-c-b)
        nmap <silent> <D-j> <Plug>(ac-smooth-scroll-c-f)
    else
        nmap <silent> <A-k> <Plug>(ac-smooth-scroll-c-b)
        nmap <silent> <A-j> <Plug>(ac-smooth-scroll-c-f)
    endif
else
    nmap <silent> k <Plug>(ac-smooth-scroll-c-b)
    nmap <silent> j <Plug>(ac-smooth-scroll-c-f)
endif

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')
" }


" NERD_comments
let NERDSpaceDelims = 1 
au BufEnter,BufRead,BufNewFile *.txt setlocal ft=txt "txtBrowser called
au BufEnter,BufRead,BufNewFile *.trc setlocal ft=trc "trcBrowser called

" vim-multiple-cursors {
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<A-]>'
let g:multi_cursor_prev_key='<A-[>'
let g:multi_cursor_skip_key='<A-\>'
let g:multi_cursor_quit_key='<Esc>'
"}

" vim-bookmarks {
highlight BookmarkSign ctermbg=NONE ctermfg=160
highlight BookmarkLine ctermbg=194 ctermfg=NONE
let g:bookmark_sign = '>>'
let g:bookmark_highlight_lines = 1
let g:bookmark_auto_close = 1
let g:bookmark_show_warning = 0
let g:bookmark_center = 1
"}

" Ctrl+S {
imap <C-s> <Esc>:wa!<CR>i<Right>
nmap <C-s> :wa!<CR>
set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin
" }

" NerdTree {
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
" }

" vim-repeat {
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)
" }

" easyGrep {
let EasyGrepMode = 2     "extension mode
let EasyGrepCommand = 1  "grep
" }

" gruvbox {
let g:gruvbox_italic=0
let g:gruvbox_italicize_comments=0
" }

" leaderF {
let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.[oad]','*.so','*.py[co]']
            \}
let g:Lf_DefaultMode=0
" }

" plantuml {
let g:plantuml_executable_script='java -jar c:\vim_tools\plantuml.jar -charset UTF-8'
"}

" FastFold {
let g:tex_fold_enabled=1
let g:vimsyn_folding='af'
let g:xml_syntax_folding = 1
let g:php_folding = 1
let g:perl_fold = 1
" }

" Ag {
let g:ag_prg="ag -S -U
let g:ag_format="%f:%l:%m"
" }

" airline设置 {
let g:airline_theme='wombat'
let g:airline#extensions#whitespace#enabled = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ‘ ‘
let g:airline#extensions#tabline#left_alt_sep = ‘|’
let g:airline#extensions#tabline#buffer_nr_show = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

nnoremap <C-tab> :bn<CR>
nnoremap <C-s-tab> :bp<CR>

map <leader>1 :b 1<CR>
map <leader>2 :b 2<CR>
map <leader>3 :b 3<CR>
map <leader>4 :b 4<CR>
map <leader>5 :b 5<CR>
map <leader>6 :b 6<CR>
map <leader>7 :b 7<CR>
map <leader>8 :b 8<CR>
map <leader>9 :b 9<CR>
map <leader>- :bd<CR>
" }

" gen_tags {
let g:gen_tags#use_cache_dir = 0
let g:gen_tags#verbose = 1
" }

func Replace_Chn()  " for writing latex
    let chinese={ "（" : "(" , "）" : ")" , "，" : ", ", "。" : ". ", "；" : "; ", "：" : ": ", "？" : "? ", "！" : "! ", "、" : ", ", "“" : "\"", "’" : "'" ,"”" : "\"", "℃" : "\\\\textcelsius", "μ" : "$\\\\mu$"}
    for i in keys(chinese)
        silent! exec '%substitute/' . i . '/'. chinese[i] . '/g'
    endfor
endfunc
nmap <silent> <leader>lc <ESC>:call Replace_Chn()<CR>

nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" """"""""""""""""""" F1-F12"""""""""""""""""""""""""
" F1 Toggle Menu and Toolbar {
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=L 
    set guioptions-=r
    set guioptions-=b
    map <silent> <F1> :if &guioptions =~# 'T' <Bar>
                \set guioptions-=T <Bar>
                \set guioptions-=m <bar>
                \set guioptions-=L <bar>
                \set guioptions-=r <bar>
                \set guioptions-=b <bar>
                \else <Bar>
                \set guioptions+=T <Bar>
                \set guioptions+=m <Bar>
                \set guioptions+=L <bar>
                \set guioptions+=r <bar>
                \set guioptions+=b <bar>
                \endif<CR>
endif
"}

"F2 file infor
let g:vimrc_author='loseblue' 
let g:vimrc_email='loseblue[a]163.com' 
let g:vimrc_homepage='http://loseblue.farbox.com/' 
nmap <F2> :AuthorInfoDetect<CR>

nmap <F3> <ESC>:CtrlSF <c-r><c-w>
nmap <C-F3> <ESC>:CtrlSF 
nmap <S-F3> <ESC>:CtrlSFToggle<CR> 

nmap <F4> <ESC>:Ag ""<left>

" C-F5 plantuml make F5 dot
nnoremap <F5> :w<CR> :silent make<CR>
inoremap <F5> <Esc>:w<CR>:silent make<CR>
vnoremap <F5> :<C-U>:w<CR>:silent make<CR>

map <F6> <Esc>:BinEdit<CR>
imap <F7> <C-R>=strftime("%c")<CR>

nmap <F9> :TagbarToggle<CR>
noremap <C-F9> :LeaderfFunction!<CR>
