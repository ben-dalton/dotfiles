vim.cmd('autocmd!')

vim.scriptencoding = 'utf-8'
vim.opt.encoding = 'utf-8'
vim.opt.fileencoding = 'utf-8'

vim.wo.number = true

vim.opt.ai = true -- auto indent
vim.opt.autoindent = true
vim.opt.backspace = 'start,eol,indent'
vim.opt.backup = false
vim.opt.backupskip = '/tmp/*,/private/tmp/*'
vim.opt.breakindent = true
vim.opt.cmdheight = 1
vim.opt.expandtab = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.inccommand = 'split'
vim.opt.laststatus = 2
vim.opt.path:append { '**' } -- finding files - search in subfolders
vim.opt.scrolloff = 10
vim.opt.shell = 'zsh'
vim.opt.shiftwidth = 2
vim.opt.showcmd = true
vim.opt.si = true -- smart indent
vim.opt.signcolumn = 'yes:1'
vim.opt.smartcase = true
vim.opt.smarttab = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.tabstop = 2
vim.opt.textwidth = 0
vim.opt.title = true
vim.opt.wildignore:append { '*/node_modules/*' }
vim.opt.wrap = true -- wrap lines
vim.opt.wrapmargin = 5
vim.opt.writebackup = false
vim.opt.swapfile = false

-- Turn off paste mode when leaving insert
vim.api.nvim_create_autocmd('InsertLeave', {
  pattern = '*',
  command = 'set nopaste'
})

-- set text width for markdown
vim.api.nvim_create_autocmd(
  { "BufRead", "BufNewFile" },
  { pattern = { "*.txt", "*.md" }, command = "setlocal textwidth=80" }
)

vim.api.nvim_create_autocmd(
  { "BufWritePre" },
  { pattern = { "*.tsx", "*.ts" }, command = "OrganizeImports" }
)

vim.opt.formatoptions:append { ':rcqt' }
