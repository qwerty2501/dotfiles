augroup my-glyph-palette
  autocmd! *
  autocmd FileType fern call glyph_palette#apply()
  autocmd FileType nerdtree,startify call glyph_palette#apply()
augroup END

augroup my-fern-init
    autocmd!
    autocmd VimEnter * ++nested Fern . -stay -reveal=% -drawer -toggle
augroup END

let g:fern#renderer = "nerdfont"


