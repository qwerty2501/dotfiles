let $CACHE = empty($XDG_CACHE_HOME) ? expand('$HOME/.cache') : $XDG_CACHE_HOME
let $CONFIG = empty($XDG_CONFIG_HOME) ? expand('$HOME/.config') : $XDG_CONFIG_HOME 
let $DATA = empty($XDG_DATA_HOME) ? expand('$HOME/.local/share') : $XDG_DATA_HOME 
let $BASH_ENV = expand('$HOME/.bash_aliases')
let s:script_dir = expand('<sfile>:p:h') 
set nocompatible

execute 'source' . s:script_dir . '/dein.vim'
execute 'source' . s:script_dir . '/setting.vim'
execute 'source' . s:script_dir . '/fern.vim'
execute 'source' . s:script_dir . '/keymap.vim'
execute 'source' . s:script_dir . '/lsp.vim'
execute 'source' . s:script_dir . '/denite.vim'




