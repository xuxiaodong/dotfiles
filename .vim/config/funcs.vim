" perl: add 'use' statement
"
" make sure you have
"   setlocal iskeyword=48-57,_,A-Z,a-z,:
" so colons are recognized as part of a keyword

function! PerlAddUseStatement()
    let s:package = input('Package? ', expand('<cword>'))
    " skip if that use statement already exists
    if (search('^use\s\+'.s:package, 'bnw') == 0)
        " below the last use statement, except for some special cases
        let s:line = search('^use\s\+\(constant\|strict\|warnings\|parent\|base\|5\)\@!','bnw')
        " otherwise, below the ABSTRACT (see Dist::Zilla)
        if (s:line == 0)
            let s:line = search('^# ABSTRACT','bnw')
        endif
        " otherwise, below the package statement
        if (s:line == 0)
            let s:line = search('^package\s\+','bnw')
        endif
        " if there isn't a package statement either, put it below
        " the last use statement, no matter what it is
        if (s:line == 0)
            let s:line = search('^use\s\+','bnw')
        endif
        " if there are no package or use statements, it might be a
        " script; put it below the shebang line
        if (s:line == 0)
            let s:line = search('^#!','bnw')
        endif
        " if s:line still is 0, it just goes at the top
        call append(s:line, 'use ' . s:package . ';')
    endif
endfunction

map ,us :<C-u>call PerlAddUseStatement()<CR>
