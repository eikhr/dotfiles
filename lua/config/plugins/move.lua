return {
  "fedepujol/move.nvim",
  event = "VeryLazy",
  keys = {
    { "<c-j>", ":MoveLine(1)<cr>", silent = true },
    { "<c-k>", ":MoveLine(-1)<cr>", silent = true },
    { "<c-j>", ":MoveBlock(1)<cr>", mode = "v" },
    { "<c-k>", ":MoveBlock(-1)<cr>", mode = "v", silent = true },
  },
}
