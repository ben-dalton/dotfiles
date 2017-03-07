set nocompatible              " be improved, required
runtime include/bundles.vim

set background=dark
" colorscheme solarized
" colorscheme wombat256mod
" colorscheme vwilight
" colorscheme tayra
" colorscheme hybrid
" colorscheme distinguished
" colorscheme jellybeans
" colorscheme brogrammer
colorscheme base16-tomorrow-night

let base16colorspace=256
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

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
  endif
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

let g:partial_templates_roots = ['source', 'src']
let g:partial_use_splits      = 1
let g:partial_vertical_split  = 1

" allow html syntax highlighting in js files
let javascript_enable_domhtmlcss = 0

" typescript-vim settings
let g:typescript_compiler_binary = 'tsc'
let g:typescript_compiler_options = ''
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost    l* nested lwindow

" vim-js-pretty-template settings
autocmd FileType typescript JsPreTmpl html

" ycm for ts
if !exists("g:ycm_semantic_triggers")
 let g:ycm_semantic_triggers = {}
 endif
 let g:ycm_semantic_triggers['typescript'] = ['.']

" use JSX syntax highlighting in all js files
let g:jsx_ext_required = 0

" Line/Selection bubbling 
" Bubble single lines
nmap <C-Up> [e
nmap <C-Down> ]e
" Bubble multiple lines
vmap <C-Up> [egv
vmap <C-Down> ]egv

" " Let that pinky rest
imap hh <ESC>

" Define what a keyword break is 
setl iskeyword=@,48-57,192-255,%,#

" Set the leader to comma **** Don't move this as mappings defined before it
" will use the stadard leader (\).
let mapleader=","

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

" Emmet controls 
" let g:user_emmet_install_global = 0 "enable for only HTML and CSS
" let g:user_emmet_expandabbr_key = '<Tab>'
" imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")
let g:user_emmet_complete_tag = 1
let g:user_emmet_mode='a' "enable all functions in all modes.
autocmd FileType jsx,js,html,css,scss,php EmmetInstall

" ,q to quit
nnoremap <Leader>q :Bdelete<CR>

" Backup and locations 
" Set backup file location so swp files aren't saved to Git (make sure you
" create this folder first!!)
set noswapfile
set nobackup

" Highlight current column for haml and sass
" set cursorcolumn
" autocmd Filetype haml setlocal cursorcolumn
" autocmd Filetype sass setlocal cursorcolumn

" Fuzzy finder ignore files 
" Fuzzy finder: ignore stuff that can't be opened, and generated files
let g:fuzzy_ignore = "*.png;*.PNG;*.JPG;*.jpg;*.GIF;*.gif;"

" HTML tag indentation settings 
" Make HTML get indented on the correct tags
let g:html_indent_inctags = "html,body,head,tbody,table,nav,footer,tr"

" Shortcut to indent whole file 
" indent the whole file and return to original position
nmap ,= mzgg=G`zz

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

let g:airline_theme="simple"
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
let NERDTreeShowHidden=1

" abyss after 80 cols
execute "set colorcolumn=" . join(range(81,335), ',')
" set colorcolumn=80

syntax enable

" Standard Vim settings 
set noeol
set showcmd
set showmode
set title
set number
set norelativenumber
set ruler
set cursorline
set laststatus=2 " Enable the status bar to always show
" au BufRead,BufNewFile *.md set filetype=markdown " Set extra filetypes
set hidden " Set hidden to allow buffers to be browsed
set breakindent " Make word wrapping behave like it does in every other sane text editor
set hlsearch " Highlight search results
set incsearch " Make search jump:
set gdefault " assume the /g flag on :s substitutions to replace all matches in a line
set autoread " Make Vim automatically open changed files (e.g. changed after a Git commit)
" au FocusGained,BufEnter * :silent! !

set backspace=indent,eol,start " allow backspacing over everything in insert mode
set autoindent " always set autoindenting on
set noesckeys " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeout " (Hopefully) removes the delay when hitting esc in insert mode
set ttimeoutlen=1 " (Hopefully) removes the delay when hitting esc in insert mode
set tabstop=2 " The default is 8 which is MASSIVE!!
set shiftwidth=2
set expandtab
set wildmenu " visually autocomplete the command menu
set lazyredraw " only redraw when needed
set ttyfast " sends more characters to the screen for fast terminal connections
set showmatch " highlight matching [{()}]
set wrap linebreak nolist
set virtualedit=onemore
set smartcase "don't ignore Captials when present
set ignorecase "don't need correct case when searching
set splitbelow " puts new splits to the bottom
set splitright " ensures new splits are to the right of current
" Change Working Directory to that of the current file
cmap cwd lcd %:p:h
cmap cd. lcd %:p:h

" " type `,ev` to edit the Vimrc
nnoremap <leader>ev :vsp $MYVIMRC<CR> 
" " type `,s` to save the buffers etc. Reopen where you were with Vim with `vim
" " -S`
nnoremap <leader>s :mksession!<CR> 

" Allow CTRL+O to create a blank line above in Command mode
" map <C-o> m`O<ESC> 

