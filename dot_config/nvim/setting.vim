set number
set title
set showmatch
set hlsearch
set incsearch
set belloff=all
syntax on
set tabstop=2
set smartindent
set clipboard=unnamedplus
set noswapfile
let g:netrw_liststyle= 3
set mouse=a
set shiftwidth=2
set noexpandtab
set hidden
set completeopt=menuone
set nowrap
set nofixeol
set signcolumn=yes
set list
set listchars=tab:>-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
set statusline=%<%f\ %h%m%r%{fugitive#statusline()}%=%-14.(%l,%c%V%)\ %P
set foldmethod=syntax
set foldlevel=100
set textwidth=300
set ignorecase
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c

let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*ts,*.tsx,*.less,*.md,*.json,*.graphql,*.vue,*.{yaml,yml},*.css,*.scss,*.html,.postcssrc,.posthtmlrc :Prettier
autocmd BufRead,BufNewFile .postcssrc,.posthtmlrc            set filetype=json
autocmd BufRead,BufNewFile .ansible-lint set filetype=yaml
let g:deoplete#enable_at_startup = 1
let g:rainbow_active = 1
let g:loaded_netrw       = 1
let g:loaded_netrwPlugin = 1
let g:neoterm_default_mod = 'tab'
let g:neoterm_autoinsert= 1
let g:python3_host_prog= "/usr/bin/python3"
let g:python_host_prog=""

let s:script_dir = expand('<sfile>:p:h') 
let g:neosnippet#snippets_directory=s:script_dir . '/snippets'
let g:previm_open_cmd='xdg-open'
let g:cursorhold_updatetime = 100
let g:executable_xvkbd=executable('xvkbd')
let g:on_microsoft=system('uname -a | grep -i microsoft') != ""
filetype plugin indent on
syntax enable

if g:on_microsoft
    augroup myYank
        autocmd!
        autocmd TextYankPost * :call system('clip.exe', @")
    augroup END
endif
colorscheme gruvbox
hi NonText ctermfg=12 guifg=#2D3640
