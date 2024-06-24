"set runtimepath^=~/.vim runtimepath+=~/.vim/after
"let &packpath = &runtimepath
"source ~/.vimrc

autocmd BufWritePre * lua vim.lsp.buf.format()

let mapleader = "\<Space>"
filetype plugin indent on
syntax on
call plug#begin('~/.vim/plugged')
Plug 'folke/tokyonight.nvim'
" Fuzzy finder
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'neovim/nvim-lspconfig'
Plug 'simrat39/rust-tools.nvim'
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'airblade/vim-rooter'
Plug 'preservim/nerdtree'
Plug 'whonore/Coqtail'

call plug#end()

colorscheme tokyonight


" Open hotkeys
vnoremap <C-C> "+y

nnoremap <silent> <Leader>ag :Ag <C-R><C-W><CR>

" Quick save config
nnoremap <Leader>sv :source $MYVIMRC<CR>

" tell it to use an undo file
set undofile
" set a directory to store the undo history
set undodir=$HOME/.undodir

" Quick-save
nmap <leader>w :w<CR>

" Quick-exit
nmap <leader>q :q!<CR>
nmap <leader>qa :qa!<CR>

" Quick delete buffer
nmap <leader>bd :bd<CR>

" Quick json format
nmap <leader>jq :%!jq '.'<CR>

" Coq shortcuts
" From https://github.com/whonore/Coqtail
nmap <leader>cj :CoqNext<CR>
nmap <leader>ck :CoqUndo<CR>

" <leader><leader> toggles between buffers
nnoremap <leader><leader> <c-^>

nmap <leader>co :e ~/.config/nvim/bindings.vim<CR>

" Line number
set number
set autoread

" autofix with eslint
let g:syntastic_typescript_tslint_args= ['--fix']
function! SyntasticCheckHook(errors)
  checktime
endfunction

" autofix with eslint
let g:syntastic_javascript_eslint_args = ['--fix']
function! SyntasticCheckHook(errors)
  checktime
endfunction
    
" color theme
let g:solarized_termcolors=256
set background=dark

" NERDTree shortcut
let mapleader = ","
nmap <leader>ne :Neotree<cr>

nmap <leader>s :Ag<cr>

" rust formatter
let g:rustfmt_autosave = 1

" relative line numbers
set relativenumber

" tabbing
set shiftwidth=2
set softtabstop=2
set expandtab

" center cursor vertically when scrolling
set so=999


