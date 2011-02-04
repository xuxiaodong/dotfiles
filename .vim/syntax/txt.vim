"Script_name: txt.vim
"$Author: guoyoooping@163.com $"
"$Date: 2010/01/09 11:59:09 $"
"$Name: txt_1_0_5 $"
"Description: syntax for plain/text.
"Language: text/plain :)
"Where_to_patch: $HOME/.vim/syntax or $VIMRUNTIME/syntax/
"Install_detail:
        "1. put this file in $HOME/.vim/syntax or $VIMRUNTIME/syntax/ 
        "2. Add the following line in your .vimrc:
        "syntax on "syntax highlighting on
        "let tlist_txt_settings = 'txt;c:content;f:figures;t:tables' "language definition for plain text
        "au BufRead,BufNewFile *.txt setlocal ft=txt "syntax highlight for txt.vim 

syn case ignore "set case insensitive.

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" key words definition.
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Keywords
syn keyword txtTodo todo fixme note debug comment notice
syn keyword txtError error bug caution dropped

"txtComment: Lines that start with '#'
"��#�Ŵ�ͷ����Ϊע���ı�
syn match   txtComment '^#.*$' contains=txtTodo

"txtTitle: Lines start with digit and '.'
"�����ı�: ǰ����������ո�,����.[����.]��ͷ, ���Ҹ����ﲻ����,.�����ȱ�����
syn match txtTitle "^\(\d\+\.\)\+\s*[^,����]\+$"

"txtTitle: Lines start with Chinese digit and '.'
"�����ı�: �������ּ�'.��'��ͷ���Ҹ��в���,.����������
syn match txtTitle "^\([һ�����������߰˾�ʮ][��.]\)\+\s*[^,����]\+$"

"txtTitle: Lines start with digit
"�����ı�: �����ִ�ͷ, �м��пո�, �����������. �Ҹ��в�����,.����������
syn match txtTitle "^\d\s\+.\+\s*[^,����]$"

"txtList: Lines start with space and then '-+*.'
"�б��ı�: ����ո��ͷ, ���һ��[-+*.]
syn match txtList    '^\s*[-+*.] [^ ]'me=e-1

"txtList: Lines start with space and then digit
"�б��ı�: ����ո��ͷ, ���һ��(����) �� (��ĸ) ��ͷ���ı���
syn match txtList    '^\s*(\=\([0-9]\+\|[a-zA-Z]\))'

"txtList: Lines start with space and then digit and '.'
"�б��ı�: ����һ���ո��ͷ, [����.]��ͷ, ������ܸ�����(�ų���5.5��������
"�������б�) 
syn match txtList "^\s\+\d\+\.\d\@!"

"txtApostrophe: text in the apostrophe
"������������
syn match   txtApostrophe  '\'[^\']\+\''hs=s+1,he=e-1

"txtQuotes: text in the quotoes
"˫����������, ����ȫ�ǰ��, ���÷�Χ�������
syn match   txtQuotes     '["��][^"��]\+\(\n\)\=[^"��]*["��]'hs=s+1,he=e-1

"txtParentesis: text in the parentesis
"����������, ��������(Ϊ�˺�txtList����), ���÷�Χ�������
syn match   txtParentesis "[(��][^)��]\+\(\n\)\=[^)��]*[)��]" contains=txtUrl

"txtBrackets: text in the brackets
"��������������, ���÷�Χ�������, ����������������
syn match txtBrackets     '<[^<]\+\(\n\)\=[^<]*>'hs=s+1,he=e-1 contains=txtUrl
syn match txtBrackets     '\[[^\[]\+\(\n\)\=[^\[]*\]'hs=s+1,he=e-1 contains=txtUrl
syn region txtBrackets    matchgroup=txtOperator start="{"        end="}" contains=txtUrl

"link url
syn match txtUrl '\<[A-Za-z0-9_.-]\+@\([A-Za-z0-9_-]\+\.\)\+[A-Za-z]\{2,4}\>\(?[A-Za-z0-9%&=+.,@*_-]\+\)\='
syn match txtUrl   '\<\(\(https\=\|ftp\|news\|telnet\|gopher\|wais\)://\([A-Za-z0-9._-]\+\(:[^ @]*\)\=@\)\=\|\(www[23]\=\.\|ftp\.\)\)[A-Za-z0-9%._/~:,=$@-]\+\>/*\(?[A-Za-z0-9/%&=+.,@*_-]\+\)\=\(#[A-Za-z0-9%._-]\+\)\='

"email text:
syn match txtEmailMsg '^\s*\(From\|De\|Sent\|To\|Para\|Date\|Data\|Assunto\|Subject\):.*'
syn match txtEmailQuote '^\(>\($\| \)\)\+'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"��html�ı�
"syn match   txtBold       '\*[^*[:blank:]].\{-}\*'hs=s+1,he=e-1
"syn match txtItalic "^\s\+.\+$" "б���ı�

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" color definitions (specific)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"hi txtUrl        term=bold        cterm=bold  ctermfg=blue    gui=underline     guifg=blue
hi link txtUrl      Underlined"ModeMsg"Tabline"PmenuSbar
hi link txtTitle      Title"ModeMsg"Tabline"PmenuSbar
hi link txtList         SignColumn"Pmenu"DiffText"Statement
hi link txtComment      Special "Comment
hi link txtQuotes       MoreMsg"String
hi link txtApostrophe    MoreMsg"Special
hi link txtParentesis   Special "Comment
hi link txtBrackets  Special
hi link txtError  ErrorMsg
hi link txtTodo  Todo
hi link txtEmailMsg     Structure
hi link txtEmailQuote   Structure

let b:current_syntax = 'txt'
" vim:tw=0:et
