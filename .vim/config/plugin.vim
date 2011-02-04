""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin configuration
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Minibuffer
let g:miniBufExplModSelTarget=1
let g:miniBufExplorerMoreThanOne=2
let g:miniBufExplUseSingleClick=1
let g:miniBufExplMapWindowNavVim=1
let g:miniBufExplMaxSize = 1
"let g:miniBufExplVSplit=20
let g:miniBufExplSplitBelow=0
let g:bufExplorerSortBy="name"
map <c-w><c-t> :WMToggle<cr>
autocmd BufRead,BufNew :call UMiniBufExplorer

" Closetag
let g:closetag_html_style=1 
source ~/.vim/scripts/closetag.vim 
au Filetype html,xml,xsl source ~/.vim/scripts/closetag.vim 

" NERD tree
let g:NERDTreeWinSize=25
let g:NERDTreeShowHidden=1
"let g:NERDTreeChDirMode=2
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd p

" Markdown syntax
augroup mkd
    autocmd BufRead *.markdown set ai formatoptions=tcroqn2 comments=n:>
augroup END

" TwitVim
"let twitvim_login = "xuxiaodong:l9x8h2#d"

" Mail
"autocmd BufRead ~/.mutt/temp/mutt*   :source ~/.vim/config/mail.vim

" Pydiction
"let g:pydiction_location = "~/.vim/ftplugin/pydiction/complete-dict"

" Plain Text Browser

" language definition for plain text
"let tlist_txt_settings = 'txt;c:content;f:figures;t:tables' 
" syntax highlight for txt.vim 
"au BufRead,BufNewFile *.txt setlocal ft=txt 
