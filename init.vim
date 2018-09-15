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

" new in vim 6.0+; file type specific indenting
filetype indent on

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

  Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" airline:
"let g:airline_theme='solarized'
"let g:airline_solarized_bg='dark'
let g:airline_theme='gruvbox'

" Prefix to the fzf commands, for example, instead of :GFiles enter :FzfGFiles
let g:fzf_command_prefix = 'Fzf'

nnoremap <leader>f :FZF<cr>
nnoremap <leader>g :FzfGFiles<cr>
nnoremap <leader>G :FzfGFiles?<cr>
nnoremap <leader>b :FzfBuffers<cr>

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

" fzf 
let FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

