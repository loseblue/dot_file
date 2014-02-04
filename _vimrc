"=============================================================================
"     FileName: _vimrc
"         Desc: 
"       Author: loseblue
"        Email: loseblue[a]163.com
"      Version: 1.2.0
"   LastChange: 2014-02-04 18:51:00
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
set nocompatible    " be iMproved
filetype off        " required!

set rtp+=~/.vim/bundle/vundle/

call vundle#rc()
" required!
Bundle 'gmarik/vundle'

" vim-scripts repos
Bundle 'a.vim'
Bundle 'loseblue/AuthorInfo'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'loseblue/vim-smooth-scroll'
Bundle 'ihacklog/Mark'
Bundle 'Yggdroot/indentLine'
Bundle 'matchit.zip'
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'drmikehenry/vim-fontsize'

" ======easytags=====
Bundle 'xolox/vim-misc'
Bundle 'xolox/vim-shell'
" Bundle 'xolox/vim-easytags'
" ======easytags=====
Bundle 'gtags.vim'
Bundle 'loseblue/gtags-cscope.vim'
Bundle 'The-NERD-Commenter'
Bundle 'The-NERD-tree'
Bundle 'majutsushi/tagbar'
Bundle 'genutils'
Bundle 'loseblue/TabBar'
Bundle 'kien/ctrlp.vim'
Bundle 'godlygeek/tabular'
Bundle 'DrawIt'
Bundle 'tpope/vim-fugitive'
Bundle 'TeTrIs.vim'
Bundle 'osyo-manga/vim-over'
Bundle 'plasticboy/vim-markdown'
Bundle 'EasyGrep'
Bundle 'dyng/ctrlsf.vim'
"==========colorscheme============
Bundle 'bling/vim-airline'
Bundle 'chriskempson/tomorrow-theme'
"==========colorscheme============

filetype plugin indent on    " required!

" {{{colorscheme
syntax enable
colorscheme Tomorrow-Night-Eighties
"}}}
"=========================== END Vundle ================================

set nobackup               " cloese backup
set display=lastline
set iskeyword+=_,$,@,%,#,-
set backspace=2            " backspace can be used
set nu!                    " show line number
set autoread               " Set to auto read when a file is changed from the outside
set foldenable
set fdm=syntax             " floader lines
set cursorcolumn           " high light cursor column
set cursorline             " high light cursor line
set synmaxcol=300          " speedup long line
set linespace=-2           " set line high space
set lines=25 columns=120   " init UI size
set linebreak              " Do not cut words between lines, USELESS!
set clipboard=unnamed      " yank and paste with the system clipboard
set lazyredraw             " Don't redraw while executing macros

set noerrorbells visualbell t_vb= " shut down error ringBell

set encoding=utf-8 " file encoding setting
set fileencodings=utf-8,gbk,ucs-bom,cp936 "redad file orders 
set fenc=utf-8 "create new file encoding 
set nobomb

set list
set listchars=tab:\|-
set tabpagemax=15 
set showtabline=2
set paste
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
set noshowmode 

set laststatus=2 
" highlight StatusLineNC guifg=LightGrey guibg=LightSlateGrey 
" set statusline=[%<%f\]\ %{fugitive#statusline()}\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [A=\%03.3b/H=0x\%02.2B]\ [POS=%l,%v][%p%%]\ %y%r%m%*%=\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}

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
set ignorecase smartcase "search cease smart

" VIM font setting
if (g:isMac)
    set guifont=Monaco:h12
elseif (g:isLinux)
    set guifont=Monaco
else
    set guifont=yaheiInconsolata:h11
endif
set laststatus=2 
set t_Co=256 
" let g:Powerline_symbols='fancy' 
let g:airline_theme="solarized"
let g:airline_powerline_fonts = 1
let g:airline#extensions#syntastic#enabled = 0

let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_branch_prefix = '⭠'
let g:airline_readonly_symbol = '⭤'
let g:airline_linecolumn_prefix = '⭡'


