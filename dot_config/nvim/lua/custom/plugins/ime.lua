return {
  {
    -- インサートモードを抜ける時にIMEをOFFにする
    'keaising/im-select.nvim',
    event = 'InsertEnter',
    config = function()
      require('im_select').setup {}
    end,
  },
}
