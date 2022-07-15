" Plugins
call plug#begin('~/.vim/plugged') " Directory for plugins

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-peekaboo'" View registers. " and @ in normal mode and ctrl-r in insert mode
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sensible' " Good defaults
"Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise' " Adds end after if, do, and def.
Plug 'tpope/vim-eunuch' " Unix shell commands. :Delete, :Move, :Rename, :Copy
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'preservim/nerdtree'
Plug 'sheerun/vim-polyglot' " Language packs for Vim
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'
"Plug 'terryma/vim-expand-region'
"Plug 'terryma/vim-multiple-cursors'
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'
call plug#end()

" Configuration
colorscheme codedark
set background=dark
set guifont=Menlo-Regular:h18

let g:mapleader = ','
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>
let g:auto_save = 1  " enable AutoSave on Vim startup

set hidden
set ignorecase " Ignore case in search
set smartcase " Ignores ignorecase if upper case characters
set hlsearch " Highlights anything that matches search
set noerrorbells visualbell t_vb= " Turn off the annoying bells in GUI(MacVim)
set mat=2 " Make showmatch a little faster.
autocmd GUIEnter * set visualbell t_vb=

set suffixesadd=.rb
set path+=lib/**,test/**,spec/**,app/**

" Maps

" fzf
map <Leader>t :Files<CR>
map <Leader>a :Buffers<CR>
map <Leader>s :w<CR>

" nerdtree
map <Leader>n :NERDTreeToggle<CR>
map <silent> <leader><cr> :noh<cr>

" Moving around splits with ctrl and hjkl
" map <Space> <Leader>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>w <C-w>

" vimrc
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
