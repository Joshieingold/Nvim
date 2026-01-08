call plug#begin()
" Defaults
Plug 'tpope/vim-sensible'
" Colors
Plug 'ghifarit53/tokyonight-vim'
" Fuzzy Finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" Completion Suggestions
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Autopairs
Plug 'jiangmiao/auto-pairs'
call plug#end()

" Nice Defaults
syntax enable
set background=dark
set number
set scrolloff=8
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set autoindent
set laststatus=2
set showcmd
set wildmenu
set relativenumber
set nohlsearch
set incsearch
set termguicolors
set scrolloff=8
set signcolumn=yes
set updatetime=50
set colorcolumn=80

" Syntax Hightlights
hi CocErrorHighlight    gui=underline guifg=Red
hi CocWarningHighlight  gui=underline guifg=Orange
hi CocInfoHighlight     gui=underline guifg=Blue
hi CocHintHighlight     gui=underline guifg=Green

" Keymaps
let mapleader = " "
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz
nnoremap <leader>pv :Ex<CR>

" Colors
set termguicolors
let g:tokyonight_style = 'night'
let g:tokyonight_enable_italic = 1
colorscheme tokyonight

" Fuzzy Finder
nnoremap <leader>pf :Files<CR>
nnoremap <leader>pb :Buffers<CR>
nnoremap <leader>fh :Helptags<CR>
nnoremap <leader>fc :Commands<CR>

