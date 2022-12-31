return {
  "NvChad/nvim-colorizer.lua",
  event = "BufReadPre",
  config = {
    filetypes = {
      "*",
      "!lazy",
      css = { css = true },
    },
    buftype = { "*", "!prompt", "!nofile" },
    user_default_options = {
      names = false,
    },
  },
}
