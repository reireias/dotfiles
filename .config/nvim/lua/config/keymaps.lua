local map = vim.keymap.set

-- General
map("i", "jj", "<ESC>", { silent = true })
map("n", "<Leader>w", "<cmd>w<CR>")
map("n", "<Esc><Esc>", "<cmd>nohlsearch<CR>")
map({ "n", "v" }, "<Leader>h", "^")
map({ "n", "v" }, "<Leader>H", "0")
map({ "n", "v" }, "<Leader>l", "$")

-- Windows & Buffers
map("n", "sh", "<C-w>h")
map("n", "sj", "<C-w>j")
map("n", "sk", "<C-w>k")
map("n", "sl", "<C-w>l")
map("n", "s<Left>", "<C-w>h")
map("n", "s<Down>", "<C-w>j")
map("n", "s<Up>", "<C-w>k")
map("n", "s<Right>", "<C-w>l")
map("n", "<Leader><Tab>", "<C-w>w")
map("n", "st", "<C-w>t")
map("n", "sb", "<C-w>b")

map("n", "<Leader>bp", "<cmd>bprevious<CR>")
map("n", "<Leader>bn", "<cmd>bnext<CR>")
map("n", "<Leader>bb", "<cmd>e #<CR>")
map("n", "<Leader>bd", "<cmd>bdelete<CR>")

map("n", "<C-n>", "<cmd>cnext<CR>")
map("n", "<C-p>", "<cmd>cprevious<CR>")

-- Other / Terminal
map("s", "<CR>", "<BS>i")
map("t", "<Esc>", "<C-\\><C-n>", { silent = true })
