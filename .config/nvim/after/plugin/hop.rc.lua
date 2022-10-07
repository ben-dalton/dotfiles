local status, hop = pcall(require, "hop")
if (not status) then return end

hop.setup { keys = 'etovxqpdygfblzhckisuran' }

vim.api.nvim_set_keymap('', 'f',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = true })<cr>"
  , {})
vim.api.nvim_set_keymap('', 'F',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = true })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hw',
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hW',
  "<cmd>lua require'hop'.hint_words({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hf',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hF',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hf',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hf',
  "<cmd>lua require'hop'.hint_char1({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hj',
  "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.AFTER_CURSOR, current_line_only = false })<cr>"
  , {})
vim.api.nvim_set_keymap('', '<leader>hk',
  "<cmd>lua require'hop'.hint_lines_skip_whitespace({ direction = require'hop.hint'.HintDirection.BEFORE_CURSOR, current_line_only = false })<cr>"
  , {})