" C setting
set sm        " bracket mactch
set tabstop=4       " set width of tab
set shiftwidth=4    " set with of assignment blank num = 4
set et              " set exchange tab to 4 blanks
set cindent   " c style cindent
set cinoptions={0,1s,t0,(0,
nnoremap zz zt6k6j
nnoremap [[ [[zt6k6j
nnoremap ]] ]]zt6k6j

"window jump in VIM Ctrl + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" "ctrl+c ctrl+v ctrl+x
set clipboard+=unnamed
vmap <C-c> "+y
imap <C-v> <ESC>"+p
nmap <C-v> "+p
vmap <C-v> "+p

" file code type
set ffs=dos,unix
nmap <leader>fd :se ff=dos<cr>
nmap <leader>fu :se ff=unix<cr>

" Persistent Undo
set undofile
set undodir=$VIMFILES/\_undodir
set undolevels=100 "maximum number of changes that can be undone

" matchIt plug
let loaded_matchit = 1

" easy motion
let g:EasyMotion_do_shade = 0

" ctrlsf.vim
let g:ctrlsf_ackprg = 'ag'
" let g:ctrlsf_auto_close = 0
" let g:ctrlsf_context = '-B 5 -A 3'
" }

" """"""""""""""""""" F1-F12"""""""""""""""""""""""""
" F1 Toggle Menu and Toolbar {
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    map <silent> <F1> :if &guioptions =~# 'T' <Bar>
                \set guioptions-=T <Bar>
                \set guioptions-=m <bar>
                \else <Bar>
                \set guioptions+=T <Bar>
                \set guioptions+=m <Bar>
                \endif<CR>
endif
"}

map <F2> :MarksBrowser<cr>
nmap <F3> <ESC>:CtrlSF <c-r><c-w><CR>
nmap <C-F3> <ESC>:CtrlSFOpen<CR>

"F4 file infor
let g:vimrc_author='loseblue' 
let g:vimrc_email='loseblue[a]163.com' 
let g:vimrc_homepage='http://loseblue.farbox.com/' 
nmap <F4> :AuthorInfoDetect<cr>

map <F5> :%s/\r//g<cr>:w<cr>gg
imap <F7> <C-R>=strftime("%c")<CR>

nmap <silent> <F9> :TagbarToggle<CR>
let g:tagbar_left = 1
let g:tagbar_singleclick = 0
if has("gui_macvim")
    let g:tagbar_ctags_bin = '/usr/local/Cellar/ctags/5.8/bin/ctags'
else
    let g:tagbar_ctags_bin = 'ctags'
endif

let g:tagbar_width = 30
let g:tagbar_sort = 0

" roll 90% screen in screen Alt + jk {
if (g:isGUI)
    if (g:isMac)
        noremap <silent> <D-k> :call smooth_scroll#up(&scroll*17/10, 0, 2, 0)<CR>
        noremap <silent> <D-j> :call smooth_scroll#down(&scroll*17/10, 0, 2, 0)<CR>
    else
        noremap <silent> <A-k> :call smooth_scroll#up(&scroll*17/10, 0, 2, 0)<CR>
        noremap <silent> <A-j> :call smooth_scroll#down(&scroll*17/10, 0, 2, 0)<CR>
    endif
else
    noremap <silent> k :call smooth_scroll#up(&scroll*17/10, 0, 2, 0)<CR>
    noremap <silent> j :call smooth_scroll#down(&scroll*17/10, 0, 2, 0)<CR>
endif
"}

" NERD_comments
let NERDSpaceDelims = 1 
au BufEnter,BufRead,BufNewFile *.txt setlocal ft=txt "txtBrowser called
au BufEnter,BufRead,BufNewFile *.trc setlocal ft=trc "trcBrowser called

" a.vim {
let g:alternateNoDefaultAlternate = 1
"}

" vim-multiple-cursors {
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-]>'
let g:multi_cursor_prev_key='<C-[>'
let g:multi_cursor_skip_key='<C-\>'
let g:multi_cursor_quit_key='<Esc>'
"}

"tabbar & tab swith{
let g:Tb_UseSingleClick = 1
let g:Tb_ModSelTarget = 1
if (g:isGUI)
    if (g:isMac)
        map <D-Left> :Tbbn<CR>
        map <D-Right> :Tbbp<CR>
        map <D--> :Tbbd<CR>
    else
        map <A-Left> :Tbbn<CR>
        map <A-Right> :Tbbp<CR>
        map <A--> :Tbbd<CR>
    endif
else
    map   :Tbbn<CR>
    map   :Tbbp<CR>
    map - :Tbbd<CR>
endif
map <S-Left> :tabp<CR>
map <S-Right> :tabn<CR>
""}


