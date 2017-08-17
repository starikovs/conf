" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" Map leader key.
let mapleader=','

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

set nobackup		" do not keep a backup file, use versions instead
set noswapfile
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent " always set autoindenting on

endif " has("autocmd")

" In a C file, you would get a modeline like this:
" /* vim: set ts=8 sw=4 tw=0 noet : */
set modeline

" http://vim.wikia.com/wiki/Indenting_source_code

" copy the indentation from the previous line
set autoindent

" show tab as 8 chars                                                                                         
set tabstop=8 

" copy the indentation from the previous line
set autoindent

" show tab as 8 chars                                                                                         
set tabstop=8 

" insert 4 spaces for indentation ( >>, << or ==. automatic indentation)                                      
set shiftwidth=4                                                                                              
                                                                                                              
" affects what happens when you press the tab or bs keys                                                      
set softtabstop=4                                                                                             
                                                                                                              
" insert space characters whenever the tab key is pressed                                                     
set expandtab 

" don't wrap text
set nowrap

" colored restriction of line length
set colorcolumn=110

filetype plugin on
" au FileTYpe html setl ofu=htmlcomplete#CompleteTags

filetype off                  " required!

" https://github.com/junegunn/vim-plug

call plug#begin('~/.local/share/nvim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'scrooloose/nerdtree'
Plug 'ctrlpvim/ctrlp.vim' 
Plug 'scrooloose/nerdcommenter'
Plug 'pangloss/vim-javascript'
Plug 'groenewege/vim-less'
Plug 'scrooloose/syntastic'
"Plug 'mtscout6/syntastic-local-eslint.vim'
Plug 'bling/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
call plug#end()

filetype plugin indent on     " required!

" deoplete
call deoplete#enable()

" vim-colors-solarized
syntax enable
set background=dark
colorscheme solarized

" nerdtree
map <C-n> :NERDTreeToggle<CR>

" For syntastic (https://github.com/scrooloose/syntastic#settings)

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" vim-jsx config
" let g:jsx_ext_required = 0 " Allow JSX in normal JS files

" Syntastic config                                                                                            
let g:syntastic_always_populate_loc_list = 1                                                                  
let g:syntastic_auto_loc_list = 1                                                                             
let g:syntastic_check_on_open = 0                                                                             
let g:syntastic_check_on_wq = 0                                                                               
                                                                                                              
" let g:syntastic_php_checkers = ['php', 'phpcs']
" let g:syntastic_php_checkers = ['php']
" let g:syntastic_javascript_checkers = ['jshint']
" if eslint installed locally
let g:syntastic_javascript_checkers=['eslint']
let g:syntastic_javascript_eslint_exec='node_modules/.bin/eslint'
let g:syntastic_less_checkers = ['lessc']
let g:syntastic_less_lessc_exec='node_modules/.bin/lessc'
" let g:syntastic_less_options = "--no-color"

" ctrlp
let g:ctrlp_custom_ignore = '\v[\/](\.git|\.vagrant|node_modules|vendor)$'

