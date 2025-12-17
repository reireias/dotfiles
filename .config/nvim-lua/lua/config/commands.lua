local create_cmd = vim.api.nvim_create_user_command

create_cmd("VimShowHlGroup", function()
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local syn_id = vim.fn.synID(line, col, 1)
  local trans_id = vim.fn.synIDtrans(syn_id)
  print(vim.fn.synIDattr(trans_id, 'name'))
end, { desc = "Show highlight group under cursor" })

create_cmd("VimShowHlItem", function()
  local line = vim.fn.line('.')
  local col = vim.fn.col('.')
  local syn_id = vim.fn.synID(line, col, 1)
  print(vim.fn.synIDattr(syn_id, 'name'))
end, { desc = "Show highlight item under cursor" })

create_cmd("LspFormat", function()
  vim.lsp.buf.format()
end, { desc = "Format buffer using LSP" })
