function! spell#Check(direction)
  if !&l:spell
    setlocal spell
  endif
  if a:direction ==# 'forward'
    normal! ]s
  elseif a:direction ==# 'backward'
    normal! [s
  endif
endfunction
