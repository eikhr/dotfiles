-- Leader key
vim.g.mapleader = ' '

-- Save
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})

-- Copy/paste from system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y', {desc = 'Copy'})
vim.keymap.set({'n', 'x'}, 'cv', '"+p', {desc = 'Paste'})

-- Delete without yanking
vim.keymap.set({'n', 'x'}, 'x', '"_x', {desc = 'Delete'})

-- Select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc = 'Select all'})

-- Move text
vim.keymap.set('n', '<C-j>', ':MoveLine(1)<CR>', { silent = true })
vim.keymap.set('n', '<C-k>', ':MoveLine(-1)<CR>', { silent = true })
vim.keymap.set('n', '<C-h>', ':MoveHChar(-1)<CR>', { silent = true })
vim.keymap.set('n', '<C-l>', ':MoveHChar(1)<CR>', { silent = true })
vim.keymap.set('v', '<C-j>', ':MoveBlock(1)<CR>', { silent = true })
vim.keymap.set('v', '<C-k>', ':MoveBlock(-1)<CR>', { silent = true })
vim.keymap.set('v', '<C-h>', ':MoveHBlock(-1)<CR>', { silent = true })
vim.keymap.set('v', '<C-l>', ':MoveHBlock(1)<CR>', { silent = true })

-- Open sidebar
vim.keymap.set('n', '<leader>o', ':Neotree<cr>', {desc = 'Open sidebar'})
