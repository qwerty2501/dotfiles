let mapleader="\<Space>"
noremap <silent><Leader>n :Fern . -drawer<CR>
nnoremap <silent><Leader>[ :Ttoggle<CR>
nnoremap <silent><Leader><Leader> :Denite file_rec<CR>
nnoremap <silent><Leader>c :T cd %:p:h<CR>
tnoremap <silent><C-w> <C-\><C-n><C-w>
tnoremap <silent><C-q> <C-\><C-n>
tmap <silent><C-d> <C-d><C-\><C-n><CR>:q<CR>
nnoremap <silent><Leader>l "lyiW:e <C-R>l<CR>
nmap <S-O> o<ESC>

imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB>  pumvisible() ? "\<C-p>" : "\<S-TAB>"
imap <expr><TAB>
 \ pumvisible() ? "\<C-n>" :
 \ neosnippet#expandable_or_jumpable() ?
 \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"


if g:executable_xvkbd && !g:on_microsoft
	 inoremap <silent><Esc> <Esc>:call system('xvkbd -text "\[Control]\[Shift]\[Delete]" > /dev/null 2>&1 ')<CR>
	 inoremap <silent><C-c> <Esc>:call system('xvkbd -text "\[Control]\[Shift]\[Delete]" > /dev/null 2>&1 ')<CR>
endif
