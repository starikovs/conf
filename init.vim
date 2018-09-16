" true color terminal support:
set termguicolors

" Map leader key.
let mapleader=','

" Use system clipboard
set clipboard+=unnamedplus

set modeline

" search as characters are entered
set incsearch

" highlight matche
set hlsearch

" ignore case when searching
set ignorecase

" ignore case if search pattern is lower case
" case-sensitive otherwise
set smartcase       

" colored restriction of line length
set colorcolumn=110

" don't wrap text
set nowrap

" highlight current line
set cursorline

" highlight matching brace
set showmatch


" indets (https://habr.com/post/64224/):

" number of visual spaces per TAB
set tabstop=4 

" number of spaces to use for autoindent
set shiftwidth=4 

" tabs are space
set expandtab

" smartindent = set autoindent + other things: 
set smartindent

" Uses shiftwidth instead of tabstop at start of lines
set smarttab

" Treat dashes as part of word:
set iskeyword+=-

" Show line numbers
set nu

" do not keep a backup file, use versions instead:
set nobackup

" new in vim 6.0+; file type specific indenting
filetype indent on

" keep 50 lines of command line history
set history=5000

" show the cursor position all the time
set ruler

" display incomplete commands
set showcmd

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

call plug#begin('~/.config/nvim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " if fzf installed via brew
  Plug '/usr/local/opt/fzf'

  Plug 'junegunn/fzf.vim'
  "Plug 'altercation/vim-colors-solarized'
  Plug 'morhetz/gruvbox'

  " For automatically set shiftwidth and expandtab
  Plug 'tpope/vim-sleuth'

  Plug 'pangloss/vim-javascript'
  Plug 'groenewege/vim-less'
  " syntax highlighting for typescript:
  Plug 'leafgarland/typescript-vim' 

  " Make the yanked region highlighted and apparent:
  Plug 'machakann/vim-highlightedyank'

  " Automatically updates tags file (ctags must be installed)
  " brew install --HEAD universal-ctags/universal-ctags/universal-ctags
  Plug 'ludovicchabant/vim-gutentags'

  Plug 'scrooloose/nerdtree'

  " navigate easily into Vim’s registers
  Plug 'bfredl/nvim-miniyank'

  " close a buffer without closing your window
  Plug 'moll/vim-bbye'

  Plug 'tpope/vim-commentary'

  Plug 'tpope/vim-abolish'

  " syntax highlighting for PHP
  Plug 'StanAngeloff/php.vim'

  " git gutter, shows which lines have been added, modified, or removed:
  Plug 'airblade/vim-gitgutter'
call plug#end()

" airline:
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline_theme='gruvbox'

" fzf 
" Prefix to the fzf commands, for example, instead of :GFiles enter :FzfGFiles
let g:fzf_command_prefix = 'Fzf'

nnoremap <leader>f :FZF<cr>
nnoremap <leader>g :FzfGFiles<cr>
nnoremap <leader>G :FzfGFiles?<cr>
nnoremap <leader>b :FzfBuffers<cr>
nnoremap \ :FzfAg<CR>

let FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'
" https://github.com/junegunn/fzf.vim/issues/50#issuecomment-161676378:
nnoremap <silent> <Leader>ag :FzfAg <C-R><C-W><CR>

" for altercation/vim-colors-solarized or other colors:
syntax enable
set background=dark
colorscheme gruvbox
"colorscheme solarized

" ariline
" let g:airline_powerline_fonts = 0
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" moll/vim-bbye
nnoremap <Leader>q :Bdelete<CR>

" nerdtree
map <C-n> :NERDTreeToggle<CR>
map <C-s> :NERDTreeFind<CR>
" close nerdtreee if it's the only opened window
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" miniyank
map p <Plug>(miniyank-autoput)
map P <Plug>(miniyank-autoPut)
map <leader>p <Plug>(miniyank-startput)
map <leader>P <Plug>(miniyank-startPut)
map <leader>n <Plug>(miniyank-cycle)

" bbye 
nnoremap <Leader>q :Bdelete<CR>

