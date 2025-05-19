syntax enable

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set nowrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase

" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000

" Highlight cursor line underneath the cursor horizontally.
set cursorline

" Highlight cursor line underneath the cursor vertically.
set cursorcolumn


" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

" Enable type file detection. Vim will be able to try to detect the type of file in use.
filetype on

" Enable plugins and load plugin for the detected file type.
filetype plugin on

" Load an indent file for the detected file type.
filetype indent on


" Imposta le opzioni generali
set number            " Mostra i numeri di riga di default
set relativenumber    " Mostra i numeri di riga relativi di default

" Autocomandi per cambiare modalità numerazione
augroup LineNumbers
  autocmd!
  " Modalità Inserimento: Mostra solo numeri assoluti
  autocmd InsertEnter * set norelativenumber number
  " Esci da Modalità Inserimento: Torna ai numeri relativi
  autocmd InsertLeave * set relativenumber number
augroup END
" STATUS LINE ------------------------------------------------------------ {{{

" Clear status line when vimrc is reloaded.
set statusline=

" Status line left side.
set statusline+=\ %F\ %M\ %Y\ %R

" Use a divider to separate the left side from the right side.
set statusline+=%=

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%

" Show the status on the second to last line.
set laststatus=2

" }}}


" Usa tabulazioni reali (modifica se preferisci spazi)
set noexpandtab     " Usa caratteri TAB veri, non spazi
set tabstop=4       " Numero di spazi visivi per ogni tab
set shiftwidth=4    " Numero di spazi usati per indentazione (>>, <<, autoindent)
set softtabstop=4   " Numero di spazi inseriti quando premi Tab
set autoindent      " Mantiene l’indentazione della riga precedente
set smarttab        " Tab intelligente: usa shiftwidth all’inizio della riga
set smartindent     " Indentazione automatica basata sul contesto (funziona bene con C/C++)

"C++ Class Generator
 function! Class(ClassName)
    "==================  editing header file =====================
	let header = "include/" . a:ClassName . ".hpp"
	:vsp `=header`
     call append(0,"#ifndef ".toupper(a:ClassName)."_H")
     call append(1,"#define ".toupper(a:ClassName)."_H")
     call append(2," ")
     call append(3,"class ".a:ClassName )
     call append(4, "{")
     call append(5, "	public:")
     call append(6, "		".a:ClassName."();	//cannon")
	 call append(7, "		" . a:ClassName . "(" . a:ClassName . " const & src);	//Cannon")
	 call append(8, "		" . a:ClassName . "& operator=(" . a:ClassName . " const & rsh);	//Cannon")
     call append(9, "		virtual ~".a:ClassName."();	//Cannon")
     call append(10, "	private:")
     call append(11, "};")
     call append(12,"#endif // ".toupper(a:ClassName)."_H")
     :execute 'write' header
   "================== editing source file ========================
	let src    = "src/" . a:ClassName . ".cpp"
	:vsp `=src`

	" Include header
	call append(0, "#include \"../include/" . a:ClassName . ".hpp\"")
	call append(1, "")
	call append(2, "")

	" Costruttore
	call append(3, a:ClassName . "::" . a:ClassName . "()")
	call append(4, "{")
	call append(5, "    std::cout << \"Default constructor called\" << std::endl;")
	call append(6, "    // ctor")
	call append(7, "}")
	call append(8, "")

	" Costruttore di copia
	call append(9, a:ClassName . "::" . a:ClassName . "(" . a:ClassName . " const & src)")
	call append(10, "{")
	call append(11, "    std::cout << \"Copy constructor called\" << std::endl;")
	call append(12, "    *this = src;")
	call append(13, "}")
	call append(14, "")

	" operatore =
	call append(15, a:ClassName . " &" . a:ClassName . "::operator=( " . a:ClassName . " const &rhs)")
	call append(16, "{")
	call append(17, "    std::cout << \"Copy assignment operator called\" << std::endl;")
	call append(18, "    if (this != &rhs)")
	call append(19, "    {")
	call append(20, "        // this->_n = rhs.getValue();")
	call append(21, "    }")
	call append(22, "    return *this;")
	call append(23, "}")
	call append(24, "")

	" Distruttore
	call append(25, a:ClassName . "::~" . a:ClassName . "()")
	call append(26, "{")
	call append(27, "    std::cout << \"Destructor called\" << std::endl;")
	call append(28, "    // dtor")
	call append(29, "}")

	:execute 'write' src

endfunction

:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
:  autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
:augroup END

colorscheme default

