syntax on
set number
set nocompatible
set encoding=utf-8
filetype off



" --------------------------------------
"  Automatic installation of Vundle, if it's not available
" --------------------------------------
if empty(glob('~/.vim/bundle/Vundle.vim'))
  silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" --------------------------------------



" --------------------------------------
"  Automatic installation of NERDTree, if it's not available
" --------------------------------------
if empty(glob('~/.vim/bundle/nerdtree'))
  silent !git clone https://github.com/preservim/nerdtree.git ~/.vim/bundle/nerdtree
  " autocmd vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
" --------------------------------------




set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
call vundle#end()

filetype plugin indent on



" ----------------------------------------
" Automatic installation of vim-plug, if it's not available
" ----------------------------------------
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"-----------------------------------------

"-----------------------------------------
" Automatically install missing plugins on startup
"-----------------------------------------
autocmd VimEnter *
      \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
      \|   PlugInstall --sync | q
      \| endif
"-----------------------------------------

"-----------------------------------------
" Plugins
"-----------------------------------------
silent! if plug#begin('~/.vim/plugged')
Plug 'w0rp/ale'                 " linting plugin
Plug 'morhetz/gruvbox'          " vim gruvbox color scheme
call plug#end()
endif
" vim-plug does not require any extra statement other than plug#begin()
" and plug#end(). You can remove filetype off, filetype plugin indent on
" and syntax on from your .vimrc as they are automatically handled by
" plug#begin() and plug#end()
"-----------------------------------------



