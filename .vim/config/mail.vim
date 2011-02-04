" To use with Mutt, just put this line your ~/.vimrc :
"   autocmd BufRead ~/.mutt/temp/mutt*      :source ~/.vim/mail

" * <F1> to re-format the current paragraph correctly
" * <F2> to format a line which is too long, and go to the next line
" * <F3> to merge the previous line with the current one, with a correct
"        formatting (sometimes useful associated with <F2>)

" turn on spell checking
set spell

" reformat paragraphs
nmap    <F1>    gqap
nmap    <F2>    gqqj
nmap    <F3>    kgqj
map!    <F1>    <ESC>gqapi
map!    <F2>    <ESC>gqqji
map!    <F3>    <ESC>kgqji
