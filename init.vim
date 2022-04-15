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

source ~/.config/nvim/.vimrc
