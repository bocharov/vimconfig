runtime bundle/pathogen/autoload/pathogen.vim

"Start pathogen
execute pathogen#infect()

filetype plugin indent on               "Automatically detect file types
syntax on                               "syntax highlighting
set nobackup                            "dont backup
set noswapfile                          "dont use swap files
set nowrap                              "dont wrap
set wildmenu                            "show suggestions for commands

set cursorline                          "highlight current line

set backspace=indent,eol,start          "backspace for dummys
set number                              "Line numbers on
set showmatch					        "show matching brackets/parenthesis
set incsearch					        "find as you type search
set hlsearch					        "highlight search terms
set ignorecase					        "case insensitive search

set autoindent 				            "indent at the same level of the previous line
set tabstop=4 				            "an indentation every four columns
set softtabstop=4 			            "let backspace delete indent


"This unsets the last search pattern register by hitting return
nnoremap <CR> :noh<CR><CR>

" Git blame Ctrl + G binding
nnoremap <C-G> :Gblame<CR>

" Bindings for jumping between tabs
nmap <silent> <A-Left> :tabp<CR>
nmap <silent> <A-Right> :tabn<CR>
nmap <silent> <A-Up> :tabfirst<CR>
nmap <silent> <A-Down> :tablast<CR>
