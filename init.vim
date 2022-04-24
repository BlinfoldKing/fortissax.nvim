let g:coq_settings = { 'auto_start': 'shut-up' }

lua require('plugins')
lua require('keymap')

syntax on

set termguicolors

augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

tnoremap <Esc> <C-\><C-n>

set hidden
set nu
set cursorline
set splitbelow
set splitright
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set mouse=a
set background=dark
set t_Co=256
set encoding=UTF-8
set foldmethod=indent
set foldnestmax=10
set nofoldenable

if filereadable(expand('~/.config/nvim/.vimrc'))
    source ~/.config/nvim/.vimrc
endif

if filereadable(expand('~/.vimrc'))
    source ~/.vimrc
endif

if filereadable(expand('/etc/nixos/nvim/.vimrc'))
    source /etc/nixos/nvim/.vimrc
endif

try
	colorscheme tokyodark
catch
	colorscheme calvera
endtry
