if filereadable(expand('~/.config/nvim/lua/plugins.lua'))
	lua require('plugins')
elseif filereadable(expand('/etc/nixos/nvim/lua/plugins.lua'))
    lua assert(loadfile('/etc/nixos/nvim/lua/plugins.lua'))(true)
endif

if filereadable(expand('~/.config/nvim/lua/keymap.lua'))
	lua require('keymap')
elseif filereadable(expand('/etc/nixos/nvim/lua/keymap.lua'))
    lua assert(loadfile('/etc/nixos/nvim/lua/keymap.lua'))(true)
endif

let g:coq_settings = { 'auto_start': 'shut-up' }
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

let g:nvim_tree_hijack_netrw = 1


try
	colorscheme tokyodark
catch
	colorscheme calvera
endtry

if filereadable(expand('/etc/nixos/nvim/.vimrc'))
    source /etc/nixos/nvim/.vimrc
endif

if filereadable(expand('~/.vimrc'))
    source ~/.vimrc
endif

if filereadable(expand('~/.config/nvim/.vimrc'))
    source ~/.config/nvim/.vimrc
endif



