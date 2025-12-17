-- LSP
return {
  "mason-org/mason-lspconfig.nvim",
  opts = {},
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
  },
  opts = {
    ensure_installed = {
      "bashls",
      "cssls",
      "eslint",
      "gopls",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "ruby_lsp",
      "ruff",
      "ts_ls",
      "vue_ls",
    },
  },

  handlers = {
    function(server_name)
      require("lspconfig")[server_name].setup({})
    end,

    ["eslint"] = function()
      require("lspconfig").eslint.setup({
        root_dir = require("lspconfig.util").root_pattern(
          ".eslintrc.js",
          ".eslintrc.cjs",
          ".eslintrc.json",
          ".eslintrc.yaml",
          ".eslintrc.yml",
          "package.json"
        ),
      })
    end,
  },

  config = function(_, opts)
    require("mason-lspconfig").setup(opts)

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }
        local map = vim.keymap.set

        -- Go to Definition
        map("n", "gd", vim.lsp.buf.definition, opts)
        -- Show Documentation
        map("n", "K", vim.lsp.buf.hover, opts)
        -- Rename
        map("n", "<Leader>rn", vim.lsp.buf.rename, opts)
      end,
    })
  end,
}
