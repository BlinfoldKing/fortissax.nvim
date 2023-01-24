if filereadable(expand('~/.config/nvim/lua/plugins.lua'))
	lua require('plugins')
elseif filereadable(expand('/etc/nixos/nvim/lua/plugins.lua'))
    lua assert(loadfile('/etc/nixos/nvim/lua/plugins.lua'))(true)
elseif filereadable(expand('C:\\Users\\ganes\\AppData\\Local\\nvim\\lua\\plugins.lua'))
    lua assert(loadfile('C:\\Users\\ganes\\AppData\\Local\\nvim\\lua\\plugins.lua'))(false, true)
endif

if filereadable(expand('~/.config/nvim/lua/keymap.lua'))
	lua require('keymap')
elseif filereadable(expand('/etc/nixos/nvim/lua/keymap.lua'))
    lua assert(loadfile('/etc/nixos/nvim/lua/keymap.lua'))(true)
elseif filereadable(expand('C:\\Users\\ganes\\AppData\\Local\\nvim\\lua\\keymap.lua'))
    lua assert(loadfile('C:\\Users\\ganes\\AppData\\Local\\nvim\\lua\\keymap.lua'))(false, true)
endif

let g:coq_settings = { 'auto_start': 'shut-up' }
syntax on

set termguicolors

tnoremap <Esc> <C-\><C-n>

set hidden
set nu
set nuw=6
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

xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

try
    let g:sonokai_style="andromeda"
	colorscheme sonokai
catch
	colorscheme ron
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

function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost * FormatWrite
augroup END

let g:blamer_enabled = 1
au BufNewFile,BufRead *.wgsl set filetype=wgsl
