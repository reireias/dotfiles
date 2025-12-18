if vim.loader then
  vim.loader.enable()
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "

require("config.options")
require("config.keymaps")
require("config.commands")
require("config.autocmds")
require("config.lazy")
