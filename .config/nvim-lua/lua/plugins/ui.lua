-- 見た目 (Colorscheme, Lualine, Icons, Dashboard)
return {
  {
    'reireias/molokai',
    lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('molokai2')
    end,
  }
}
