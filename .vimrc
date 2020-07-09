syntax on
set number
set nocompatible
set encoding=utf-8
filetype off

set autoread


" this is example binding key
map <F2> :ls<CR>

map <silent> <F5> :source ~/.vimrc


"map <silent> <C-T> :NERDTree <CR>
nnoremap <silent> <expr> <C-T> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"


" binding change insert to end of line
" ctrl + L
map <C-l> <Esc>$a

" shift - f for open copen/cope
map <silent> <S-F> :cope<CR>

" ctrl - f for find current word in current edit file
map <silent> <C-f> :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') \| copen<CR>

" ff for find current word all files in root dir
"map <silent> ff :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('**/*.*') \| copen<CR>
map <silent> ff :execute 'vimgrep /'.expand('<cword>').'/gj **.* **/*' \| copen<CR>
"map <silent> ff :execute 'grep -R --exclude-dir={.git,node_modules} '.expand('<cword>').' . '<CR> \| copen<CR>


" goto tab number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>




"nnoremap \ :grep -F <SPACE>




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
"Plugin 'tpope/vim-fugitive'
"Plugin 'git://git.wincent.com/command-t.git'
"Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'preservim/nerdtree'
"Plugin 'skywind3000/vim-preview'
"Plugin 'ronakg/quickr-preview.vim'
" supertab when install if use wsl will error, fix to ":w ++ff=unix" first
Plugin 'ervandew/supertab'
Plugin 'valloric/youcompleteme'
Plugin 'thosakwe/vim-flutter'
Plugin 'dart-lang/dart-vim-plugin'
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

let g:ycm_add_preview_to_completeopt = 0
let g:ycm_autoclose_preview_window_after_completion = 0
let g:ycm_autoclose_preview_window_after_insertion = 0

set completeopt-=preview


nnoremap gl :YcmCompleter GoToDeclaration<CR>
nnoremap gc :YcmCompleter GetDoc<CR>




