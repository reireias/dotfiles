return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "v0.2.0",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")
      local map = vim.keymap.set

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
}
