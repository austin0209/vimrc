syntax on

set tabstop=4 softtabstop=4 "set tab-width to 4
set shiftwidth=4 "set width of >> to 4
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set undodir=~/.vim/undodir
set undofile
set incsearch
set list lcs=tab:\|\ "add indicators for tabs
set foldmethod=indent "set to fold by indents
set nofoldenable "do not fold by default
set noshowmode "do not show mode on bottom (not needed bc of airline)

"draw a grey bar after 80 characters
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'morhetz/gruvbox'
Plug 'mbbill/undotree'
Plug 'ycm-core/YouCompleteMe'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mkitt/tabline.vim'

call plug#end()

"code I found on reddit to remove the delay when leaving insert mode
augroup FastEscape
    autocmd!
    au InsertEnter * set timeoutlen=0
    au InsertLeave * set timeoutlen=1000
augroup END

colorscheme gruvbox
set background=dark

let mapleader = " "
let g:netrw_browse_split = 0
let g:netrw_banner = 0

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>t :tabnew<CR>:Ex<CR>
nnoremap <leader>e :hide<CR>
nnoremap <leader>n :tabnew<CR>
nnoremap <leader>c :tabclose<CR>
nnoremap <leader>v :vsp<CR>:wincmd l<CR>:CtrlP<CR>

nnoremap <silent> <Leader>gd :YcmCompleter GoTo<CR>

inoremap {<CR> {<CR>}<Esc>O

"taken from the vim community wiki to highlight trailing spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"highlight line when in insert mode
autocmd InsertEnter * set cul
autocmd InsertLeave * set nocul
