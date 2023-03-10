return {
  "akinsho/bufferline.nvim",
  lazy = false,
  config = function()
    local signs = require("plugins.lsp.diagnostics").signs

    signs = {
      error = signs.Error,
      warning = signs.Warn,
      info = signs.Info,
      hint = signs.Hint,
    }

    local severities = {
      "error",
      "warning",
      -- "info",
      -- "hint",
    }

    require("bufferline").setup({
      options = {
        show_close_icon = false,
        show_buffer_close_icons = false,
        close_command = "Bdelete! %d",
        right_mouse_command = "Bdelete! %d",
        indicator = {
          style = "none",
        },
        always_show_bufferline = true,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(_, _, diag)
          local s = {}
          for _, severity in ipairs(severities) do
            if diag[severity] then
              table.insert(s, signs[severity] .. diag[severity])
            end
          end
          return table.concat(s, " ")
        end,
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo Tree",
            highlight = "Directory",
            text_align = "center",
          },
        },
      },
    })
  end,
}
