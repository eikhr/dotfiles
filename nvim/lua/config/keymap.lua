-- Save
vim.keymap.set("n", "<leader>w", "<cmd>write<cr>", { desc = "Save" })

-- Move to window
vim.keymap.set("n", "<leader>mh", "<C-w>h")
vim.keymap.set("n", "<leader>mj", "<C-w>j")
vim.keymap.set("n", "<leader>mk", "<C-w>k")
vim.keymap.set("n", "<leader>ml", "<C-w>l")

-- Move to window using the arrow keys
vim.keymap.set("n", "<left>", "<C-w>h")
vim.keymap.set("n", "<down>", "<C-w>j")
vim.keymap.set("n", "<up>", "<C-w>k")
vim.keymap.set("n", "<right>", "<C-w>l")

-- Resize window using shift + arrow keys
vim.keymap.set("n", "<S-Up>", "<cmd>resize +2<CR>")
vim.keymap.set("n", "<S-Down>", "<cmd>resize -2<CR>")
vim.keymap.set("n", "<S-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set("n", "<S-Right>", "<cmd>vertical resize +2<CR>")

-- Copy/paste from system clipboard
vim.keymap.set({ "n", "x" }, "cp", '"+y', { desc = "Copy" })
vim.keymap.set({ "n", "x" }, "cv", '"+p', { desc = "Paste" })

-- Delete without yanking
vim.keymap.set({ "n", "x" }, "x", '"_x', { desc = "Delete" })

-- Select all
vim.keymap.set("n", "<leader>a", ":keepjumps normal! ggVG<cr>", { desc = "Select all" })

-- Better indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

-- Toggle Format on Save
vim.keymap.set("n", "<leader>tf", require("plugins.lsp.formatting").toggle, { desc = "Toggle Format on Save" })
