local status, ts = pcall(require, "nvim-treesitter.configs")
if (not status) then return end

ts.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = true,
    disable = {},
  },
  ensure_installed = {
    "tsx",
    "toml",
    "json",
    "yaml",
    "css",
    "html",
    "lua",
    "javascript",
    "typescript"
  },
  autotag = {
    enable = true,
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.tsx.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" }
parser_config.javascript.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" }
parser_config.typescript.filetype_to_parsername = { "javascript", "javascript.jsx", "typescript", "typescript.tsx" }

