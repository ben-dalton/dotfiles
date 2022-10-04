local keymap = vim.keymap

-- set leader to ,
vim.g.mapleader = ","

-- do not yank with x
keymap.set('n', 'x', '"_x')

-- increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- tabs
keymap.set('n', 'te', ':tabedit<CR>', { silent = true })
-- splits
keymap.set('n', '<leader>s', ':split<CR><C-w>w', { silent = true })
keymap.set('n', '<leader>v', ':vsplit<CR><C-w>w', { silent = true })
-- move cursor between splits
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')
-- resize splits
keymap.set('n', '==', '<C-w>=')
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><up>', '<C-w>+')
keymap.set('n', '<C-w><down>', '<C-w>-')

-- show file tree
keymap.set('n', '<C-n>', ':NeoTreeFocusToggle<CR>')

-- hide highlighted search
keymap.set('n', '<Esc>', ':nohlsearch<cr>')

