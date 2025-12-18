-- UI (Colorscheme, Lualine, Icons, Dashboard)
return {
  {
    "reireias/molokai",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.rehash256 = 1

      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.cmd([[
            highlight link mkdListItem Statement
            highlight link htmlH1 PreProc
            highlight Search ctermfg=255 ctermbg=24
            highlight link HighlightedyankRegion Search
            highlight NormalFloat ctermbg=238
            highlight typescriptMessage ctermfg=252
            highlight Pmenu cterm=NONE
            highlight PmenuSel cterm=underline
            highlight Visual ctermfg=255
            highlight link EndOfBuffer NonText
            highlight CopilotSuggestion guifg=#6272a4

            " seiya.vim like background
            highlight Normal ctermbg=NONE guibg=NONE
            highlight NonText ctermbg=NONE guibg=NONE
            highlight LineNr ctermbg=NONE guibg=NONE
            highlight Folded ctermbg=NONE guibg=NONE
          ]])
        end,
      })

      vim.cmd.colorscheme("molokai2")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    priority = 9000,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      -- vim-airline wombat theme color
      local colors = {
        black = "#141413",
        gray_b = "#32322F",
        gray_c = "#242424",

        normal_a = "#CAE682",
        insert_a = "#FDE76E",
        visual_a = "#B5D3F3",
        replace_a = "#E5786D",

        text_info = "#CAE682",
      }

      local airline_wombat = {
        normal = {
          a = { bg = colors.normal_a, fg = colors.black, gui = "bold" },
          b = { bg = colors.gray_b, fg = colors.normal_a },
          c = { bg = colors.gray_c, fg = colors.normal_a },
        },
        insert = {
          a = { bg = colors.insert_a, fg = colors.black, gui = "bold" },
          b = { bg = colors.gray_b, fg = colors.insert_a },
          c = { bg = colors.gray_c, fg = colors.insert_a },
        },
        visual = {
          a = { bg = colors.visual_a, fg = colors.black, gui = "bold" },
          b = { bg = colors.gray_b, fg = colors.visual_a },
          c = { bg = colors.gray_c, fg = colors.visual_a },
        },
        replace = {
          a = { bg = colors.replace_a, fg = colors.black, gui = "bold" },
          b = { bg = colors.gray_b, fg = colors.replace_a },
          c = { bg = colors.gray_c, fg = colors.replace_a },
        },
        inactive = {
          a = { bg = colors.gray_c, fg = "#767676", gui = "bold" },
          b = { bg = colors.gray_c, fg = "#767676" },
          c = { bg = colors.gray_c, fg = "#767676" },
        },
      }

      require("lualine").setup({
        options = {
          theme = airline_wombat,
          icons_enabled = true,
          section_separators = { left = "", right = "" },
          globalstatus = false,
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },
          lualine_c = { { "filename", file_status = true, path = 0 } },
          lualine_x = { { "filetype", colored = false } },
          lualine_y = { "progress" },
          lualine_z = {
            { "location" },
            {
              "diagnostics",
              symbols = { error = " ", warn = " " },
              colored = false,
            },
          },
        },
        tabline = {
          lualine_a = {
            {
              "buffers",
              show_filename_only = true,
              show_modified_status = true,
              mode = 2,
              max_length = vim.o.columns,
              filetype_names = {
                TelescopePrompt = "Telescope",
                dashboard = "Dashboard",
                packer = "Packer",
                fzf = "FZF",
                alpha = "Alpha",
              },
              use_mode_colors = true,
            },
          },
          lualine_z = { "tabs" },
        },
      })
    end,
  },
  {
    "nvim-mini/mini.pick",
    version = false,
    config = function()
      require("mini.pick").setup()
      vim.ui.select = MiniPick.ui_select
    end,
  },
}
