set autoindent
set cindent
set number

set tabstop=4
set shiftwidth=4

let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 40
map <F4> : TlistToggle<cr>
map <F8> : !/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
