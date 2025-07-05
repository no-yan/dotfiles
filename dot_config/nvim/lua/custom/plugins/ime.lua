local uname = vim.loop.os_uname().sysname
local is_mac = uname == 'Darwin'

return vim.tbl_filter(function(x)
  return x
end, {
  is_mac and {
    'keaising/im-select.nvim',
    event = 'InsertEnter',
    config = function()
      require('im_select').setup {}
    end,
  },
})
