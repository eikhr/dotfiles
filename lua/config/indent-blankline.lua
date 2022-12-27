vim.cmd [[highlight IndentBlanklineContextChar guifg=#777777 gui=nocombine]]
vim.cmd [[highlight IndentBlanklineContextStart guisp=#777777 gui=underline]]

require("indent_blankline").setup({
  char = "▏",
  show_current_context = true,
  show_current_context_start = true,
  show_trailing_blankline_indent = false,
})
