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

-- Better indenting in visual mode
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Clear search with <esc>
vim.keymap.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>")

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
vim.keymap.set("n", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("x", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("o", "n", "'Nn'[v:searchforward]", { expr = true })
vim.keymap.set("n", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("x", "N", "'nN'[v:searchforward]", { expr = true })
vim.keymap.set("o", "N", "'nN'[v:searchforward]", { expr = true })

local wk = require("which-key")

local leader = {
  a = { ":keepjumps normal! ggVG<cr>", "Select all" },
  l = { ":Lazy<cr>", "Open Lazy.nvim" },
  s = { ":write<cr>", "Save" },
  u = { ":UndotreeToggle<cr>", "Toggle UndoTree" },
  [" "] = "Find Files", -- Defined in ../plugins/telescope.lua
  g = {
    name = "+git",
    g = { ":LazyGit<cr>", "open LazyGit" },
    c = { "<Cmd>Telescope git_commits<CR>", "commits" },
    b = { "<Cmd>Telescope git_branches<CR>", "branches" },
    s = { "<Cmd>Telescope git_status<CR>", "status" },
  },
  w = {
    name = "+windows",
    w = { "<C-W>p", "Cycle Windows" },
    d = { "<C-W>c", "Delete Window" },
    s = { "<C-W>s", "New Window Below" },
    v = { "<C-W>v", "New Window Right" },
    h = { "<C-W>h", "Select Window Left" },
    j = { "<C-W>j", "Select Window Down" },
    l = { "<C-W>l", "Select Window Right" },
    k = { "<C-W>k", "Select Window Up" },
    H = { "<C-W>5<", "Expand Window Left" },
    J = { ":resize +5<cr>", "Expand Window Down" },
    L = { "<C-W>5>", "Expand Window Right" },
    K = { ":resize -5<cr>", "Expand Window Up" },
    ["="] = { "<C-W>=", "Balance Windows" },
  },
  b = {
    name = "+buffers",
    b = { ":b#<cr>", "Previous Buffer" },
    s = { ":BufferLinePick<cr>", "Pick Buffer" },
    p = { ":BufferLineTogglePin<cr>", "Pin Buffer" },
    k = { ":BufferLineCycleNext<cr>", "Next Buffer" },
    j = { ":BufferLineCyclePrev<cr>", "Previous Buffer" },
    d = {
      name = "+delete",
      d = { ":Bdelete<cr>", "Delete Current Buffer" },
      s = { ":BufferLinePickClose<cr>", "Delete Picked Buffer" },
      k = { ":BufferLineCloseRight<cr>", "Delete Buffers to the Right" },
      j = { ":BufferLineCloseLeft<cr>", "Delete Buffers to the Left" },
    },
    m = {
      name = "+move",
      k = { ":BufferLineMoveNext<cr>", "Move Buffer to the Right" },
      j = { ":BufferLineMovePrev<cr>", "Move Buffer to the Left" },
    },
  },
  f = {
    name = "+find",
    f = { ":Telescope find_files<cr>", "Find File" },
    s = { ":Telescope current_buffer_fuzzy_find<cr>", "Find in Current File" },
    g = { ":Telescope live_grep<cr>", "Find in Files" },
    b = { ":Telescope buffers<cr>", "Find Open Buffer" },
    h = { ":Telescope help_tags<cr>", "Find Help" },
    i = { ":Telescope highlights<cr>", "Find Highlight" },
    m = { ":Telescope man_pages<cr>", "Find Man Page" },
  },
  n = {
    name = "+noice",
    l = { ":Noice last<cr>", "Last Message" },
    h = { ":Noice history<cr>", "History" },
    f = { ":NoiceTelescope<cr>", "Find Message" },
  },
  t = {
    name = "+toggle",
    f = { require("plugins.lsp.formatting").toggle, "Toggle Format on Save" },
    -- TODO: s to toggle spell check
  },
}

wk.register(leader, { prefix = "<leader>" })
