"let  ecliptic.vim - intuitive clipboard integration
" Maintainer:   Rich Soni <http://richsoni.com/>

 " if exists("g:loaded_ecliptic") || v:version < 700 || &cp
 "   finish
 " endif
 " let g:loaded_ecliptic = 1

function! s:EclipticPaste(type, GNoG)
  let paste_command = 'p'
  let g_command = ''
  if a:type ==# 'v'
    normal! `<v`>"+p
  else
    if a:type ==# 'before'
      let paste_command = 'P'
    endif
    if a:GNoG ==# 'G'
      let g_command = 'g'
    endif
    set paste
    exe('normal! "+'.g_command.paste_command)
    set nopaste
  endif
endfunction

function! s:EclipticCopy(type)
  if a:type ==# 'v'
    normal! `<v`>"+y
  elseif a:type ==# 'char'
    normal! `[v`]"+y
  elseif a:type ==# 'linewise'
    normal! "+yy
  elseif a:type ==# 'V'
    normal! `<V`>"+y
  elseif a:type ==# ''
    normal! `<`>"+y
  else
    return
  endif
endfunction

nnoremap <silent> <Plug>EclipticPBefore :call <SID>EclipticPaste('before', 'noG')<cr>
nnoremap <silent> <Plug>EclipticPAfter  :call <SID>EclipticPaste('below', 'noG')<cr>
vnoremap <silent> <Plug>EclipticPVisual :call <SID>EclipticPaste(visualmode(), 'noG')<cr>
nnoremap <silent> <Plug>EclipticGPBefore :call <SID>EclipticPaste('before', 'G')<cr>
nnoremap <silent> <Plug>EclipticGPAfter :call <SID>EclipticPaste('below', 'G')<cr>
vnoremap <silent> <Plug>EclipticVY      :call <SID>EclipticCopy(visualmode())<cr>
vnoremap <silent> <Plug>EclipticVYLine  :call <SID>EclipticCopy('V')<cr>
nnoremap <silent> <Plug>EclipticYY      :call <SID>EclipticCopy('linewise')<cr>

nmap cy :set operatorfunc=<SID>EclipticCopy<cr>g@
nmap cyy <Plug>EclipticYY
nmap cY  <Plug>EclipticYY
vmap cy <Plug>EclipticVY
vmap cY <Plug>EclipticVYLine

nmap cp <Plug>EclipticPAfter
nmap cP <Plug>EclipticPBefore
nmap cgp <Plug>EclipticGPAfter
nmap cgP <Plug>EclipticGPBefore
vmap cp <Plug>EclipticPVisual
