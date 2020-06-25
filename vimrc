syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:netrw_browse_split = 0
"let g:netrw_winsize = 25
let g:netrw_banner = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>e :hide<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>c :tabclose<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>

inoremap {<CR> {<CR>}<Esc>O<Tab>

