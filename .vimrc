syntax on
set number
set nocompatible
set encoding=utf-8
set path+=**
set mouse=a
set noswapfile
set cursorcolumn
filetype off


" test set cursor
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" set ttimeout
" set ttimeoutlen=1
" set listchars=tab:>-,trail:~,extends:>,precedes:<,space:.
" set ttyfast


" work on windows cursor will set to bold
" let &t_ti.="\e[1 q"
" let &t_SI.="\e[5 q"
" let &t_EI.="\e[1 q"
" let &t_te.="\e[0 q"




set wildignore+=tags,_bin/**,obj/**,bin/**,node_modules/**

set hlsearch
hi Search ctermbg=DarkRed
hi Search ctermfg=Black

set autoread

set backspace=indent,eol,start

" for hightlight search word
set hls


" for highlight current line
set cursorline
hi cursorline cterm=none term=none
autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline
highlight CursorLine guibg=#303000 ctermbg=234
highlight CursorColumn ctermbg=darkgray




set ignorecase
" set noignorecase
set smartcase


" this is example binding key
map <F2> :ls<CR>

map <silent> <C-k> :syntax off<CR>


" swap layout window
map <F3> <C-w>K<CR>
map <F4> <C-w>H<CR>

map <silent> <F5> :source ~/.vimrc<CR>


"map <silent> <C-T> :NERDTree <CR>
nnoremap <silent> <expr> <C-T> g:NERDTree.IsOpen() ? "\:NERDTreeClose<CR>" : bufexists(expand('%')) ? "\:NERDTreeFind<CR>" : "\:NERDTree<CR>"


" binding change insert to end of line
" ctrl + L
map <C-l> <Esc>$a

" shift - f for open copen/cope
map <silent> <S-F>e :cope<CR>

" ctrl - f for find current word in current edit file
map <silent> <C-f> :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('%') \| copen<CR>

" ff for find current word all files in root dir
"map <silent> ff :execute 'vimgrep /'.expand('<cword>').'/gj '.expand('**/*.*') \| copen<CR>
"map <silent> ff :execute 'vimgrep /'.expand('<cword>').'/gj **.* **/*' \| copen<CR>
"map <silent> ff :execute 'grep -R --exclude-dir={.git,node_modules} '.expand('<cword>').' . '<CR> \| copen<CR>


" work before change to below
" nmap ff<CR> :execute 'vimgrep /'.expand('<cword>').'/gj **.* **/*' \| copen<CR>
" nmap <leader>ff :execute 'vimgrep /'.expand('<cword>').'/gj **.* **/*' \| copen<CR>
" this will search all file and folder and sub folder
" nmap ff :execute 'vimgrep /'.expand(input("search: ")).'/gj **.* **/*' \| copen<CR>
nmap <leader><S-F> :execute 'vimgrep /'.expand(input("file-search: ", expand('<cword>'))).'/gj **.* **/*' \| copen<CR>
nmap <leader>ff :execute 'vimgrep /'.expand(input("file-search: ")).'/gj **.* **/*' \| copen<CR>
" change to search in currrent file
nmap <S-F>f :execute 'vimgrep /'.expand(input("search: ", expand('<cword>'))).'/ %' \| copen<CR>
nmap ff :execute 'vimgrep /'.expand(input("search: ")).'/ %' \| copen<CR>

" remap key for vistual block
nnoremap vv <c-v> " remap `vv` to `Ctrl-v`

"
"nnoremap <C-N> :norm i
"nnoremap <C-M> :norm x
"

"
"augroup commenting_blocks_of_code
"	autocmd!
"	autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
"	autocmd FileType sh,ruby,python   let b:comment_leader = '# '
"	autocmd FileType conf,fstab       let b:comment_leader = '# '
"	autocmd FileType tex              let b:comment_leader = '%'
"	autocmd FileType mail             let b:comment_leader = '> '
"	autocmd FileType vim              let b:comment_leader = '" '
"augroup END
""noremap <silent> vb :<C-B>silent<C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
"noremap <silent> vv :<C-B>silent<C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>





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



" set clipboard+=unnamedplus

" disable auto indening when copy text from clipboard then paste to vim
" set paste
" set nopaste
" set autoindent
set smartindent
" set cindent

" set pastetoggle=<F4>




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
" Plugin 'valloric/youcompleteme'
" Plugin 'thosakwe/vim-flutter'
" Plugin 'dart-lang/dart-vim-plugin'
Plugin 'tpope/vim-commentary'
" Plugin 'Chiel92/vim-autoformat'
" Plugin 'sheerun/vim-polyglot'
Plugin 'junegunn/vim-easy-align'
Plugin 'aserebryakov/vim-todo-lists'
" Plugin 'samoshkin/vim-find-files'
" Plugin 'eugen0329/vim-esearch'
" Plugin 'wincent/ferret'
Plugin 'tpope/vim-fugitive'
call vundle#end()




filetype on
filetype indent on
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



" disable auto insert comment
set formatoptions-=cro




" let g:ycm_add_preview_to_completeopt = 0
" let g:ycm_autoclose_preview_window_after_completion = 0
" let g:ycm_autoclose_preview_window_after_insertion = 0

" set completeopt-=preview


" nnoremap gl :YcmCompleter GoToDeclaration<CR>
" nnoremap gc :YcmCompleter GetDoc<CR>



noremap vvv :Commentary<cr>




