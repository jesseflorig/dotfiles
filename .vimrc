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

" Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe = 'npm run lint --'

"Neoformat
let g:neoformat_try_formatprg = 1

" VIM plugins
" Use :PlugInstall after updating
call plug#begin('~/.vim/plugged')
  Plug 'scrooloose/nerdtree'          " File viewer
  Plug 'itchyny/lightline.vim'        " Status line
  Plug 'ap/vim-buftabline'            " Buffer tabs
  Plug 'mattn/emmet-vim'              " Emmet shorthands
  Plug 'Xuyuanp/nerdtree-git-plugin'  " Git file statuses
  Plug 'qpkorr/vim-bufkill'           " Buffer killer (?)
  Plug 'ggreer/the_silver_searcher'   " Silver searcher
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'             " Fuzzy finder
  Plug 'pangloss/vim-javascript'      " JSX prereq
  Plug 'mxw/vim-jsx'                  " JSX highlighter
  Plug 'jparise/vim-graphql'          " Graphql highlighter
  Plug 'vim-syntastic/syntastic'      " Linting
  Plug 'sbdchd/neoformat'             " Prettier
call plug#end()

" Hotkeys
map <C-n> :NERDTreeToggle<CR>

" Buffer navigation
nmap < :bprev<CR>
nmap > :bnext<CR>

" Vimgrep navigation
nmap { :cprev<CR>
nmap } :cnext<CR>

" Vim pane navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" FZF
nmap <C-X> :Files<CR>
nmap <C-C> :bd<CR>

let g:user_emmet_leader_key='<C-Z>'

" Auto Commands
autocmd StdinReadPre * let s:std_in=1

" Neoformat Prettier
augroup NeoformatAutoFormat
  autocmd!
  autocmd FileType javascript setlocal formatprg=prettier\
                                          \--stdin\
                                          \--print-width\ 80\
                                          \--no-semi\

  autocmd BufWritePre,TextChanged,InsertLeave *.js,*.jsx,*.json Neoformat
augroup END

" Vim plug auto-load
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