" ctrlp{
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn)$',
            \ 'file': '\v\.(exe|so|dll|o|a|sbr|obj)$',
            \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
            \ }

let g:ctrlp_reuse_window = 'netrw\|help\|quickfix\|tagbar\|taglist'
let g:ctrlp_by_filename = 1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_max_height=9
let g:ctrlp_match_window_reversed=0
let g:ctrlp_follow_symlinks=1
let g:ctrlp_lazy_update = 1
" }


" Ctrl+S {
imap <C-s> <Esc>:wa!<cr>i<Right>
nmap <C-s> :wa!<cr>
set nocompatible
source $VIMRUNTIME/mswin.vim
behave mswin
" }

" NerdTree {
let NERDTreeWinPos="right"
let NERDTreeShowBookmarks=1
" }

" easyGrep{
let EasyGrepMode = 2     "extension mode
let EasyGrepCommand = 1  "grep
" }

" markdown highlight {
let g:vim_markdown_folding_disabled=1
let g:vim_markdown_initial_foldlevel=1
" }

" Neocomplcache {
"Note: This option must set it in .vimrc(_vimrc).  NOT IN .gvimrc(_gvimrc)!
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#mappings#smart_close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplcache#mappings#smart_close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
"inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() : "\<Space>"

" AutoComplPop like behavior.
"let g:neocomplete#enable_auto_select = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.c = '[^.[:digit:] *\t]\%(\.\|->\)'
"let g:neocomplete#sources#omni#input_patterns.cpp = '[^.[:digit:] *\t]\%(\.\|->\)\|\h\w*::'
let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'
"}

" Neosnippet {
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" }

" settings of cscope.
" I use GNU global instead cscope because global is faster.
set cscopetag
set cscopeprg=gtags-cscope
set cscopequickfix=c-,d-,e-,f-,g0,i-,s-,t-
let GtagsCscope_Auto_Load = 1
let GtagsCscope_Auto_Map = 1
let GtagsCscope_Absolute_Path = 0
let GtagsCscope_Keep_Alive = 0
nmap <silent> <leader>gd <ESC>:cstag <c-r><c-w><CR>
nmap <silent> <leader>gc <ESC>:lcs f c <c-r><c-w><cr>:lw<cr>
nmap <silent> <leader>gs <ESC>:lcs f s <c-r><c-w><cr>:lw<cr>

au BufWritePost *.[ch] call UpdateGtags()

function! UpdateGtags()
    call xolox#misc#os#exec({'command': 'global -u', 'async': 1})
endfunction

set diffexpr=MyDiff()
function MyDiff()
    let opt = '-a --binary '
    if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
    if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
    let arg1 = v:fname_in
    if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
    let arg2 = v:fname_new
    if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
    let arg3 = v:fname_out
    if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
    let eq = ''
    if $VIMRUNTIME =~ ' '
        if &sh =~ '\<cmd'
            let cmd = '""' . $VIMRUNTIME . '\diff"'
            let eq = '"'
        else
            let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
        endif
    else
        let cmd = $VIMRUNTIME . '\diff'
    endif
    silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction


