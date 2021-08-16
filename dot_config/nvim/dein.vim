let s:dein_dir = expand('$CACHE/dein')
let s:wd = fnamemodify(expand('<sfile>'), ':h')
let s:dein_toml_file = s:wd .'/dein.toml'
let s:dein_vim_toml_file = s:wd . '/dein.vim.toml'
if &runtimepath !~# '/dein.vim'

    let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

    if !isdirectory(s:dein_repo_dir)
        execute '!git clone https://github.com/Shougo/dein.vim ' . s:dein_repo_dir
    endif

    execute 'set runtimepath^=' . s:dein_repo_dir

endif

let g:dein#install_max_processes = 16


if dein#load_state(s:dein_dir)
 call dein#begin(s:dein_dir,expand('<sfile>'))
 call dein#load_toml(s:dein_toml_file)
 if !has('nvim')
 	call dein#load_toml(s:dein_vim_toml_file)
 endif
 call dein#end()
 call dein#save_state()
 if has('vim_starting') && dein#check_install()
     call dein#install()
 endif
endif
