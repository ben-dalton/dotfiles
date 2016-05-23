set nocompatible              " be improved, required
" Vundle settings
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'Raimondi/delimitMate'
Plugin 'ternjs/tern_for_vim'
Bundle 'lfilho/cosco.vim'

" Color Schemes
" Plugin 'altercation/vim-colors-solarized'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'the31k/vim-colors-tayra'
" Plugin 'Lokaltog/vim-distinguished'
" Plugin 'michalbachowski/vim-wombat256mod'
Plugin 'nanotech/jellybeans.vim'
Plugin 'marciomazza/vim-brogrammer-theme'

Plugin 'mattn/emmet-vim'
Plugin 'kien/ctrlp.vim'
Plugin 'cakebaker/scss-syntax.vim'
" Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-unimpaired' " [b for prev buffer
Plugin 'tpope/vim-surround' " cs{[ to change surrounding {} to []
Plugin 'tpope/vim-commentary' " gc to comment in visual mode
Plugin 'nelstrom/vim-visual-star-search' " * to select all occurences under cursor
Plugin 'wesQ3/vim-windowswap' " <leader>ww to swap windows
Plugin 'moll/vim-bbye'
Plugin 'gorodinskiy/vim-coloresque' " highlight hex colors
Bundle 'mohitleo9/vim-fidget'

Bundle 'ervandew/supertab'
Plugin 'Valloric/YouCompleteMe'
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Bundle "justinj/vim-react-snippets"
Plugin 'moll/vim-node' " gf to open imported/required js file

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

let g:UltiSnipsExpandTrigger       ="<c-tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Enable tabbing through list of results
function! g:UltiSnips_Complete()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res == 0
		if pumvisible()
			return "\<C-n>"
		else
			call UltiSnips#JumpForwards()
			if g:ulti_jump_forwards_res == 0
				return "\<TAB>"
			endif
		endif
	endif
	return ""
endfunction

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"

" Expand snippet or return
let g:ulti_expand_res = 0
function! Ulti_ExpandOrEnter()
	call UltiSnips#ExpandSnippet()
	if g:ulti_expand_res
		return ''
	else
		return "\<return>"
endfunction

inoremap <return> <C-R>=Ulti_ExpandOrEnter()<CR>

" Character encoding 
if has("multi_byte")
	if &termencoding == ""
		let &termencoding = &encoding
	endif
	set encoding=utf-8
	setglobal fileencoding=utf-8
	"setglobal bomb
	set fileencodings=ucs-bom,utf-8,latin1
endif

" allow html syntax highlighting in js files
let javascript_enable_domhtmlcss = 1

" use JSX syntax highlighting in all js files
let g:jsx_ext_required = 0

" Line/Selection bubbling 
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv
" 

" Define what a keyword break is 
setl iskeyword=@,48-57,192-255,%,#
" 

" Set the leader to comma **** Don't move this as mappings defined before it
" will use the stadard leader (\).
let mapleader=","
" 

" Allow Cosco to toggle ending comma or semicolon with ,;
command! CommaOrSemiColon call cosco#commaOrSemiColon()
autocmd FileType javascript,css,jsx nnoremap <silent> <Leader>; :call cosco#commaOrSemiColon()<CR>
autocmd FileType javascript,css,jsx inoremap <silent> <Leader>; <c-o>:call cosco#commaOrSemiColon()<CR>

" Set up CTRL P 
" First set up patterns to ignore
set wildignore+=*/tmp/*,*.so,*/node_modules,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_map = '<c-p>'
" Open CTRL+P to search MRU (most recently used), files and buffers
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_working_path_mode = ''
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
" Make CTRL+P only look for filenames by default
let g:ctrlp_by_filename = '1'

"""""""""  CTRL+P Mappings """""""""
" Make CTRL+B open buffers
nnoremap <C-b> :CtrlPBuffer<CR>
" Make CTRL+F open Most Recently Used files
nnoremap <C-f> :CtrlPMRU<CR>
" 

" Emmet controls 
" let g:user_emmet_install_global = 0 "enable for only HTML and CSS
" let g:user_emmet_expandabbr_key = '<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_complete_tag = 1
let g:user_emmet_mode='a' "enable all functions in all modes.
autocmd FileType jsx,js,html,css,scss,php EmmetInstall

" ,q to quit
:nnoremap <Leader>q :Bdelete<CR>

" Backup and locations 
" Set backup file location so swp files aren't saved to Git (make sure you
" create this folder first!!)
set noswapfile
set nobackup


" Highlight current column for haml and sass
autocmd Filetype haml setlocal cursorcolumn
autocmd Filetype sass setlocal cursorcolumn

" Hightlight spaces and tabs 
" Highlight redundant whitespaces and tabs. Only shows trailing whitespace :)
highlight RedundantSpaces ctermbg=red
match RedundantSpaces /\s\+$/

" Fuzzy finder ignore files 
" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;"
" 

" Set Syntastic checkers 
let g:syntastic_scss_checkers = ['scss_lint']
" let g:syntastic_javascript_checkers = ['eslint']
" let g:syntastic_javascript_checkers = ['jshint']
let g:syntastic_check_on_open = 1
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-']

" HTML tag indentation settings 
" Make HTML get indented on the correct tags
let g:html_indent_inctags = "html,body,head,tbody,table,nav,footer,tr"

" Shortcut to indent whole file 
" indent the whole file and return to original position
nmap ,= mzgg=G`zz
" 

set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8
" Airline 
" Make sure powerline fonts are used
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif

let g:airline_theme="jellybeans"
let g:airline#extensions#tabline#enabled = 1 "enable the tabline
let g:airline#extensions#tabline#fnamemod = ':t' " show just the filename of buffers in the tab line
let g:airline_detect_modified=1
let g:airline#extensions#bufferline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

" Function to show total amount of lines in the airline 
function! AirlineInit()
	let g:airline_section_z = airline#section#create_right(['%L'])
endfunction
autocmd VimEnter * call AirlineInit()

" NERDtree settings 
" Enable Nerdtree with CTRL + N
map <C-n> :NERDTreeToggle<CR>

" Function to trim trailing whitespace on save 
function! TrimWhiteSpace()
	%s/\s\+$//e
endfunction

"autocmd BufWritePre *.vimrc *.html *.scss *.js :call TrimWhiteSpace()
autocmd FileType html,vimrc,scss,css,js,erb,haml,sass,jsx autocmd BufWritePre <buffer> :call TrimWhiteSpace()

" Syntax highlighting with Solarized 
" (requires correct presets for iTerm2/Terminal too:  http://blog.pangyanhan.com/posts/2013-12-13-vim-install-solarized-on-mac-os-x.html)
syntax enable
set background=dark
" colorscheme solarized
" colorscheme wombat256mod
" colorscheme vwilight
" colorscheme tayra
" colorscheme hybrid
" colorscheme distinguished
" colorscheme jellybeans
colorscheme brogrammer
hi Normal ctermbg=none
hi NonText ctermbg=none
hi CursorLine ctermbg=0
hi LineNr ctermfg=darkGray ctermbg=0

" Standard Vim settings 
set showcmd
set showmode
set title
set number
set norelativenumber
set ruler
set cursorline
"set showbreak=2026
set laststatus=2 " Enable the status bar to always show
"au BufRead,BufNewFile *.scss set filetype=css " Set extra filetypes
au BufRead,BufNewFile *.md set filetype=markdown " Set extra filetypes
set hidden " Set hidden to allow buffers to be browsed
" filetype indent on
" set smartindent
set breakindent " Make word wrapping behave like it does in every other sane text editor
set hlsearch " Highlight search results
set incsearch " Make search jump:
" Amazing custom search command. Thansk to Ingo: http://stackoverflow.com/a/24818933/1147859
" command -nargs=+ Se execute 'vimgrep /' . [<f-args>][0] . '/ **/*.' . [<f-args>][1]
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoread " Make Vim automatically open changed files (e.g. changed after a Git commit)
au FocusGained,BufEnter * :silent! !

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " (Hopefully) removes the delay when hitting esc in insert mode
set tabstop=2 " The default is 8 which is MASSIVE!!
set wildmenu " visually autocomplete the command menu
set lazyredraw " only redraw when needed
set ttyfast " sends more characters to the screen for fast terminal connections
set showmatch " highlight matching [{()}]
set shiftwidth=2
set wrap linebreak nolist
set virtualedit=onemore
set smartcase "don't ignore Captials when present
set ignorecase "don't need correct case when searching
set splitbelow " puts new splits to the bottom
set splitright " ensures new splits are to the right of current
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" Quick Save, Quick Vimrc edit, open/close folds 
" open/close folds with space
nnoremap <space> za 
" type `,ev` to edit the Vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR> 
" type `,s` to save the buffers etc. Reopen where you were with Vim with `vim
" -S`
nnoremap <leader>s :mksession!<CR> 

" Couple of CSS niteties 
" " Insert a line above the current set of property/declarations
nnoremap <leader>t vipo<ESC>o
" Insert a line below the current set of property/declarations
nnoremap <leader>b vip<ESC>O
" See: http://blog.millermedeiros.com/vim-css-complete/
" Make selection of CSS declaration
nnoremap <leader>A vip
" Make inner selection of nested CSS easy
nnoremap <leader>a vaBV

" Few helper mappings 
" Disable K looking stuff up
map K <Nop> 

" Allow CTRL+O to create a blank line above in Command mode
map <C-o> m`O<ESC> 
" Prevent Paste loosing the register source:
" http://stackoverflow.com/a/7797434/1147859
xnoremap p pgvy 

" Windows management shortcuts 
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-L> <C-w>l

" Split
noremap <Leader>h :split<CR>
noremap <Leader>v :vsplit<CR>

" Search with funky characters with :SS 
" Allow for searching of slashes and special characters with SS command
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '\')
" 

" Foldable settings 
set modelines=1

" And allow paste in visual to not update register 
vnoremap p "_dP

" Turn off highlighted search with <space> 
map <Space> :noh<cr>

"" Remember cursor position 
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Send shizzle to the black hole 
nnoremap <Leader>d V"_d
vnoremap <Leader>d "_d

" Ignore the node_modules folder for searches 
set wildignore+=**/node_modules/**

" Set clipboard 
if has('unnamedplus')
	set clipboard=unnamedplus
else
	set clipboard=unnamed
endif 

" Highlight current line number 
hi CursorLineNR cterm=bold ctermfg=220
augroup CLNRSet
	autocmd! ColorScheme * hi CursorLineNR cterm=bold ctermfg=220
augroup END

" Ag setup Silver Searcher 
let g:agprg="<custom-ag-path-goes-here> --column"

" delimitMate configuration 
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

set nocompatible              " be improved, required

