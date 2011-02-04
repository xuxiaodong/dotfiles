" make tab in v mode ident code
vmap <tab> >gv
vmap <s-tab> <gv

" make tab in normal mode ident code
nmap <tab> I<tab><esc>
nmap <s-tab> ^i<bs><esc>

" comment/uncomment blocks of code (in vmode)
vmap _c :s/^/#/gi<Enter>
vmap _C :s/^#//gi<Enter>

" my perl includes pod
let perl_include_pod = 1

" syntax color complex things like @{${"foo"}}
let perl_extended_vars = 1

" this is for vertical indenting
"set list
"set listchars=tab:| 

" check perl code with :make
autocmd FileType perl set makeprg=perl\ -c\ %\ $*
autocmd FileType perl set errorformat=%f:%l:%m
autocmd FileType perl set autowrite

" tidy selected lines (or entire file) with _t:
nnoremap <silent> _t :%!perltidy -q<Enter>
vnoremap <silent> _t :!perltidy -q<Enter>

au Filetype perl :set equalprg=perltidy

" perldoc integration
autocmd BufNewFile,BufRead *.p? map <F1> :Perldoc<cword><CR>
autocmd BufNewFile,BufRead *.p? setf perl
autocmd BufNewFile,BufRead *.p? let g:perldoc_program='/usr/bin/perldoc -f'
autocmd BufNewFile,BufRead *.p? source /home/xiaodong/.vim/ftplugin/perl_doc.vim

" perl file header
autocmd BufNewFile  *.pl        0r ~/.vim/perl/header.pl

" comment
function! _perl_comment()
    let l = getline('.')
    if l =~ '^#' 
        exec 's/^#//g'
    else
        exec 's/^/#/g'
    endif
endfunction

vmap ,c :call _perl_comment()<CR>

" Pressing K while on a keyword will bring up perldoc
autocmd FileType perl :noremap K :!perldoc <cword> <bar><bar> perldoc -f <cword><cr>

map ,t :!pltags %<CR>
