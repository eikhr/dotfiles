local function clock()
  return " " .. os.date("%H:%M")
end

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  config = {
    options = {
      globalstatus = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch" },
      lualine_c = {
        { "diagnostics", sources = { "nvim_diagnostic" } },
        { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
        { "filename", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
      },
      lualine_z = { clock },
    },
  },
}
