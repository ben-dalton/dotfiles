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
" call minpac#add('tpope/vim-fugitive')
call minpac#add('airblade/vim-gitgutter')
call minpac#add('tpope/vim-obsession')
call minpac#add('tpope/vim-unimpaired')
call minpac#add('tpope/vim-endwise')
call minpac#add('alvan/vim-closetag')
call minpac#add('tpope/vim-commentary')
call minpac#add('tpope/vim-surround')
call minpac#add('tpope/vim-repeat')
" call minpac#add('mhinz/vim-grepper')
call minpac#add('phaazon/hop.nvim')
call minpac#add('godlygeek/tabular')
call minpac#add('endaaman/vim-case-master')
" consider this setting: runtime macros/sandwich/keymap/surround.vim
" call minpac#add('machakann/vim-sandwich')
call minpac#add('ludovicchabant/vim-gutentags')
" call minpac#add('pbrisbin/vim-mkdir')
" call minpac#add('ryvnf/readline.vim')
call minpac#add('Yggdroot/indentLine')
call minpac#add('yssl/QFEnter')
call minpac#add('justinmk/vim-dirvish')
" call minpac#add('itchyny/lightline.vim')
call minpac#add('kyazdani42/nvim-web-devicons')
call minpac#add('nvim-lualine/lualine.nvim')
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
call minpac#add('mhartington/oceanic-next')
call minpac#add('tjdevries/colorbuddy.nvim')
call minpac#add('lalitmee/cobalt2.nvim')

" Plugins for either Vim8 or NeoVim
if has('nvim')
  call minpac#add('nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'})
  call minpac#add('machakann/vim-highlightedyank')
  call minpac#add('nvim-lua/plenary.nvim')
  call minpac#add('MunifTanjim/nui.nvim')
  call minpac#add('nvim-telescope/telescope.nvim', { 'tag': '0.1.0' })
  call minpac#add("nvim-neo-tree/neo-tree.nvim")
  call minpac#add('folke/which-key.nvim')
  call minpac#add('rcarriga/nvim-notify')
  call minpac#add('neovim/nvim-lspconfig')
  call minpac#add('hrsh7th/cmp-nvim-lsp')
  call minpac#add('hrsh7th/cmp-buffer')
  call minpac#add('hrsh7th/cmp-path')
  call minpac#add('hrsh7th/cmp-cmdline')
  call minpac#add('hrsh7th/nvim-cmp')
  call minpac#add('hrsh7th/cmp-vsnip')
  call minpac#add('hrsh7th/cmp-cmdline')
  call minpac#add('williamboman/mason.nvim')
else
  call minpac#add('ctrlpvim/ctrlp.vim')
endif

" Load the plugins right now. (optional)
packloadall
