
"colorscheme desert

" Vundle
filetype off

let g:vundle_default_git_proto = 'git'
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Bundles
Bundle 'tpope/vim-fugitive'
Bundle 'sjl/gundo.vim'
Bundle 'msanders/snipmate.vim'
Bundle 'godlygeek/tabular'
Bundle 'benmills/vimux'
Bundle 'Lokaltog/vim-powerline'
Bundle 'altercation/vim-colors-solarized'
Bundle 'scrooloose/nerdtree'
Bundle 'TomNomNom/xoria256.vim'
Bundle 'tomasr/molokai'
Bundle 'kien/ctrlp.vim'

" Required for vundle
"filetype plugin indent on
filetype plugin on

" Highlighting
syntax on

set encoding=utf-8

" Display
set ls=2
set showmode
set showcmd
set modeline
set ruler
set title
set nu

" Line wrapping
set nowrap
set linebreak
set showbreak=▹

" Auto indent what you can
set autoindent

" Searching
set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Make backspace a bit nicer
set backspace=eol,start,indent

" Enable the mouse
" set mouse=a

" Normally we use vim-extensions. If you want true vi-compatibility

" remove change the following statements
set nocompatible    " Use Vim defaults instead of 100% vi compatibility
set backspace=2     " more powerful backspacing
set number
set ai                  " auto indenting
set history=100         " keep 100 lines of history
set ruler       " show the cursor position
set hlsearch            " highlight the last searched term

" Enable tab complete of file names
set wildmode=longest,list,full
set wildmenu

set title
set modeline
set showmode
set showcmd

set nowrap
set linebreak
set showbreak=▹

set ignorecase
set smartcase
set gdefault
set hlsearch
set showmatch

" Enable jumping into files in a search buffer
set hidden

" Indentation
set shiftwidth=4
set tabstop=4
set softtabstop=4
set shiftround
set expandtab

" Switch tabs
nmap <F8> <Esc>:tabp<CR>
nmap <F9> <Esc>:tabn<CR>
nmap <F10> <Esc>:tabc<CR>
imap <F8> <Esc>:tabp<CR>
imap <F9> <Esc>:tabn<CR>
imap <F10> <Esc>:tabc<CR>


"Toggle line-wrap
map <F6> <Esc>:set wrap!<CR>

" Direction keys for wrapped lines
nnoremap <silent> k gk
nnoremap <silent> j gj
nnoremap <silent> <Up> gk
nnoremap <silent> <Down> gj
inoremap <silent> <Up> <Esc>gka
inoremap <silent> <Down> <Esc>gja

" Write current file with sudo perms
command! W w !sudo tee % > /dev/null

" When editing a file, always jump to the last cursor position
autocmd BufReadPost *
\ if ! exists("g:leave_my_cursor_position_alone") |
\ if line("'\"") > 0 && line ("'\"") <= line("$") |
\ exe "normal g'\"" |
\ endif |
\ endif

" Don't write backup file if vim is being called by "crontab -e"
au BufWrite /private/tmp/crontab.* set nowritebackup
" Don't write backup file if vim is being called by "chpass"
au BufWrite /private/etc/pw.* set nowritebackup


" NERDTree
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
map <F2> :NERDTreeToggle<CR>

