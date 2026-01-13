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


-- <leader>yd to yank diagnostics at the current line
local function yank_line_diagnostics()
  local diags = vim.diagnostic.get(0, { lnum = vim.fn.line(".") - 1 })
  if vim.tbl_isempty(diags) then
    vim.notify("No diagnostics on this line", vim.log.levels.WARN)
    return
  end

  local lines = {}
  for _, d in ipairs(diags) do
    table.insert(lines, string.format(
      "[%s] %s (%s)",
      vim.diagnostic.severity[d.severity],
      d.message,
      d.source or "LSP"
    ))
  end

  vim.fn.setreg("+", table.concat(lines, "\n"))
  vim.notify("Line diagnostics copied", vim.log.levels.INFO)
end

vim.keymap.set("n", "<leader>yd", yank_line_diagnostics, {
  desc = "Yank diagnostics at cursor"
})
