" Disable trailing whitespace check in Markdown files.
autocmd FileType * unlet! g:airline#extensions#whitespace#checks
autocmd FileType markdown let g:airline#extensions#whitespace#checks = [ 'indent' ]
autocmd FileType markdown let g:airline#extensions#whitespace#show_message = 0

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init()
  autocmd FileType text         call pencil#init()
augroup END

set wrap
