" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Initialize plugin system
call plug#end()




" Custom
let mapleader=" "
set number
set colorcolumn=80
" sync clipboard with unnamed register
set clipboard+=unnamedplus

map <leader>t :tabnew<CR>
nnoremap H :tabprevious<CR>
nnoremap L :tabnext<CR>

set suffixesadd=.js,.vue

" because I hit shift so often by accident
command W :w

" Plug 'flazz/vim-colorschemes'
" set background=light
colorscheme gruvbox
set termguicolors

" Plug 'ntpeters/vim-better-whitespace'
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1

" Plug 'nathanaelkane/vim-indent-guides'
set ts=2 sw=2 et
let g:indent_guides_enable_on_vim_startup = 1

" Plug 'junegunn/fzf.vim'
map <leader>f :Files<CR>
map <leader>g :GFiles<CR>
map <leader>h :History<CR>
map <leader>w :Windows<CR>

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
nmap <space>e :CocCommand explorer<CR>
nnoremap <silent> <leader>n  :<C-u>CocList --normal gstatus<CR>
