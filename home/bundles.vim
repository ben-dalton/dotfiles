" Vundle setup
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

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
" Plugin 'nanotech/jellybeans.vim'
Plugin 'marciomazza/vim-brogrammer-theme'

Plugin 'mattn/emmet-vim' " expand with ctrl-y ,
Plugin 'kien/ctrlp.vim' " Find files with ctrl-p

Plugin 'cakebaker/scss-syntax.vim'
Plugin 'scrooloose/syntastic'
" Plugin 'gcorne/vim-sass-lint' " requires .sass-lint.yml file in root of project
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'

Plugin 'tpope/vim-unimpaired' " [b for prev buffer
Plugin 'tpope/vim-surround' " cs{[ to change surrounding {} to []
Plugin 'tpope/vim-repeat' " make Plugin actions repeatable
Plugin 'tpope/vim-commentary' " gc to comment in visual mode
Plugin 'nelstrom/vim-visual-star-search' " * to select all words under cursor
Plugin 'wesQ3/vim-windowswap' " <leader>ww to swap windows
Plugin 'moll/vim-bbye'
Plugin 'gorodinskiy/vim-coloresque' " highlight hex colors
Plugin 'mohitleo9/vim-fidget' " js fiddle set up
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive' " git wrapper for vim
Plugin 'rhysd/committia.vim' " nice git commit layout

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

