local opt = vim.opt

-- Indent
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.list = true
opt.listchars = { tab = "»-" }

-- Log
vim.env.XDG_STATE_HOME = '/tmp'

-- Fold
opt.foldlevel = 100

-- Encoding
opt.fileencodings = { 
  "utf-8", "ucs-bom", "iso-2022-jp-3", "iso-2022-jp", 
  "eucjp-ms", "euc-jisx0213", "euc-jp", "sjis", "cp932" 
}

-- Search
opt.inccommand = "split"

-- Clipboard
opt.clipboard = { "unnamed", "unnamedplus" }

-- Other
opt.cursorline = true
opt.title = true
opt.number = true
opt.mouse = ""
opt.showmode = false
opt.shortmess:append("c")
vim.cmd("language messages C")
