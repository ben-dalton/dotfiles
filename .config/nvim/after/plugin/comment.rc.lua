local status, comment = pcall(require, "nvim_comment")
if (not status) then return end

comment.setup({
  hook = function()
    if vim.api.nvim_buf_get_option(0, "filetype") == "typescriptreact" then
      require("ts_context_commentstring.internal").update_commentstring()
    end
  end
})