" Prevent Paste losing the register source:
" http://stackoverflow.com/a/7797434/1147859
xnoremap p pgvy 

" And allow paste in visual to not update register 
vnoremap p "_dP

" Windows management shortcuts 
nmap <C-j> <C-w>j
nmap <C-k> <C-w>k
nmap <C-h> <C-w>h
nmap <C-L> <C-w>l

" Turn off highlighted search with <space> 
map <Space> :noh<cr>

"" Remember cursor position 
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Ignore the node_modules folder for searches 
set wildignore+=**/node_modules/**

" Set clipboard 
if has('unnamedplus')
  set clipboard=unnamedplus
else
  set clipboard=unnamed
endif 

" delimitMate configuration - closing quotes, parens, brackets, etc.
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

set nocompatible              " be improved, required

set list                          " Show invisible characters
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
" off and the line continues beyond the right of the screen

" Function to trim trailing whitespace on save 
function! TrimWhiteSpace()
  %s/\s\+$//e
endfunction

autocmd BufWritePre <buffer> :call TrimWhiteSpace()

" Set Syntastic checkers 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_sass_checkers=["sass_lint"]
let g:syntastic_scss_checkers=["sass_lint"]
let g:syntastic_haml_checkers = ['haml_lint']
let g:syntastic_javascript_checkers = ['eslint']
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:tsuquyomi_disable_quickfix = 1
let g:syntastic_typescript_checkers = ['tsuquyomi']
let g:syntastic_ruby_checkers = ['rubocop']
highlight SyntasticErrorSign ctermbg=234 guifg=#af0000 guibg=#ffffff
highlight SyntasticWarningSign ctermbg=234 guifg=#878700 guibg=#ffffff
let g:syntastic_enable_highlighting = 0 " stop the weird highlighting
" let g:syntastic_error_symbol='✗'
let g:syntastic_error_symbol='X'
" let g:syntastic_warning_symbol='⚠'
let g:syntastic_warning_symbol='*'
" let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_error_symbol = 'X'
" let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_style_warning_symbol = '*'
let g:syntastic_html_tidy_ignore_errors=['proprietary attribute "ng-', 'is not recognized!', 'discarding unexpected', 'attribute name', 'attribute "#']
let g:syntastic_aggregate_errors = 0

let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
" Change cursor when in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

highlight ColorColumn ctermbg=234
" hi cursorcolumn ctermbg=234
hi cursorline ctermbg=234
hi LineNr ctermbg=234
hi CursorLineNr ctermbg=234
hi Search ctermbg=36 ctermfg=white
let g:mta_use_matchparen_group=0
let g:mta_set_default_matchtag_color=0
hi MatchTag ctermfg=white ctermbg=233

let g:indent_guides_auto_colors = 0
" autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=234
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=235
let g:indent_guides_enable_on_vim_startup = 1

