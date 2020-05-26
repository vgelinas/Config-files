" .vimrc file put together with credit due to:  
" Steve Losh
" Dan Sheffner
" Martin Brochhaus


"------------------------- Misc -----------------------------------

" Avoid some pain with plugins.
set nocompatible
set nocp


" Useful settings
set history=700
set undolevels=700


" Make search case insensitive
" set hlsearch
" set incsearch
set ignorecase
" set smartcase

"------------------------- Bindings -------------------------------

" Binds leader to ",".
let mapleader = ","


" Creates extra line in normal mode.
nnoremap <leader>o o<esc>


" Binds - in normal mode to moving line downward. [Deletes if no line]
nnoremap - ddjP


" Binds _ in normal mode to moving line upward. [Deletes if no line]
nnoremap _ ddkP


" Binds ctrl+d in insert mode to deleting line.
inoremap <c-d> <esc>ddi


" Binds ctrl-u in insert mode to capitalizing current word.
inoremap <c-u> <esc>eviwUwi


" Binds ctrl-u in normal mode to capitalizing current word.
nnoremap <c-u> eviwUw


" Puts current word in quotation.
:nnoremap <leader>" viw<esc>a"<esc>bi"<esc>lel


" Opens .vimrc in a vertical split.
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>


" Sources .vimrc file.
:nnoremap <leader>sv :source $MYVIMRC<cr>


" Comment out visually selected text in python.
vnoremap <leader>3 :s/^/# <CR> 
vnoremap <leader>' :s/^/''' <CR>   


" Comment out visually selected text in LaTeX.
vnoremap <leader>5 :s/^/%<CR>


" Indent visually selected text via ">" and "<" 
vnoremap < <gv
vnoremap > >gv


" Quick quit command
noremap <Leader>e :quit<CR> " Quit current window
noremap <Leader>E :qa!<CR> " Quit all windows


" Bind Ctrl+<movement> keys to move around the windows, 
" instead of using Ctrl+w + <movement>
noremap <c-j> <c-w>j 
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
noremap <c-h> <c-w>h


" More natural movement.
nnoremap L $
nnoremap H 0


" Set tabs at 4 spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab


" Execute python code from current buffer
" Issues: closes automatically sometimes 
nnoremap <Leader>z :!clear<cr>:w <bar> :exec '!python3' shellescape(@%, 1)<cr>


"-------------------- Plugins ------------------------------------- 

" Using Plug for package manager, see 
" https://github.com/junegunn/vim-plug/wiki/tutorial 

filetype plugin indent on    
syntax enable  

" Plugins are downloaded to the specified directory  
call plug#begin('~/.vim/plugged')


" Always load these plugins 
Plug 'itchyny/lightline.vim' 
Plug 'scrooloose/nerdtree' 
Plug 'preservim/nerdcommenter' 
Plug 'jistr/vim-nerdtree-tabs'
Plug 'altercation/vim-colors-solarized' 


" On demand loading 
Plug 'tmhedberg/SimpylFold', { 'for': 'python' }  
Plug 'junegunn/fzf.vim', { 'for': 'python' }  
Plug 'vim-scripts/taglist.vim', { 'for': 'python' } 
Plug 'vim-latex/vim-latex', { 'for': 'tex' }  
Plug 'brennier/quicktex', { 'for': 'tex' }  


call plug#end() 


"------------------- On start ------------------------------------  

" Load up NERDTree 
autocmd vimenter * NERDTree 
map <Leader>t <plug>NERDTreeTabsToggle<CR> " Toggle option   

" After NERDTree loads, move to the first buffer  
autocmd VimEnter * wincmd p   


"------------------- Colors and layout ---------------------------

" Color scheme
let g:solarized_termcolors=256
set t_Co=256
set background=dark 
colorscheme solarized 

" Show line numbers and width
set number
" set colorcolumn=80
" highlight ColorColumn ctermbg=233


" Have text wrap around.
set wrap


"-------------------- Latex mode ----------------------------------

" vim-latex settings
" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a single file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" " 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" " The following changes the default filetype back to 'tex':
let g:tex_flavor='latex' 

" compiling and viewing options
let g:Tex_DefaultTargetFormat = 'pdf'
let g:Tex_MultipleCompileFormats='pdf, bib, pdf, aux'
let g:Tex_ViewRule_pdf = 'Zathura' 

autocmd FileType tex call Tex_MakeMap('<leader>ll', ':update!<CR>:call Tex_RunLaTeX()<CR>', 'n', '<buffer>')
autocmd FileType tex call Tex_MakeMap('<leader>ll', '<ESC>:update!<CR>:call Tex_RunLaTeX()<CR>', 'v', '<buffer>')

" Turning off vim-latex macros
" let g:Imap_FreezeImap = 1   


