set shell=/bin/zsh
set shiftwidth=2
set tabstop=2
set expandtab
set textwidth=0
set autoindent
set hlsearch
set clipboard=unnamed
syntax on
set number
set title
set scrolloff=10
set cursorline

let $LANG='en_US.UTF-8'

"""" Vim Plugin Manager
call plug#begin()

Plug 'preservim/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'shaunsingh/nord.nvim'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'lukas-reineke/indent-blankline.nvim'
" Plug 'Mofiqul/dracula.nvim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

"""" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

"""" To turn on line highlighting by default (vim-gitgutter)
" let g:gitgutter_highlight_lines = 1

"""" if you don't set this option, this color might not correct
" set termguicolors

"""" Color Schemes
" colorscheme nord
colorscheme dracula

" latte, frappe, macchiato, mocha
" let g:catppuccin_flavour = "macchiato
" colorscheme catppuccin

"""" Configures
lua <<EOF
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
  },
}

-- "indent blankline"
vim.opt.list = true
vim.opt.listchars:append("space:⋅")

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}
EOF

" coc.nvim
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackspace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
