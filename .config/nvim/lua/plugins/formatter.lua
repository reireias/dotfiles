-- Formatter Plugins (Conform)
return {
  {
    "stevearc/conform.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local conform = require("conform")

      conform.setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "ruff_format" },
          javascript = { "prettier" },
          typescript = { "prettier" },
          javascriptreact = { "prettier" },
          typescriptreact = { "prettier" },
          vue = { "prettier" },
          css = { "prettier" },
          html = { "prettier" },
          json = { "prettier" },
          go = { "goimports", "gofmt" },
          terraform = { "terraform_fmt" },
        },
        format_on_save = nil,
      })

      vim.api.nvim_create_user_command("Format", function()
        conform.format({
          async = true,
          lsp_fallback = true,
        })
      end, { desc = "Format file with conform" })

      vim.api.nvim_create_user_command("F", "Format", {
        desc = "Alias for :Format",
      })
    end,
  },
}
