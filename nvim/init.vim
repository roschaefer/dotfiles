" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'

let g:coc_node_path = '/home/robert/.asdf/shims/node'
let g:coc_global_extensions = [
      \'coc-explorer',
      \'coc-git',
      \'coc-tsserver',
      \'coc-yank',
      \]

call plug#begin('~/.local/share/nvim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'preservim/nerdcommenter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'flazz/vim-colorschemes'
Plug 'ntpeters/vim-better-whitespace'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'justinmk/vim-sneak'
Plug 'machakann/vim-sandwich'
Plug 'sebdah/vim-delve'
Plug 'neoclide/coc.nvim', {'branch': 'master', 'do': 'yarn install --frozen-lockfile'}

" Initialize plugin system
call plug#end()

command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)


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

colorscheme gruvbox
set background=dark
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
map <leader>p :GGrep<CR>
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
nnoremap <leader>e :CocCommand explorer<CR>
nnoremap <silent> <leader>n  :<C-u>CocList --normal gstatus<CR>


autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
let g:go_fmt_command = "goimports"
