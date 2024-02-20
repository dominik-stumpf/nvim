au FileType netrw nmap <buffer> h -
au FileType netrw nmap <buffer> l <cr>
let g:netrw_list_hide= '.*\.swp$,.DS_Store,*/tmp/*,*.so,*.swp,*.zip,*.git,^\.\.\=/\=$'
let g:netrw_keepdir = 0
let g:netrw_banner = 0
let g:netrw_localcopydircmd = 'cp -r'
hi! link netrwMarkFile Search

function! NetrwRemoveRecursive()
  if &filetype ==# 'netrw'
    cnoremap <buffer> <CR> /usr/bin/trash-put<CR>
    normal mu
    normal mf
    
    try
      normal mx
    catch
      echo "Canceled"
    endtry

    cunmap <buffer> <CR>
  endif
endfunction

nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
