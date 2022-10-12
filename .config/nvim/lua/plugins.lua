local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'
  use { 'TimUntersberger/neogit', requires = 'nvim-lua/plenary.nvim' }
  use 'kylechui/nvim-surround' -- surround visual with something
  use 'phaazon/hop.nvim' -- easy cursor movement
  use 'machakann/vim-highlightedyank' -- highlights yanked characters
  use 'wesQ3/vim-windowswap'
  use 'MunifTanjim/nui.nvim'
  use {
    "nvim-neo-tree/neo-tree.nvim", -- file tree
    branch = "v2.x",
    requires = {
      "nvim-lua/plenary.nvim",
      "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
    }
  }
  use 'johmsalas/text-case.nvim' -- change string case
  use 'terrortylor/nvim-comment' -- comment toggling
  use 'JoosepAlviste/nvim-ts-context-commentstring' -- the right kind of comment
  use 'folke/which-key.nvim' -- hints for key bindings
  use 'rcarriga/nvim-notify'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use { 'lalitmee/cobalt2.nvim', requires = 'tjdevries/colorbuddy.nvim' }
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities
  use 'onsails/lspkind-nvim' -- vscode-like pictograms
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client
  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'natecraddock/sessions.nvim'
  use 'glepnir/lspsaga.nvim' -- LSP UIs
  use 'jparise/vim-graphql'
  use 'saadparwaiz1/cmp_luasnip'
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip").config.setup({ history = true })
    end,
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }
  use 'rafamadriz/friendly-snippets'
  use 'kyazdani42/nvim-web-devicons' -- File icons
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })
  use 'akinsho/nvim-bufferline.lua'
  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse
  use 'renerocksai/calendar-vim'
  use 'renerocksai/telekasten.nvim'
end)
