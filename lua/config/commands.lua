local augroup = vim.api.nvim_create_augroup('user_cmds', {clear = true})

-- q to close help window
vim.api.nvim_create_autocmd('FileType', {
  pattern = {'help', 'man'},
  group = augroup,
  desc = 'Use q to close help/man window',
  command = 'nnoremap <buffer> q <cmd>quit<cr>'
})

-- highlight yanked text
vim.api.nvim_create_autocmd('TextYankPost', {
  group = augroup,
  desc = 'Highlight on yank',
  callback = function()
    vim.highlight.on_yank({higroup = 'Visual', timeout = 200})
  end
})
