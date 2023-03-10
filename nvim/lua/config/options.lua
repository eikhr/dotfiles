-- Show line numbers
vim.opt.number = true
vim.opt.relativenumber = true
-- Allow mouse
vim.opt.mouse = "a"
-- Shorter keycombo timeout
vim.opt.timeoutlen = 300
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Line wrap
vim.opt.wrap = true
vim.opt.breakindent = true
-- Better colors
vim.opt.termguicolors = true
-- Update interval
vim.opt.updatetime = 100
-- Autosave
vim.opt.autowrite = true
vim.opt.autowriteall = true

-- Show white space
vim.opt.list = true
vim.opt.listchars:append("space:⋅")
vim.opt.listchars:append("eol:↴")
