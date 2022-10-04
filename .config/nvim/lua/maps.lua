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
keymap.set('n', '<leader>tn', ':tabnew<cr>', { silent = true })
keymap.set('n', '<leader>t<leader>', ':tabnext', {silent = true})
keymap.set('n', '<leader>tm', ':tabmove', {silent = true})
keymap.set('n', '<leader>tc', ':tabclose<cr>', {silent = true})
keymap.set('n', '<leader>to', ':tabonly<cr>', {silent = true})

-- splits
keymap.set('n', '<leader>s', ':split<CR><C-w>w', { silent = true })
keymap.set('n', '<leader>v', ':vsplit<CR><C-w>w', { silent = true })

-- move cursor between splits
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')

-- resize splits
keymap.set('n', '<leader>=', '<C-w>=')
keymap.set('n', '<leader><left', '4<C-w><')
keymap.set('n', '<leader><right>', '4<C-w>>')
keymap.set('n', '<leader><up>', '4<C-w>+')
keymap.set('n', '<leader><down>', '4<C-w>-')

-- show file tree
keymap.set('n', '<C-n>', ':NeoTreeFocusToggle<CR>')

-- hide highlighted search
keymap.set('n', '<Esc>', ':nohlsearch<cr>')

