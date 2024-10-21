local option = vim.opt
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    vim.defer_fn(function()
      option.foldmethod = 'expr'
      option.foldexpr = 'nvim_treesitter#foldexpr()'
      option.foldcolumn = '1'
      -- opt.foldtext = ""

      option.foldnestmax = 3
      option.foldlevel = 99
      option.foldlevelstart = 99
    end, 100)
  end,
})
