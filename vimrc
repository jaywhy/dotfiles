""""""""""""""""""""""
"Plugins
""""""""""""""""""""""
call plug#begin('~/.vim/plugged') " Directory for plugins

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-rooter'
Plug 'junegunn/vim-peekaboo'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-sensible'
"Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-surround'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'flazz/vim-colorschemes'
Plug 'morhetz/gruvbox'
Plug 'janko-m/vim-test'
Plug 'vim-airline/vim-airline'
Plug 'junegunn/goyo.vim'
Plug 'amix/vim-zenroom2'
Plug 'slashmili/alchemist.vim'
"Plug 'terryma/vim-expand-region'
"Plug 'terryma/vim-multiple-cursors'
Plug '907th/vim-auto-save'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-which-key'

call plug#end()

"""""""""""""""""""""""
" Configuration
""""""""""""""""""""""
colorscheme gruvbox
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

""""""""""""""""
" Maps
""""""""""""""""
" fzf
map <Leader>t :Files<CR>
map <Leader>a :Buffers<CR>
map <Leader>s :w<CR>

" nerdtree
map <Leader>n :NERDTreeToggle<CR>
map <silent> <leader><cr> :noh<cr>

" Moving around splits with ctrl and hjkl
map <Space> <Leader>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
map <Leader>w <C-w>
"""""""""""""""""""""
" Goyo
"""""""""""""""""""""
function! s:goyo_enter()
	set background=light
	colorscheme pencil
	set guifont=Menlo-Regular:h20
endfunction

function! s:goyo_leave()
	set background=dark
	set guifont=Menlo-Regular:h16
	colorscheme gruvbox
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

"""""""""""""""
" vimrc
"""""""""""""""
augroup myvimrchooks
    au!
    autocmd bufwritepost .vimrc source ~/.vimrc
augroup END

if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif
