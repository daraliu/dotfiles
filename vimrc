set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'scrooloose/syntastic'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Vim-R-plugin'
Plugin 'The-NERD-tree'
Plugin 'kien/ctrlp.vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdcommenter'

Plugin 'vim-scripts/taglist.vim'
Plugin 'vim-scripts/filetype.vim'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'vim-scripts/matchit.zip'

""" Language specific
Plugin 'derekwyatt/vim-scala'
Plugin 'vim-scripts/python.vim--Vasiliev'
Plugin 'vim-scripts/phtml.vim'
Plugin 'joonty/vim-phpqa'
Plugin 'chilicuil/vim-sml-coursera'

Plugin 'tpope/vim-markdown'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'shawncplus/phpcomplete.vim'
Plugin 'vim-scripts/a.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set enc=utf-8
" Appearance
set colorcolumn=100
filetype plugin indent on
"set background=light
set background=dark

let g:solarized_contrast="low"
let g:solarized_visibility="high"

" let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1

if has('gui_running')
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=b  "remove horizontal scroll bar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=R  "remove right-hand scroll bar when vsp
    set guioptions-=l  "remove left-hand scroll bar
    set guioptions-=L  "remove left-hand scroll bar when vspendif
else
    if $TERM =~ "-256color"
        se t_Co=256
        let g:solarized_termcolors=256
        let g:solarized_contrast="high"
        let g:solarized_termtrans=1
    endif
endif

" load color scheme if available
try
    colorscheme solarized
catch /^Vim\%((\a\+)\)\=:E185/
    " deal with it
endtry


syntax on
set number
set guifont=Source\ Code\ Pro\ 10

set tabstop=4
set shiftwidth=4
set expandtab
set softtabstop=4


set backspace=indent,eol,start

" Back-up management
"set nobackup
"set nowritebackup
"set noswapfile

set autoread               " Automatically read a file that has changed on disk
set clipboard=unnamedplus  " Use default X-System register for copy and paste
se history=200            " Sets how many lines of history VIM has to remember
set undolevels=1000        " Number of changes that can be undone
set undoreload=10000       " Number lines to save for undo on a buffer reload
set noundofile             " Don't keep a persistent undofile

"" delete without yanking by default
"nnoremap d "_d
"vnoremap d "_d
"" yank only when <leader> is used
"nnoremap <leader>d "+d
"vnoremap <leader>d "+d

"" replace currently selected text with default register, without yanking it
"vnoremap p "_dP
"" replace with yanking, only when <leader> is used
"vnoremap <leader>p "+dP

"" delete character without yanking
"nnoremap x "_x
"vnoremap x "_x
"" delete charact with yanking only when leader is pressed
"nnoremap <leader>x "+x
"vnoremap <leader>x "+x

"" free up <leader>d
let g:ycm_key_detailed_diagnostics = ''

" prevent vim from littering directories with swap and ~ files
" tell vim where to put its backup files
set backupdir=~/vim_tmp

" tell vim where to put swap files
set dir=~/vim_tmp

set history=256
set ruler
set showcmd

" show matching enclosing chars for .5 sec
set showmatch

" max items in popup menu
set pumheight=8

" indicate when a line is wrapped by prefixing wrapped line with '> '
set showbreak=>\

" A common operation is to search for text, so it makes sense to have some
" sane defaults. The incsearch option highlights as you type an expression
" (a.k.a. “Emacs style”), and ignorecase plus smartcase make searches
" case-insensitive except when you include upper-case characters
" (so /foo matches FOO and fOo, but /FOO only matches the former).
" hlsearch is a useful option which highlights the current search,
" but the highlight can become annoying so it makes sense to have a key
" to clear the highlight when you no longer need it:
set incsearch
set ignorecase
set smartcase
" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif
nmap \q :nohlsearch<CR>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" remap Escape key
:imap jk <Esc>

if has('mouse')
    set mouse=a
endif


" Only do this part when compiled with support for autocommands.
if has("autocmd")
  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Remove any trailing whitespace that is in the file
autocmd BufRead,BufWrite * if ! &bin | silent! %s/\s\+$//ge | endif

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" Who uses ',' in vim, anyway? :)
let g:mapleader=','

" Natural navigation in wrapped lines
nnoremap j gj
nnoremap k gk

""" Buffers
" Reopen the last file in buffer; use :b# if funny things start to happen
" nmap <C-e> :e#<CR>
" cycle between all open buffers:
nmap <C-n> :bnext<CR>
nmap <C-p> :bprev<CR>

" http://stackoverflow.com/a/676619/113868
" By pressing ctrl + r in the visual mode you will be prompted to enter text
" to replace with. Press enter and then confirm each change you agree with 'y'
" or decline with 'n'.
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

" ctrlp plugin remappings
nmap ; :CtrlPBuffer<CR>

" NerdTREE toggle
nmap \e :NERDTreeToggle<CR>

" TagList related
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<CR>
map <F8> :!/usr/bin/ctags<CR>
" set the names of flags
let tlist_php_settings = 'php;c:class;f:function;d:constant'
" close all folds except for current file
let Tlist_File_Fold_Auto_Close = 1
" make tlist pane active when opened
let Tlist_GainFocus_On_ToggleOpen = 1
" width of window
let Tlist_WinWidth = 40
" close tlist when a selection is made
let Tlist_Close_On_Select = 1

" Powerline options
let g:Powerline_symbols = 'unicode'

" switch line wrapping
nmap \w :setlocal wrap!<CR>:setlocal wrap?<CR>
set wrap linebreak textwidth=0

" Vim Fugitive autoremove buffers
autocmd BufReadPost fugitive://* set bufhidden=delete

" CtrlP plugin mappings
let g:ctrlp_map = '<Leader>t'
let g:ctrlp_match_window_bottom = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
let g:ctrlp_working_path_mode = 0
let g:ctrlp_dotfiles = 0
let g:ctrlp_switch_buffer = 0

" smooth scroll
function! SmoothScroll(up)
    if a:up
        let scrollaction=""
    else
        let scrollaction=""
    endif
    exec "normal " . scrollaction
    redraw
    let counter=1
    while counter<&scroll
        let counter+=1
        sleep 10m
        redraw
        exec "normal " . scrollaction
    endwhile
endfunction

nnoremap <C-U> :call SmoothScroll(1)<Enter>
nnoremap <C-D> :call SmoothScroll(0)<Enter>
inoremap <C-U> <Esc>:call SmoothScroll(1)<Enter>i
inoremap <C-D> <Esc>:call SmoothScroll(0)<Enter>i

" PHP Code Sniffer options
let g:phpqa_codesniffer_args = "--standard=Zend"

" R
let vimrplugin_assign = 0

" SML coursera options
"let sml_coursera_interactive=1
"let sml_coursera_clean_output=1

" Indentation for variuos file types
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType phtml setlocal shiftwidth=2 tabstop=2 softtabstop=2
autocmd FileType python setlocal shiftwidth=4 tabstop=4 softtabstop=4
autocmd FileType php setlocal shiftwidth=4 tabstop=4 softtabstop=4

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd Filetype octave set omnifunc=syntaxcomplete#Complete

" don't move back after exiting insert mode
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif
