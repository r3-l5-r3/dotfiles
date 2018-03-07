filetype plugin on
syntax on
set number
set clipboard=unnamedplus
autocmd FileType java set tabstop=4|set shiftwidth=4|set expandtab
autocmd FileType arduino set tabstop=2|set shiftwidth=2|set expandtab
autocmd FileType tex setlocal spell spelllang=en_us
autocmd FileType plaintext setlocal spell spelllang=en_us
augroup resCur
	autocmd!
	autocmd BufReadPost * call setpos(".", getpos("'\""))
augroup END

" Call vim-plug plugin manager
call plug#begin('~/.vim/plugged')

" fetch vim-processing plugin
Plug 'sophacles/vim-processing'

" End call for vim-plug, initialise
call plug#end()

" Syntastic recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Indentline settings
let g:indentLine_char = '│'

" Lightline settings
set laststatus=2
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'jellybeans',
      \ }

" Supertab settings
let g:SuperTabMappingForward = '<s-tab>'
let g:SuperTabMappingBackward = '<s-c-tab>'

" Nvim-R settings
let g:R_in_buffer = 0
let g:R_term = "termite"
let g:R_term_cmd = "termite -e R"
