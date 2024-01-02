return {
  "rcarriga/nvim-notify",
  config = function()
    vim.notify = require("notify")
    require("notify").setup({
      background_colour = "#333333",
    })
    require("telescope").load_extension("notify")
  end,
}
