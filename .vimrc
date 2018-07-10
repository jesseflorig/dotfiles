"=========================
" Author: Jesse Florig
" Purpose: VIM config file
"=========================

syntax on

" Settings
set laststatus=2
set number relativenumber
set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
set noshowmode

" Vim plug auto-load
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" VIM plugins
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'
  Plug 'itchyny/lightline.vim'
  Plug 'ap/vim-buftabline'
  Plug 'mattn/emmet-vim'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'qpkorr/vim-bufkill'
call plug#end()

" Hotkeys
map <C-n> :NERDTreeToggle<CR>
nmap < :bprev<CR>
nmap > :bnext<CR>

nmap { :cprev<CR>
nmap } :cnext<CR>

nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

let g:user_emmet_leader_key='<C-Z>'

" Auto Commands
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
