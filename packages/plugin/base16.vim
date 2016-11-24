" Example: Base16Highlight myGroup fg=blue bg=green bold italic
" The first argument is a group name.  The remaining arguments may start with
" fg= bg= or sp= If they don't, they are treated as atrtibutes like bold
" italic underline. You don't need to comma-separate attributes, but you may
" if you'd like.
"
" TODO: Implement completion.
" It would be nice to complete highlight groups, and attributes, and base16
" colors.
command! -bang -nargs=+ Base16Highlight call s:Base16Highlight(<q-bang>=='!', <f-args>)
