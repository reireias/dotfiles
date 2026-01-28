-- Coding (Completion/Cmp, Snippets, Copilot, Pairs)
return {
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- Sources
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",

      -- Snippet Engine
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      local sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
      }

      if vim.api.nvim_buf_get_name(0) ~= "" then
        table.insert(sources, {
          name = "path",
          option = {
            get_cwd = function()
              return vim.fn.getcwd()
            end
          }
        })
      end

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        window = {
          documentation = cmp.config.window.bordered(),
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-p>"] = cmp.mapping.select_prev_item(),

          ["<Tab>"] = cmp.mapping(function(fallback)
            local copilot = require("copilot.suggestion")
            if cmp.visible() then
              cmp.select_next_item()
            elseif copilot.is_visible() then
              copilot.accept()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              local col = vim.fn.col('.') - 1
              local line = vim.fn.getline('.')
              local char = line:sub(col, col)
              if col == 0 or char:match('%s') then
                local spaces = string.rep(' ', vim.bo.shiftwidth)
                vim.api.nvim_put({ spaces }, 'c', false, true)
              else
                fallback()
              end
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<CR>"] = cmp.mapping.confirm({ select = true }),

          ["<C-Space>"] = cmp.mapping.complete(),
        }),

        sources = cmp.config.sources(sources, {
          {
            name = "buffer",
            option = {
              get_bufnrs = function()
                return vim.api.nvim_list_bufs()
              end,
            },
          },
        }),
      })
    end,
  },
  {
    "zbirenbaum/copilot.lua",
    lazy = false,
    priority = 1000,
    config = function()
      require("copilot").setup({
        suggestion = {
          enabled = true,
          auto_trigger = true,
          debounce = 200,
          keymap = {
            accept = false,
          },
        },
        panel = { enabled = true },
      })
    end,
    vim.keymap.set("i", "<C-l>", function()
      if require("copilot.suggestion").is_visible() then
        require("copilot.suggestion").accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Right>", true, false, true), "n", false)
      end
    end, { desc = "Copilot Accept (Alternative to Tab)" }),
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "nvim-lua/plenary.nvim", branch = "master" },
    },
    build = "make tiktoken",
  },
}
