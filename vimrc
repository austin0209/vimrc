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
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'mkitt/tabline.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'OmniSharp/omnisharp-vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'tpope/vim-dispatch'
Plug 'dense-analysis/ale'
Plug 'preservim/nerdcommenter'
Plug 'editorconfig/editorconfig-vim'

call plug#end()

let g:coc_global_extensions = ["coc-clangd", "coc-html", "coc-python", "coc-json", "coc-tsserver"]

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

"taken from coc.nvim wiki
"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :

"use tab and shift tab to navigate completion list
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"      \ coc#refresh()
"use <cr> to confirm completion
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
"close preview window when completion is done
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

"uncomment for omnisharp bindings/config
"source $HOME\AppData\Local\nvim\omnisharp.vim