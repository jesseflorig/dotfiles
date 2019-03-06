"=========================
" Author: Jesse Florig
" Purpose: VIM config file
"=========================

syntax on

" Settings
set hidden
set backspace=indent,eol,start
set laststatus=2
set noshowmode
set number relativenumber
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" ALE / Language Client
set signcolumn=yes

" Statusline
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" VIM plugins
call plug#begin('~/.vim/plugged')
  Plug 'itchyny/lightline.vim'        " Status line
  Plug 'ap/vim-buftabline'            " Buffer tabs
  Plug 'qpkorr/vim-bufkill'           " Retain window after buffer kill
  Plug 'ggreer/the_silver_searcher'   " Fuzy find in file
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'             " Fuzzy find in path
  Plug 'pangloss/vim-javascript'      " JSX prereq
  Plug 'mxw/vim-jsx'                  " JSX highlighter
  Plug 'scrooloose/nerdcommenter'     " Quick Comments
  Plug 'jparise/vim-graphql'          " Graphql highlighter
  Plug 'w0rp/ale'                     " Linting
call plug#end()

" Plugged
nmap <C-P> :PlugInstall<CR>

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier','eslint']
\}
let g:ale_completion_enabled = 1
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '--'

" Nerd Commenter
let g:NERDCustomDelimiters = { 'javascript': 
      \ { 'left': '// ','leftAlt': '/* ','rightAlt': ' */' } }

" Buffer navigation
nmap < :bprev<CR>
nmap > :bnext<CR>

" Vimgrep navigation
nmap [ :cprev<CR>
nmap ] :cnext<CR>

" Vim pane navigation
nmap <C-J> <C-W><C-J>
nmap <C-K> <C-W><C-K>
nmap <C-L> <C-W><C-L>
nmap <C-H> <C-W><C-H>

" FZF
nmap <C-X> :Files<CR>
nmap <C-D> :Ag<CR>
nmap <C-C> :bd<CR>

" Comments
nmap <C-/> <leader>c<Space>
nmap <C-_> <leader>c<Space>

" Super Escape (removes HL)
noremap <ESC><ESC> <ESC>:noh<Enter>

" Snippet tab jump
inoremap <Space><Space> <ESC>/_+_<Enter>"_c3l

" JSX snippets
autocmd FileType javascript imap ;im
      \ import<Space>_+_<Space>from<Space>"_+_"<Space><Space>

" ALE Autofixer
augroup ALEAutoFix
  autocmd!
  autocmd FileType javascript ALEFix
  autocmd TextChanged,InsertLeave *.js,*.jsx,*.json ALEFix

" Vim plug auto-load
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif
