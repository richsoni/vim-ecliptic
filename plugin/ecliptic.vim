"let  ecliptic.vim - intuitive clipboard integration
" Maintainer:   Rich Soni <http://richsoni.com/>
" Version: 0.2.1

 if exists("g:loaded_ecliptic") || v:version < 700 || &cp
   finish
 endif
 let g:loaded_ecliptic = 1

function! s:EclipticPaste(type, GNoG)
  let paste_command = 'p'
  let g_command = ''
  if a:type ==# 'v'
    normal! `<v`>"+p
  elseif a:type ==# 'V'
    normal! '<V`>"+p
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

function! s:EclipticDelete(type)
  if a:type ==# 'v'
    normal! `<v`>"+d
  elseif a:type ==# 'char'
    normal! `[v`]"+d
  elseif a:type ==# 'linewise'
    normal! "+dd
  elseif a:type ==# 'V'
    normal! `<V`>"+d
  elseif a:type ==# ''
    normal! `<`>"+d
  else
    return
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


if !exists("g:ecliptic_prefix")
  let g:ecliptic_prefix = 'c'
endif

vnoremap <silent> <Plug>EclipticVY      :call <SID>EclipticCopy(visualmode())<cr>
vnoremap <silent> <Plug>EclipticVYLine  :call <SID>EclipticCopy('V')<cr>
nnoremap <silent> <Plug>EclipticYY      :call <SID>EclipticCopy('linewise')<cr>
execute 'nmap '.g:ecliptic_prefix.'yy <Plug>EclipticYY'
execute 'nmap '.g:ecliptic_prefix.'y :set operatorfunc=<SID>EclipticCopy<cr>g@'
execute 'nmap '.g:ecliptic_prefix.'Y  <Plug>EclipticYY'
execute 'vmap '.g:ecliptic_prefix.'y <Plug>EclipticVY'
execute 'vmap '.g:ecliptic_prefix.'Y <Plug>EclipticVYLine'

vnoremap <silent> <Plug>ElipticVD      :call <SID>EclipticDelete(visualmode())<cr>'
vnoremap <silent> <Plug>ElipticVDLine  :call <SID>EclipticDelete('V')<cr>'
nnoremap <silent> <Plug>ElipticDD      :call <SID>EclipticDelete('linewise')<cr>'
execute 'nmap '.g:ecliptic_prefix.'d :set operatorfunc=<SID>EclipticDelete<cr>g@'
execute 'nmap '.g:ecliptic_prefix.'dd <Plug>EclipticDD'
execute 'nmap '.g:ecliptic_prefix.'D  <Plug>EclipticDD'
execute 'vmap '.g:ecliptic_prefix.'d <Plug>EclipticVD'
execute 'vmap '.g:ecliptic_prefix.'D <Plug>EclipticVDLine'

nnoremap <silent> <Plug>EclipticPBefore :call <SID>EclipticPaste('before', 'noG')<cr>
nnoremap <silent> <Plug>EclipticPAfter  :call <SID>EclipticPaste('below', 'noG')<cr>
vnoremap <silent> <Plug>EclipticPVisual :call <SID>EclipticPaste(visualmode(), 'noG')<cr>
nnoremap <silent> <Plug>EclipticGPBefore :call <SID>EclipticPaste('before', 'G')<cr>
nnoremap <silent> <Plug>EclipticGPAfter :call <SID>EclipticPaste('below', 'G')<cr>
execute 'nmap '.g:ecliptic_prefix.'p <Plug>EclipticPAfter'
execute 'nmap '.g:ecliptic_prefix.'P <Plug>EclipticPBefore'
execute 'nmap '.g:ecliptic_prefix.'gp <Plug>EclipticGPAfter'
execute 'nmap '.g:ecliptic_prefix.'gP <Plug>EclipticGPBefore'
execute 'vmap '.g:ecliptic_prefix.'p <Plug>EclipticPVisual'
