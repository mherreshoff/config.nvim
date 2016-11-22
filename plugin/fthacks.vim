" TODO: Turn these into ftplugins.
augroup filetypes
	autocmd!
	autocmd BufNewFile,BufRead *.cabal set et sw=2 ts=2 sts=2
	autocmd BufNewFile,BufRead *.rkt set et sw=2 ts=2 sts=2
	autocmd BufNewFile,BufRead *.lean setf lean
	autocmd BufNewFile,BufRead *.hlean setf lean
augroup end
