function! s:SetSpell() abort
  if !&l:spell
    setlocal spell
  endif
endfunction

function! spell#Move(forward) abort
  call s:SetSpell()
  execute 'normal!' a:forward ? ']s' : '[s'
endfunction

function! spell#Check() abort
  call s:SetSpell()
  execute 'normal!' v:count ? v:count . 'z=' : 'z='
endfunction
