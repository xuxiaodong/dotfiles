""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Vim configuration file
" Maintainer:   Xu Xiaodong <xxdlhy at gmail.com>
" Version:      0.1
" Last Change:  16/01/09 14:39:16  
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VI's compatible mode
set nocompatible

if $TERM == 'linux'
    :
else
    set t_Co=256
endif

" Color scheme
"set background=light
set background=dark
"colorscheme desert256
"colorscheme jellyx
colorscheme molokai
"colorscheme wombat256
"colorscheme zenburn

" Highlight current
set cursorline

" Enable syntax hl
syntax enable

" Keep the buffer around when you leave it
set hidden

" Font
"set guifont=Droid\ Sans\ Mono\ 10

" Show line number
set number

" Text options
set tabstop=4
set expandtab
set shiftwidth=4
"set shiftround
set softtabstop=4
set smarttab
set lbr
set textwidth=78

set matchpairs+=<:>

" Set 7 lines to the curors - when moving vertical..
set so=7

" Turn on WiLd menu
set wildmenu

" Always show current position
set ruler

"Change buffer - without saving
set hid

" The command bar is 2 high
set cmdheight=2

" Sets how many lines of history VIM her to remember
set history=400

"show matching bracets
"set showmatch

" Set backspace
set backspace=eol,start,indent

" Bbackspace and cursor keys wrap to
set whichwrap+=<,>,h,l

" Set magic on
set magic

" Always hide the statusline
set laststatus=2

function! CurDir()
   let curdir = substitute(getcwd(), '/home/xiaodong/', "~/", "g")
   return curdir
endfunction

" Format the statusline
set statusline=\ %F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L:%c

" From an idea by Michael Naumann
function! VisualSearch(direction) range
  let l:saved_reg = @"
  execute "normal! vgvy"
  let l:pattern = escape(@", '\\/.*$^~[]')
  let l:pattern = substitute(l:pattern, "\n$", "", "")
  if a:direction == 'b'
    execute "normal ?" . l:pattern . "^M"
  else
    execute "normal /" . l:pattern . "^M"
  endif
  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Basically you press * or # to search for the current selection !! Really useful
vnoremap <silent> * :call VisualSearch('f')<CR>
vnoremap <silent> # :call VisualSearch('b')<CR>

" Search options
set ignorecase
set incsearch
set hlsearch

set grepprg=ack
set grepformat=%f:%l:%m

" Turn off cursor blink
"set gcr=a:block-blinkon0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set mapleader
let mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

" Fast reloading of the .vimrc
map <leader>s :source ~/.vimrc<cr>

" Fast editing of .vimrc
map <leader>e :e! ~/.vimrc<cr>

" When .vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vimrc

" Tab
map <leader>tn :tabnew %<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" Grep
map <leader>n :cn<cr>
map <leader>p :cp<cr>
map <leader>c :botright cw 10<cr>

" Search
map <space> /
"map <c-space> ?

" Buffer
map <leader>bd :Bclose<cr>

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
" Enable filetype plugin
filetype on
filetype plugin on
filetype indent on

" Set to auto read when a file is changed from the outside
set autoread

" File encodings
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gb18030,default

" Turn backup off
set nobackup
set nowb
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Auto indent
set ai

" Smart indent
set si

" C-style indeting
set cindent

" Wrap lines
set wrap

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MISC
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hide the mouse pointer while typing
set mousehide

" Remove the Windows ^M
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

" Paste toggle - when pasting something in, don't indent.
set pastetoggle=<F3>

" Remove indenting on empty lines
map <F3> :%s/\s*$//g<cr>:noh<cr>''

" Super paste
"inoremap <C-v> <esc>:set paste<cr>mui<C-R>+<esc>mv'uV'v=:set nopaste<cr>

" Omni completion
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/config/plugin.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Abbrevs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/config/abbrevs.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Perl
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/config/perl.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LaTeX
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/config/latex.vim

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Funcs
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
source ~/.vim/config/funcs.vim

" Let's make it easy to edit this file (mnemonic for the key sequence is
" 'e'dit 'v'imrc)
nmap <silent> ,ev :e $MYVIMRC<cr>

" And to source this file as well (mnemonic for the key sequence is
" 's'ource 'v'imrc)
nmap <silent> ,sv :so $MYVIMRC<cr>
