return {
  {
    "catppuccin/nvim",
    -- Without an explicit name, lazy.nvim derives the plugin dir from the repo's last
    -- path segment ("nvim") -- that is what left the stray ~/.local/share/nvim/lazy/nvim clone.
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- Deliberately the flavour-specific name, not plain "catppuccin".
      -- Neovim 0.12 bundles its own runtime/colors/catppuccin.vim, which hardcodes
      -- an opaque Normal bg (guibg=#1e1e2e) and knows nothing about transparent_background.
      -- Both it and the plugin answer to "catppuccin", and the bundled one wins at
      -- startup, so transparency silently never applied. Only the plugin ships
      -- catppuccin-mocha, so this name cannot be shadowed.
      colorscheme = "catppuccin-mocha",
    },
  },
}
