" General {
    set background=dark                     " Assume a dark background
    filetype plugin indent on               " Automatically detect file types.
    "syntax on                               " syntax highlighting - TOO SLOW!
    set mouse=a                             " automatically enable mouse usage
    scriptencoding utf-8                    " utf8 encoding
    set termencoding=utf-8                  " terminal encoding
    set encoding=utf8                       " for sure ;)
    set nobackup                            " dont backup
    set noswapfile                          " dont use swap files
    let mapleader="`"                       " <leader> map to `
    set foldlevel=99                        " dont fold
    set binary                              " dont add newline at end of file
    set hidden                              " let open another buffer w/o saving prev
    set nowrap
    set wildmenu                            "show suggestions for commands

    " pathogen infect
    "execute pathogen#infect()
" }

" VIM UI {
    set showmode    " display the current mode
    set cursorline  " highlight current line

    if has('statusline')
        set laststatus=2
        " Broken down into easily includeable segments
        set statusline=%<%f\                        " Filename
        set statusline+=%w%h%m%r                    " Options
        "set statusline+=%{fugitive#statusline()}    " Git Hotness
        set statusline+=\ [%{&ff}/%Y]               " filetype
        set statusline+=\ [%{getcwd()}]             " current dir
        "set statusline+=\ [A=\%03.3b/H=\%02.2B]    " ASCII / Hexadecimal value of char
        set statusline+=%=%-14.(%l,%c%V%)\ %p%%     " Right aligned file nav info
    endif

    set backspace=indent,eol,start  " backspace for dummys
    set linespace=0                 " No extra spaces between rows
    set nu                          " Line numbers on
    set showmatch					" show matching brackets/parenthesis
    set incsearch					" find as you type search
    set hlsearch					" highlight search terms
    set ignorecase					" case insensitive search
" }

" Formatting {
    set autoindent 				" indent at the same level of the previous line
    set shiftwidth=4 			" use indents of 4 spaces
    set expandtab 	  	     	" tabs are spaces, not tabs
    set tabstop=4 				" an indentation every four columns
    set softtabstop=4 			" let backspace delete indent
" }

" TagList config {
    let Tlist_Close_On_Select = 1
    let Tlist_Exit_OnlyWindow = 1
    let Tlist_GainFocus_On_ToggleOpen = 1
    let tlist_php_settings = 'php;f:function'
    let Tlist_WinWidth = 50
    let Tlist_Show_One_File = 1
" }

" Bindings {
    " This unsets the last search pattern register by hitting return
    nnoremap <CR> :noh<CR><CR>  

    " Git blame Ctrl + G binding
    nnoremap <C-G> :Gblame<CR>

    " Tag list binding F8
    nnoremap <silent> <F8> :TlistToggle<CR>
    " Show/Hide Stack yanked list
    nnoremap <F7> :YRShow<CR>    

    " Bindings for jumping between tabs
    nmap <silent> <A-Left> :tabp<CR>
    nmap <silent> <A-Right> :tabn<CR>
    nmap <silent> <A-Up> :tabfirst<CR>
    nmap <silent> <A-Down> :tablast<CR>

    " Bindings for jumping between splits / windows
    nmap <silent> <S-Up> :wincmd k<CR>
    nmap <silent> <S-Down> :wincmd j<CR>
    nmap <silent> <S-Left> :wincmd h<CR>
    nmap <silent> <S-Right> :wincmd l<CR>
    nmap <C-F12> :call FfindWord()<CR>
    nmap <C-W> :bd<CR>

    " check PHP syntax F9
    map <F9> :w !php -l<CR>
    " For saving file {
        map <S-s>          :w<CR>
    " }

    "format indent in whole file
    map <C-F> mpgg=G`p
" }
"

function! Ffind(extension, pattern)
    execute 'tabe find.txt | silent .!find . -name \*.' . a:extension . ' -print0 | xargs -0 grep --color -n ' . a:pattern | w
endfunction

function! FfindWord()
    let a:curWord = expand("<cword>")
    call Ffind('php', a:curWord)
endfunction

command! -nargs=+ S call Ffind(<f-args>)

match ErrorMsg '\s\+$'
