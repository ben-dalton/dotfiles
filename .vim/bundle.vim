command! PackUpdate call minpac#update()
command! PackClean  call minpac#clean()

if &compatible
  " `:set nocp` has many side effects. Therefore this should be done
  " only when 'compatible' is set.
  set nocompatible
endif

packadd minpac

call minpac#init()

if !exists('*minpac#init')
  :echom "minpac not found"
  finish
endif

call minpac#init({'verbose': 1})

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" general
call minpac#add('tpope/vim-fugitive')
call minpac#add('tpope/vim-obsession')
call minpac#add('tpope/vim-endwise')
call minpac#add('alvan/vim-closetag')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('mhinz/vim-grepper')
call minpac#add('phaazon/hop.nvim')
call minpac#add('godlygeek/tabular')
" consider this setting: runtime macros/sandwich/keymap/surround.vim
" call minpac#add('machakann/vim-sandwich')
call minpac#add('ludovicchabant/vim-gutentags')
" call minpac#add('pbrisbin/vim-mkdir')
" call minpac#add('ryvnf/readline.vim')
call minpac#add('Yggdroot/indentLine')
call minpac#add('yssl/QFEnter')
call minpac#add('justinmk/vim-dirvish')
call minpac#add('itchyny/lightline.vim')
call minpac#add('kassio/neoterm')

" Front End
" call minpac#add('prettier/vim-prettier', {'do': 'yarn install --frozen-lockfile --production'})
call minpac#add('pangloss/vim-javascript')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('MaxMEllon/vim-jsx-pretty')
call minpac#add('peitalin/vim-jsx-typescript')
call minpac#add('styled-components/vim-styled-components')
call minpac#add('jparise/vim-graphql')

" COC
call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

" call minpac#add('ryanoasis/vim-devicons')
" call minpac#add('knubie/vim-kitty-navigator')

" frameworks
call minpac#add('vimwiki/vimwiki', {'type': 'opt'})

" syntax/lint
" call minpac#add('w0rp/ale')
call minpac#add('sheerun/vim-polyglot')
" call minpac#add('autozimu/LanguageClient-neovim', {
"     \ 'branch': 'next',
"     \ 'do': 'bash install.sh',
"     \ })
"     p

" colors
call minpac#add('chriskempson/base16-vim')
call minpac#add('joshdick/onedark.vim')
" call minpac#add('arcticicestudio/nord-vim')
call minpac#add('dylanaraps/wal.vim')
" call minpac#add('https://gitlab.com/bloodflame/wal.vim')

" Plugins for either Vim8 or NeoVim
if has('nvim')
  call minpac#add('junegunn/fzf', { 'do': { -> fzf#install() } })
  call minpac#add('junegunn/fzf.vim')
  call minpac#add('machakann/vim-highlightedyank')
else
  call minpac#add('ctrlpvim/ctrlp.vim')
endif

" Load the plugins right now. (optional)
packloadall