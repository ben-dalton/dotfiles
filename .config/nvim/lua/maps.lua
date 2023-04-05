local keymap = vim.keymap

-- set leader to space
vim.g.mapleader = " "

-- do not yank with x
keymap.set('n', 'x', '"_x')

-- move lines in visual mode
keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- keep cursor in place with join
keymap.set('n', 'J', 'mzJ`z')

-- keep paste buffer after replacing word
keymap.set('x', '<leader>p', "\"_dP")

-- increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- tabs
keymap.set('n', '<leader>tn', ':tabnew<cr>', { silent = true })
keymap.set('n', '<leader>tm', ':tabmove ')
keymap.set('n', '<leader>tc', ':tabclose<cr>', { silent = true })
keymap.set('n', '<leader>to', ':tabonly<cr>', { silent = true })
keymap.set('n', '<leader>tf', ':tabfirst<cr>', { silent = true })
keymap.set('n', '<leader>tl', ':tablast<cr>', { silent = true })

-- splits
keymap.set('n', '<leader>ss', ':split<CR>')
keymap.set('n', '<leader>sj', ':botright split<CR>')
keymap.set('n', '<leader>sk', ':topleft split<CR>')
keymap.set('n', '<leader>vv', ':vsplit<CR>')
keymap.set('n', '<leader>vh', ':topleft vsplit<CR>')
keymap.set('n', '<leader>vl', ':botright vsplit<CR>')

-- move splits
keymap.set('n', '<leader>wr', '<C-w>r') -- rotate windows downwards/rightwards
keymap.set('n', '<leader>wR', '<C-w>R') -- rotate windows upwards/leftwards
keymap.set('n', '<leader>wx', '<C-w>x') -- exchange current window with next one
keymap.set('n', '<leader>wk', '<C-w>K') -- move current window to top, full width
keymap.set('n', '<leader>wj', '<C-w>J') -- move current window to bottom, full width
keymap.set('n', '<leader>wh', '<C-w>H') -- move current window to left, full height
keymap.set('n', '<leader>wl', '<C-w>L') -- move current window to left, full height
keymap.set('n', '<leader>wt', '<C-w>T') -- move current window to a new tab

-- move cursor between splits
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')

-- resize splits
keymap.set('n', '<leader>=', '<C-w>=')
keymap.set('n', '<leader><left', '4<C-w><')
keymap.set('n', '<leader><left>', '4<C-w>>')
keymap.set('n', '<leader><up>', '4<C-w>+')
keymap.set('n', '<leader><down>', '4<C-w>-')

-- close quickview window
keymap.set('n', '<leader>ccl', ':ccl')

-- show file tree
keymap.set('n', '<C-n>', ':NeoTreeFocusToggle<CR>')

-- hide highlighted search
keymap.set('n', '<Esc>', ':nohlsearch<cr>')

-- replace word under cursor
keymap.set('n', '<leader>S', ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<left><left><left>")

-- scroll the viewport faster
keymap.set('n', '<C-e>', '3<C-e>')
keymap.set('n', '<C-y>', '3<C-y>')

-- make moving up/down work on wrapped lines of text
keymap.set('n', 'j', 'gj', { silent = true })
keymap.set('n', 'k', 'gk', { silent = true })
keymap.set('n', '^', 'g^', { silent = true })
keymap.set('n', '$', 'g$', { silent = true })
