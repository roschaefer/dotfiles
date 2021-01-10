" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-git'
      \]


call plug#begin('~/.local/share/nvim/plugged')

Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'flazz/vim-colorschemes'
Plug 'tpope/vim-unimpaired'
Plug 'justinmk/vim-sneak'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

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
map <leader>m :Marks<CR>

" Plug 'neoclide/coc.nvim', {'branch': 'release'}
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
command! -nargs=0 Format :call CocAction('format')
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>

nnoremap <silent> <leader>y  :<C-u>CocList -A --normal yank<cr>
nmap <leader>e :CocCommand explorer<CR>
nnoremap <silent> <leader>n  :<C-u>CocList --normal gstatus<CR>
