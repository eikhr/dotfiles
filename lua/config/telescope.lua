require('telescope').setup({
  extensions = {
    fzf = {
      case_mode = "smart_case",
    }
  }
})

require('telescope').load_extension('fzf')
