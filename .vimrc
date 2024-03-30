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

"Go
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ray-x/go.nvim'
Plug 'ray-x/guihua.lua'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'


call plug#end()

lua << EOF
local rt = require("rust-tools")

rt.setup({
 server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set("n", "<C-c>", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<C-b>", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})

EOF

lua << EOF
require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "gopls" },
}
EOF

lua << EOF
require'cmp'.setup {
  sources = {
    { name = 'nvim_lsp' }
  }
}

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
require('go').setup({
  -- other setups ....
  lsp_cfg = {
    capabilities = capabilities,
    -- other setups
  },
})
require("go.format").goimport()  -- goimport + gofmt

local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').gofmt()
  end,
  group = format_sync_grp,
})

local format_sync_grp = vim.api.nvim_create_augroup("GoImport", {})
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
   require('go.format').goimport()
  end,
  group = format_sync_grp,
})


local cfg = require'go.lsp'.config() -- config() return the go.nvim gopls setup

require('lspconfig').gopls.setup(cfg)
EOF



colorscheme tokyonight


" Open hotkeys
map <C-p> :Files<CR>
vnoremap <C-C> "+y
nmap <leader>; :Buffers<CR>

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
nmap <leader>q :q<CR>
nmap <leader>q! :q!<CR>

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

" Line number
set number
set autoread

let g:syntastic_typescript_checkers = ['tslint', 'tsc']
let g:syntastic_rust_checkers = ['']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
let g:haskell_indent_if = 3
let g:prettier#autoformat = 1
let g:prettier#autoformat_require_pragma = 0
let g:syntastic_python_checkers=['']

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
nmap <leader>ne :NERDTree<cr>

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

let g:python3_host_prog = "/usr/bin/python3"


