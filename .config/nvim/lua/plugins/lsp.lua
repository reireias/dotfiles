-- LSP
return {
  "mason-org/mason-lspconfig.nvim",
  dependencies = {
    { "mason-org/mason.nvim", opts = {} },
    "neovim/nvim-lspconfig",
    { "folke/lazydev.nvim", ft = "lua", opts = {} },
  },
  opts = {
    ensure_installed = {
      "bashls",
      "cssls",
      "eslint",
      "html",
      "jsonls",
      "lua_ls",
      "pyright",
      "ruff",
      "ts_ls",
      "vue_ls",
    },
  },

  config = function(_, opts)
    require("mason-lspconfig").setup(opts)

    -- config for vue_ls + ts_ls
    vim.lsp.config("ts_ls", {
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = vim.fn.stdpath("data")
              .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
            languages = { "javascript", "typescript", "vue" },
          },
        },
      },
      filetypes = {
        "javascript",
        "typescript",
        "vue",
      },
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "💡",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
      virtual_text = true,
    })

    vim.opt.updatetime = 500
    vim.api.nvim_create_autocmd("CursorHold", {
      callback = function()
        vim.diagnostic.open_float(nil, {
          focusable = false,
          scope = "cursor",
          border = "rounded",
          source = "always",
          close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
        })
      end,
    })

    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local _opts = { buffer = ev.buf, silent = true }
        local map = vim.keymap.set

        -- Go to Definition
        map("n", "gd", vim.lsp.buf.definition, _opts)
        -- Show Documentation
        map("n", "K", vim.lsp.buf.hover, _opts)
        -- Rename
        map("n", "<Leader>rn", vim.lsp.buf.rename, _opts)
      end,
    })
  end,
}
