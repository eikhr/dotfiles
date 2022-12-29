-- Save
vim.keymap.set('n', '<leader>w', '<cmd>write<cr>', {desc = 'Save'})

-- Copy/paste from system clipboard
vim.keymap.set({'n', 'x'}, 'cp', '"+y', {desc = 'Copy'})
vim.keymap.set({'n', 'x'}, 'cv', '"+p', {desc = 'Paste'})

-- Delete without yanking
vim.keymap.set({'n', 'x'}, 'x', '"_x', {desc = 'Delete'})

-- Select all
vim.keymap.set('n', '<leader>a', ':keepjumps normal! ggVG<cr>', {desc = 'Select all'})
