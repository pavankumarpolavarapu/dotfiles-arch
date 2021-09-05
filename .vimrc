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


:let mapleader = ","
call plug#begin()

" Nerd Tree
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' }
	nnoremap <C-b> :NERDTreeToggle<CR>
	nnoremap <leader>n :NERDTreeFocus<CR>
	nnoremap <C-n> :NERDTree<CR>
	nnoremap <C-f> :NERDTreeFind<CR>
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" {{{
  let g:fzf_nvim_statusline = 0 " disable statusline overwriting

  nnoremap <silent> <leader><space> :Files<CR>
  nnoremap <silent> <leader>a :Buffers<CR>
  nnoremap <silent> <leader>A :Windows<CR>
  nnoremap <silent> <leader>; :BLines<CR>
  nnoremap <silent> <leader>o :BTags<CR>
  nnoremap <silent> <leader>O :Tags<CR>
  nnoremap <silent> <leader>? :History<CR>
  nnoremap <silent> <leader>/ :execute 'Ag ' . input('Ag/')<CR>
  nnoremap <silent> <leader>. :AgIn 

  nnoremap <silent> K :call SearchWordWithAg()<CR>
  vnoremap <silent> K :call SearchVisualSelectionWithAg()<CR>
  nnoremap <silent> <leader>gl :Commits<CR>
  nnoremap <silent> <leader>ga :BCommits<CR>
  nnoremap <silent> <leader>ft :Filetypes<CR>

  imap <C-x><C-f> <plug>(fzf-complete-file-ag)
  imap <C-x><C-l> <plug>(fzf-complete-line)

  function! SearchWordWithAg()
    execute 'Ag' expand('<cword>')
  endfunction

  function! SearchVisualSelectionWithAg() range
    let old_reg = getreg('"')
    let old_regtype = getregtype('"')
    let old_clipboard = &clipboard
    set clipboard&
    normal! ""gvy
    let selection = getreg('"')
    call setreg('"', old_reg, old_regtype)
    let &clipboard = old_clipboard
    execute 'Ag' selection
  endfunction

  function! SearchWithAgInDirectory(...)
    call fzf#vim#ag(join(a:000[1:], ' '), extend({'dir': a:1}, g:fzf#vim#default_layout))
  endfunction
  command! -nargs=+ -complete=dir AgIn call SearchWithAgInDirectory(<f-args>)
" }}}
Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

Plug 'SirVer/ultisnips'
" {{{
  nnoremap <leader>se :UltiSnipsEdit<CR>

  let g:UltiSnipsEditSplit = 'horizontal'
  let g:UltiSnipsListSnippets = '<nop>'
  let g:UltiSnipsExpandTrigger = '<c-l>'
  let g:UltiSnipsJumpForwardTrigger = '<c-l>'
  let g:UltiSnipsJumpBackwardTrigger = '<c-b>'
  let g:ulti_expand_or_jump_res = 0
" }}}
Plug 'honza/vim-snippets'
call plug#end()
