"""Basics
set number			" Show Line Numbers
set wrap			" Wrap Lines
set showmatch		" Higlight Matching Parenthesis
set laststatus=2	" Show Statusline Always
set ruler			" Show Line and Column Number
set noerrorbells	" Disable Error Bells
set novisualbell	" Disable Visual bells
set vb t_vb=

""" Code Wrap
set tabstop=4		" Set <TAB> width
set shiftwidth=4	" Number of spaces for each indent
set softtabstop=4	" Backspace will remove these spaces

set autoindent		" Copy indent from current line to new line
set smartindent		" Better Auto Indent after brackets
"""Miscellaneous
set hlsearch		"Highlight Search Matches

" Plugin Manager - Vim Plug Installation
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

" Nerd Tree
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
call plug#end()
