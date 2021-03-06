" ----------------------------------------------------------------------------
"   Plug
" ----------------------------------------------------------------------------

" Install vim-plug if we don't already have it
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/plugged')

" Material Theme
Plug 'kaicataldo/material.vim', { 'branch': 'main' }

" Lightline Status Bar
Plug 'itchyny/lightline.vim'

" NERDTree Explorer
Plug 'preservim/nerdtree'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'Xuyuanp/nerdtree-git-plugin'

" File type icons to NERDTree
Plug 'ryanoasis/vim-devicons'

" NERDTree comments
Plug 'preservim/nerdcommenter'

" fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Show git diffs
Plug 'airblade/vim-gitgutter'

" Indent Blankline
Plug 'lukas-reineke/indent-blankline.nvim'

" Surround/parenthesizing
Plug 'tpope/vim-surround'

" Insert brackets, parens, quotes in pair
Plug 'jiangmiao/auto-pairs'

filetype plugin indent on                   " required!
call plug#end()

autocmd ColorScheme * highlight! Normal ctermbg=NONE guibg=NONE
