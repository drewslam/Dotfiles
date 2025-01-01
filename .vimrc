" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Show line numbers
set number
set relativenumber

" Enable plugins and indent
filetype plugin indent on

" Show status line
set laststatus=2

" Do wrap lines. Do not allow long lines to extend as far as the line goes
set wrap

" Turn syntax highlighting on
syntax on

" Highlight cursor line and column
set cursorline
set cursorcolumn

" Set shift and tab widths to 4 spaces
set shiftwidth=4
set tabstop=4
set expandtab

" Do not save backup files
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling
set scrolloff=10

" Search settings
" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search
set ignorecase

" Override the ignorecase if searching for Capitol letters
set smartcase

" Show partial command you type in the last line on the screen
set showcmd

" Show the mode you are on the last line
set showmode

" Show matching words during a search
set showmatch

" Use highlighting when doing a search
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Enable auto completion menu after pressing TAB.
set wildmenu

" Make wildmenu behave like similar to Bash completion.
set wildmode=list:longest

" There are certain files that we would never want to edit with Vim.
" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx

" Automatically insert closing brackets
inoremap ( ()<Left>
inoremap [ []<Left>
inoremap { {}<Left>
inoremap " ""<Left>
inoremap ' ''<Left>

" Deletes empty sets
nnoremap <silent> d( 2dl
nnoremap <silent> d[ 2dl
nnoremap <silent> d{ 2dl 
nnoremap <silent> d" 2dl 
nnoremap <silent> d' 2dl 

" Clear search highlight
nnoremap <leader>h :nohlsearch<CR>
nnoremap <Esc> :nohlsearch<CR><Esc>

" PLUGINS ---------------------------------------------------------------- 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'sheerun/vim-polyglot'
Plugin 'valloric/youcompleteme'
Plugin 'othree/javascript-libraries-syntax.vim'
Plugin 'fatih/vim-go'
Plugin 'vim-utils/vim-man'
Plugin 'tpope/vim-fugitive'

call vundle#end()            " 

" Make YCM automatically load the .ycm_extra_conf.py file without prompting
let g:ycm_confirm_extra_conf = 0

" MAPPINGS ---------------------------------------------------------------
let mapleader=" "
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>


" VIMSCRIPT --------------------------------------------------------------
" This will enable code folding.
" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END


" STATUS LINE ------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = "unique_tail"

" Persistent Undo
if has("persistent_undo")
    set undodir=~/.vim/undodir
    set undofile
endif

" Backup and Swap Files
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//

" Performance
set lazyredraw
