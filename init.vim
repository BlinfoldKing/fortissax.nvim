let g:coq_settings = { 'auto_start': 'shut-up' }

lua require('plugins')
lua require('keymap')

set hidden
set number
set relativenumber
set cursorline
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a
set colorcolumn=80
set background=dark
set t_Co=256
set encoding=UTF-8
set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=2

syntax on

set termguicolors
colorscheme sonokai


augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END
