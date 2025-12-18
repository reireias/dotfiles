-- 操作・移動 (Tree Sitter, Telescope)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
      require("nvim-treesitter").setup({})
      require("nvim-treesitter").install({
        "bash",
        "c",
        "diff",
        "go",
        "hcl",
        "javascript",
        "json",
        "lua",
        "make",
        "nginx",
        "perl",
        "python",
        "ruby",
        "terraform",
        "yaml",
        "zsh",
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = { "<filetype>" },
        callback = function() vim.treesitter.start() end,
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
      require("nvim-ts-autotag").setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = false,
        },
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({
        check_ts = true,
      })
    end,
  },
  {
    "rcmdnk/vim-markdown",
    ft = { "markdown" },
    config = function()
      vim.g.vim_markdown_folding_level = 6
    end,
  },
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "gbprod/yanky.nvim",
    },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local map = vim.keymap.set

      require("yanky").setup({})
      telescope.setup({
        extensions = {
          yank_history = {},
        },
      })

      telescope.load_extension("yank_history")

      -- found .git: git_files
      -- not found .git: find_files
      map("n", "<C-f>", function()
        local ok = pcall(builtin.git_files, { show_untracked = true })
        if not ok then
          builtin.find_files()
        end
      end, { desc = "Smart Find Files" })

      map("n", "<Leader>ff", builtin.find_files, { desc = "Find Files" })
      map("n", "<Leader>fg", builtin.live_grep, { desc = "Live Grep" })
      map("n", "<Leader>fb", builtin.buffers, { desc = "Find Buffers" })
      map("n", "<Leader>fh", builtin.help_tags, { desc = "Find Help" })
      map("n", "<Leader>o", builtin.treesitter, { desc = "Outline (Treesitter)" })
      map("n", "<Leader>y", "<cmd>Telescope yank_history<cr>", { desc = "Yank History" })

      -- Conflicts with EscEsc, so it is overwritten
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "TelescopePrompt",
        callback = function(event)
          local opts = { buffer = event.buf, nowait = true }
          map("n", "<Esc>", function() actions.close(event.buf) end, opts)
        end,
      })
    end,
  },
  {
    "kana/vim-operator-replace",
    dependencies = { "kana/vim-operator-user" },
    config = function()
      vim.keymap.set("n", "R", "<Plug>(operator-replace)", { silent = true })
    end,
  },
  { "tpope/vim-fugitive" },
  { 'tpope/vim-rhubarb' },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    config = function()
      require("toggleterm").setup({
        start_in_insert = true,
      })

      vim.keymap.set({ 'n', 't' }, '<C-t>', '<cmd>ToggleTerm<cr>', { desc = "Toggle Terminal" })

      vim.keymap.set('n', '<leader>r', function()
        local file = vim.fn.expand('%')
        local cmd = ""
        if vim.bo.filetype == 'python' then
          cmd = "python3 " .. file
        elseif vim.bo.filetype == 'javascript' then
          cmd = "node " .. file
        elseif vim.bo.filetype == 'sh' then
          cmd = "bash " .. file
        end
        if cmd ~= "" then
          vim.cmd("TermExec cmd='" .. cmd .. "'")
        end
      end, { desc = "Run current file" })
    end,
  },
}
