function! spell#Check(forward)
  if !&l:spell
    setlocal spell
  endif

  let motion = (a:forward) ? ']' : '['
  execute 'normal!' motion . 's'
endfunction
