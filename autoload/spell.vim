function! spell#Check(forward)
  if !&l:spell
    setlocal spell
  endif

  execute 'normal!' a:forward ? ']s' : '[s'
endfunction
