local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup("vimrc_filetype", { clear = true })
local augroup_general = vim.api.nvim_create_augroup("vimrc_general", { clear = true })

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.tf", "*.tfvars" },
  group = augroup,
  command = "set filetype=terraform",
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.jenkinsfile",
  group = augroup,
  command = "set filetype=groovy",
})

autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.css", "*.scss", "*.less" },
  group = augroup,
  command = "setlocal foldmethod=marker foldmarker={,}",
})

autocmd("FileType", {
  pattern = "gitcommit",
  group = augroup,
  command = "set textwidth=0",
})

autocmd("FileType", {
  pattern = "go",
  group = augroup,
  callback = function()
    vim.opt_local.expandtab = false
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})

autocmd("FileType", {
  pattern = { "html", "javascript", "typescript", "json", "jsonc", "ruby", "xml", "yaml", "vim", "vue", "lua" },
  group = augroup,
  command = "setlocal shiftwidth=2 tabstop=2",
})

autocmd("FileType", {
  pattern = "markdown",
  group = augroup,
  command = "setlocal conceallevel=2",
})

autocmd("FileType", {
  pattern = "vue",
  group = augroup,
  command = "syntax sync fromstart",
})

autocmd("FileType", {
  pattern = "zsh",
  group = augroup,
  callback = function()
    vim.opt_local.foldmethod = "marker"
    vim.cmd("highlight link FoldComment SpecialComment")
    vim.cmd([[match FoldComment /^#.*\({{{\|}}}\)/]])
  end,
})

autocmd("TextYankPost", {
  group = augroup_general,
  callback = function()
    vim.highlight.on_yank({
      higroup = "HighlightedyankRegion",
      timeout = 1000,
    })
  end,
})

autocmd("VimResized", {
  group = augroup_general,
  pattern = "*",
  command = "wincmd =",
})
