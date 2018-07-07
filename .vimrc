syntax on

set number relativenumber
set backspace=indent,eol,start
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')
Plug 'mattn/emmet-vim'
call plug#end()

let g:user_emmet_leader_key='<C-Z>'
