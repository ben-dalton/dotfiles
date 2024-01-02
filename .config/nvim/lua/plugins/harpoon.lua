return {
  "ThePrimeagen/harpoon",
  config = function()
    require('harpoon').setup()
    local keymap = vim.keymap

    keymap.set('n', '<leader>j', ':lua require("harpoon.ui").toggle_quick_menu()<CR>')
    keymap.set('n', '<leader>a', ':lua require("harpoon.mark").add_file()<CR>')
    keymap.set('n', '<leader>n', ':lua require("harpoon.ui").nav_next()<CR>')
    keymap.set('n', '<leader>p', ':lua require("harpoon.ui").nav_prev()<CR>')
    keymap.set('n', '<leader>fm', ':Telescope harpoon marks<CR>')

    require("telescope").load_extension('harpoon')
  end
}
