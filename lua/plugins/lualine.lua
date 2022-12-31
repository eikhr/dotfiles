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
        { "filename", separator = "", path = 1, symbols = { modified = "  ", readonly = "", unnamed = "" } },
        {
          function()
            local navic = require("nvim-navic")
            local ret = navic.get_location({
              separator = "  ",
            })
            return ret:len() > 2000 and "navic error" or ret
          end,
          cond = function()
            if package.loaded["nvim-navic"] then
              local navic = require("nvim-navic")
              return navic.is_available()
            end
          end,
          color = { fg = "#ff9e64" },
        },
      },
      lualine_z = { clock },
    },
  },
}
