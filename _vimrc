"""""""""""""""""""""""""""""""
" PLUGINS
"""""""""""""""""""""""""""""""
" set the runtime path to include Vundle and initialize
" set rtp+=C:\Program Files\Vim\bundle\Vundle.vim
" call vundle#begin()
" alternatively, pass a path where Vundle should install plugins

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""" Plugin-Related Variables
" Help taglist plugin look for ctags.exe dependency prog
let Tlist_Ctags_Cmd="c:/ctags/ctags.exe"
" Enable neocomplcache on startup
let g:neocomplcache_enable_at_startup = 0 

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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

call vundle#begin('C:\Program Files\Vim\vim74\bundles')
" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'

" Optional:
Plugin 'vim-voom/VOoM'
Plugin 'vim-voom/VOoM_extras'
Plugin 'davidhalter/jedi-vim'
Plugin 'honza/vim-snippets'
Plugin 'garbas/vim-snipmate'
Plugin 'scrooloose/syntastic'
Plugin 'Shougo/neocomplcache'
Plugin 'yegappan/mru'
Plugin 'jiangmiao/auto-pairs'
Plugin 'akmassey/vim-codeschool'
Plugin 'mhinz/vim-startify'
Plugin 'bling/vim-airline'
Plugin 'thinca/vim-quickrun'
Plugin 'vim-scripts/JavaImp.vim--Lee'
Plugin 'dkprice/vim-easygrep'
Plugin 'majutsushi/tagbar'
"Plugin 'derekmcloughlin/gvimfullscreen_win32'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'tomtom/tcomment_vim'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'ktonga/vim-follow-my-lead'
" Plugin 'artur-shaik/vim-javacomplete2'
"Plugin 'powerline/powerline'
"Plugin 'tpope/vim-vinegar' 
"Plugin 'ggreer/the_silver_searcher'
"Plugin 'rking/ag'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'mattn/emmet-vim'
"
" All of your Plugins must be added before the following line

" let g:JavaComplete_Home = 'C:/Program Files/Vim/vim74/bundles/vim-javacomplete2'
" let $CLASSPATH .= '.;' . 'C:/Program Files/Vim/vim74/bundles/vim-javacomplete2/lib/javavi/target/classes'
" autocmd FileType java set omnifunc=javacomplete#Complete
" nnoremap <F4> :JCimportAdd<cr>
" inoremap <F4> <esc>:JCimportAddI<cr>

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""
" ESSENTIAL REMAPS 
"""""""""""""""""""""""""""""""
" Convenience keys in normal mode
nnoremap <BS> Xh 
nmap <Space> i <Esc>l
" nnoremap <silent> <CR> O<Esc>j
nnoremap <silent> <CR> i<CR><Esc>
nnoremap <silent> <C-CR> o<Esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" editing remaps
inoremap <C-d> <Del>

" tComment remaps
let g:tcommentMapLeader1 = ''
" noremap <silent> <c-/> :TComment<cr>
" nmap <silent> <Leader>\ :TComment<cr>
" vmap <silent> <Leader>\ :TComment<cr>
" vnoremap <silent> <c-/> :TCommentMaybeInline<cr>gv
" inoremap <silent> <c-/> <c-o>:TComment<cr>

" Map Ctrl-Backspace to delete the previous word in insert mode.
imap <C-BS> <C-W>
" -- Complete statement with semicolon
"inoremap <leader>; <C-o>m`<C-o>A;<C-o>`` 
" -- Complete statement with semicolon

"
" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <C-O>:update<CR>

map <C-T> <Esc>:tabnew<CR>
map <C-\> :tabnew c:/Program\ Files/Vim/_vimrc<CR>

" Remap Alt-Home to Startify

nmap <M-Home> <Esc>:Startify<CR>
nmap <M-End> <Esc>:VoomToggle<CR>
" Remap Alt-] to Voom
"
"""""""""""""""""""""""""""""""
" ESC REMAPS
"""""""""""""""""""""""""""""""
" Esc - Can be typed even faster than jj.
imap jk <Esc>
nnoremap <S-CR> a
"vmap jk  <Esc>
imap <S-CR> <Esc>
vmap <S-CR> <Esc>

nnoremap <C-Space> a
imap <C-Space> <Esc>
vmap <C-Space> <Esc>

" end Esc

"""""""""""""""""""""""""""""""
" MISC REMAPS
"""""""""""""""""""""""""""""""
noremap :ol :browse oldfiles<CR>


"""""""""""""""""""""""""""""""
" USEFUL TRICKS
"""""""""""""""""""""""""""""""
" Move visual block - Rebinds J and K in visual mode to move block up or down in relation to the other lines, while keeping the selection.
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
map <silent> ± :tabn 1<CR>
map <silent> ² :tabn 2<CR>
map <silent> ³ :tabn 3<CR>
map <silent> ´ :tabn 4<CR>
map <silent> µ :tabn 5<CR>


"""""""""""""""""""""""""""""""
" USEFUL TRICKS
"""""""""""""""""""""""""""""""
" Select a range using :1,2V
command! -range V call setpos('.', [0,<line1>,0,0]) |
            \ exe "normal V" |
            \ call setpos('.', [0,<line2>,0,0])

"noremap <Up> <Esc>HAHAHA
"vnoremap <Up> <Esc>HAHAHA
"inoremap <Up> <Esc>HAHAHA
"
"noremap <Down> <Esc>HAHAHA
"vnoremap <Down> <Esc>HAHAHA
"inoremap <Down> <Esc>HAHAHA
"
"noremap <Left> <Esc>HAHAHA
"vnoremap <Left> <Esc>HAHAHA
"inoremap <Left> <Esc>HAHAHA
"
"noremap <Right> <Esc>HAHAHA
"vnoremap <Right> <Esc>HAHAHA

"""""""""""""""""""""""""""""""
" VIM CUSTOMIZATIONS
"""""""""""""""""""""""""""""""
let maplocalleader = ","     " set mapleader from \ to ,

" set relativenumber
"
" Folding
set foldmethod=marker
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

set incsearch
nohlsearch


" " Navigate 4x faster when holding down Ctrl
" nmap <c-j> 4j
" nmap <c-k> 4k
" nmap <c-h> 4h
" nmap <c-l> 4l

" Easy Easymotion
nmap <c-h> <Leader><Leader>b
nmap <c-l> <Leader><Leader>w

" Ex commands with / and $
cnoremap $t <CR>:t''<CR>
cnoremap $T <CR>:T''<CR>
cnoremap $m <CR>:m''<CR>
cnoremap $M <CR>:M''<CR>
cnoremap $d <CR>:d<CR>``



set backspace=indent,eol,start
set tags+=tags;/
" Tab-related stuff
set wildmenu
set breakindent
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smarttab
set showcmd
set expandtab
set bg=light
set lazyredraw " Don't redraw screen when running macros.

set smartcase
set ignorecase
set ruler			  " show position of cursor all the time
set nocompatible
set lines=110 columns=120
set number

" PowerLine Options
set encoding=utf-8
set guifont=Liberation_Mono_for_Powerline:h12
"set guifont=Droid_Sans_Mono_for_Powerline:h12
"set guifont=Menlo\ for\ Powerline

set guioptions-=T  "remove toolbar
"set backupdir=c:/Program\ Files/Vim/tmp
"set directory=c:/Program\ Files/Vim/tmp " Don't clutter my dirs up with swp and tmp files

set cdpath=T:/raf/code
set nocompatible              " be iMproved, required
filetype off                  " required

" Centralize backups, swapfiles and undo history
set backupdir=r:/vimtmp/backups
set directory=r:/vimtmp//swaps
if exists("&undodir")
    set undodir=r:/vimtmp/undo
endif

"set backupskip=/tmp/*,/private/tmp/*

"""""""""""""""""""""""""""""""
" LEADER MAPS
"""""""""""""""""""""""""""""""
nmap <Leader>tl :TlistToggle<CR>
nmap <Leader>- :cd %:h<CR>:NERDTreeCWD<CR>
nmap <Leader>oc :NERDTreeCWD<CR>
nmap <M-r> :QuickRun<CR>
nmap - :NERDTreeToggle<CR>

ca <silent> nt NERDTree
" Map Ctrl-d in Insert Mode to forward delete!
command! Nt NERDTree

"set guifont=Liberation_Mono:h12
"inoremap <Right> <Esc>HAHAHA

"""""""""""""""""""""""""""""""
" BEN ORENSTEIN STUFF
"""""""""""""""""""""""""""""""
nmap <c-a> ggvG
" Emacs-like beginning and end of line.
imap <c-e> <c-o>$
nmap <silent> ¯ :TComment<CR>
vmap <silent> ¯ :TComment<CR>
imap ¯ <Esc>:TComment<CR>i

"imap <c-a> <c-o>^

" Highlight the status line
highlight StatusLine ctermfg=blue ctermbg=yellow

" Let's be reasonable, shall we?
nmap k gk
nmap j gj

" Autocomplete with tab
" inoremap <Tab> <C-N>

" (Hopefully) removes the delay when hitting esc in insert mode
set noesckeys
set ttimeout
set ttimeoutlen=1

noremap <Ctrl>X "+y
noremap <Ctrl>V "+gP
noremap <Leader>co ggVG"*y
noremap <Leader>fmt ggVG=

" Don't wait so long for the next keypress (particularly in ambigious Leader
" situations.
set timeoutlen=500

" Obsolete - use quickrun instead
" noremap <Leader>jc :!javac -cp "%:p" "%"<CR>

" Edit another file in the same directory as the current file
" uses expression to extract path from current file's path
map <Leader>e :e <C-R>=escape(expand("%:p:h"),' ') . '/'<CR>
map <Leader>s :split <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>
map <Leader>v :vnew <C-R>=escape(expand("%:p:h"), ' ') . '/'<CR>

command! Q q " Bind :Q to :q
command! Qall qall
command! QA qall
command! E e

"Navigational Assist with J-K
nnoremap <C-I> <C-Y>

nnoremap <C-j> <ScrollWheelDown>
nnoremap <C-k> <ScrollWheelUp>

nnoremap <M-j> <C-d>
nnoremap <M-k> <C-u>
nmap <Tab> gg
nmap <S-Tab> G
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"
"""""""""""""""""""""""""""""""
" MACRO STUFF
"""""""""""""""""""""""""""""""
let @k = 'yiwopa(){}kkYjjkkYjkVjj='  " create constructor
let @c = 'yiwGoclass pA {}ki	'  " create new class
let @g = '^"qyww"wywo"qpi i getjk"wpbftlvlg~A�kb(){'  " generate getter

"""""""""""""""""""""""""""""""
" JAVA-SPECIFIC
"""""""""""""""""""""""""""""""
noremap <F5> :call JavaInsertImport()<CR>
function! JavaInsertImport()
    exe "normal mz"
    let cur_class = expand("<cword>")
    try
        if search('^\s*import\s.*\.' . cur_class . '\s*;') > 0
            throw getline('.') . ": import already exist!"
        endif
        wincmd }
        wincmd P
        1
        if search('^\s*public.*\s\%(class\|interface\)\s\+' . cur_class) > 0
            1
            if search('^\s*package\s') > 0
                yank y
            else
                throw "Package definition not found!"
            endif
        else
            throw cur_class . ": class not found!"
        endif
        wincmd p
        normal! G
        " insert after last import or in first line
        if search('^\s*import\s', 'b') > 0
            put y
        else
            1
            put! y
        endif
        substitute/^\s*package/import/g
        substitute/\s\+/ /g
        exe "normal! 2ER." . cur_class . ";\<Esc>lD"
    catch /.*/
        echoerr v:exception
    finally
        " wipe preview window (from buffer list)
        silent! wincmd P
        if &previewwindow
            bwipeout
        endif
        exe "normal! `z"
    endtry
endfunction

let g:JavaImpPaths = 'T:\RAF\CODE\lib\java\src' 
nmap <M-i> :JavaImpSilent<CR>


"""""""""""""""""""""""""""""""
" MISC
"""""""""""""""""""""""""""""""
inoremap <Leader>; <C-o>A;

"let g:JavaImpDataDir = "/vim/JavaImp"
"let g:JavaImpDocPaths = "/j2sdk1.4.2_01/docs/api"
"let g:JavaImpDocViewer = "iexplore.exe"
"exe "setlocal dict=" . g:JavaImpDataDir . "/JavaImp.txt"
"invoke through Alt-a
"nmap <M-a> :JID<CR>
nmap <F8> :TagbarToggle<CR>



" Go fullscreen with gvimfullscreen_win32
map <F11> <Esc>:call libcallnr("gvimfullscreen.dll", "ToggleFullScreen", 0)<CR> 

"POWERLINE/VIM-AIRLINE
let g:airline_powerline_fonts = 1
set laststatus=2
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
" autocmd VimEnter * NERDTree
" autocmd VimEnter * execute "normal \<C-W>w"
"

"syntax enable
if &t_Co > 2 || has("gui_running")
    syntax on
    set hlsearch
endif
set list listchars=tab:��,trail:�

colorscheme codeschool
set whichwrap+=<,>,[,],h,l

" Disable beeping sounds
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

"""""""""""""""""""""""""""""""
" MOUSE CURSORS 
"""""""""""""""""""""""""""""""
set mouseshape=n:beam
set mouseshape=i:beam
set mouseshape=v:beam
set mouseshape=ve:beam


