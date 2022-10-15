require('colorbuddy').colorscheme('cobalt2')

-- execute "set colorcolumn=" . join(range(120,335), ',')
-- highlight ColorColumn ctermbg=0 guibg=#3A3A3A
-- highlight OverLength ctermbg=DarkRed ctermfg=white guibg=#592929
-- match OverLength /\%121v.\+/
--
vim.cmd [[
  " highlight current cursor line in current buffer only 
  augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal nocursorline
    au WinLeave * setlocal nocursorline
  augroup END
]]
