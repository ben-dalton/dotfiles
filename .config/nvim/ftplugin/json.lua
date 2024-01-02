-- Adds comma when pressing O for new line in json files
vim.keymap.set('n', 'o', function()
  local line = vim.api.nvim_get_current_line()

  print('hey')
  local should_add_comma = string.find(line, '[^,{[]$')
  if should_add_comma then
    print('should_add_comma')
    return 'A,<cr>'
  else
    print('nope')
    return 'o'
  end
end, { buffer = true, expr = true })
