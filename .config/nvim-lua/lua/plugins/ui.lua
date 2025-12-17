-- 見た目 (Colorscheme, Lualine, Icons, Dashboard)
return {
  {
    'reireias/molokai',
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

            " seiya.vim like background
            highlight Normal ctermbg=NONE guibg=NONE
            highlight NonText ctermbg=NONE guibg=NONE
            highlight LineNr ctermbg=NONE guibg=NONE
            highlight Folded ctermbg=NONE guibg=NONE
            highlight EndOfBuffer ctermbg=NONE guibg=NONE
          ]])
        end,
      })

      vim.cmd.colorscheme('molokai2')
    end,
  }
}
